import * as admin from "firebase-admin";
import * as functions from "firebase-functions";
import * as logger from "firebase-functions/logger";
import * as express from "express";
import * as cors from "cors";
import { UserRecord } from "firebase-admin/auth";
import { DocumentData, FieldValue } from "firebase-admin/firestore";


admin.initializeApp();

const firestore = admin.firestore();

exports.SignUp = functions.region('asia-northeast3').auth.user().onCreate(async (user : UserRecord) => {
    const uid: string = user.uid!;
    const displayName: string = user.displayName!;

    const beforeNickname = displayName.replace(/\s/g, '');
    const afterNickname = beforeNickname.length < 15 ? beforeNickname : beforeNickname.substring(0, 15);

    const userDoc: DocumentData = firestore.collection('users').doc(uid).get();

    if (userDoc.exists) {
        return;
    }

    const now: FieldValue = admin.firestore.FieldValue.serverTimestamp();

    try {
        // Create user document
        await firestore.collection('users').doc(uid).set({
            "id": uid,
            "nickname": afterNickname,
            "is_allowed_notification": true,
            "device_token": null,
            "created_at": now,
        });

        // Create user notification document
        await firestore.collection('user_notifications').doc(uid).set({
            "updated_at": now,
        });

        // Create welcome notification in user notification document
        await firestore.collection('user_notifications').doc(uid).collection('notifications').doc().set({
            "content": "Nailed It에 오신 것을 환영합니다!",
            "created_at": now,
            "is_read": false,
        });
    } catch (error) {
        logger.error("SignUp Error: ", error);
    }

    return;
});

exports.Withdrawal = functions.region('asia-northeast3').auth.user().onDelete(async (user : UserRecord) => {
    const uid: string = user.uid!;

    const userDoc: DocumentData = firestore.collection('users').doc(uid).get();

    if (!userDoc.exists) {
        return;
    }

    try {
        await firestore.collection('users').doc(uid).delete();
    } catch (error) {
        logger.error("Withdrawal Error: ", error);
    }

    return;
});

const messaging = admin.messaging();

const app = express();
const jsonParser = express.json();
const urlencodedParser = express.urlencoded({ extended: false });
const corsOptions = cors({ origin: true });

app.use(jsonParser);
app.use(urlencodedParser);
app.use(corsOptions);

exports.api = functions.region('asia-northeast3').https.onRequest(app);

app.post('/v1/notifications', async (req, res) => {
    // time out 10 seconds
    req.setTimeout(10000);
    res.setTimeout(10000);

    let content: string;

    // Check request body
    try {
        content = req.body.content;

        if (content === null || content === undefined || content === "") {
            throw new Error("Invalid request body");
        }
    } catch (error) {
        return res.status(400).json(
            { 
                success: false,
                data: null,
                error: {
                    code: 40000,
                    message: "Invalid request body",
                },
            }
        );
    }

    const users: any = await getReceviedUsers(content, 'notification');
    const userIds: string[] = users.map((user: any) => user.data().id);

    // If there are no users to send notifications
    if (users.length === 0) {
        return res.status(201).json(
            {
                success: true,
                data: {
                    receivers: [],
                },
                error: null,
            }
        );
    }

    const now: FieldValue = admin.firestore.FieldValue.serverTimestamp();

    // Save notification log
    await firestore.collection('notification_logs').add({
        "content": content,
        "type": "notification",
        "to_user_ids": userIds,
        "created_at": now,
    });

    // Send notifications
    const completedUserIds: string[] = [];
    for (const user of users) {
        const uid: string = user.id;
        const deviceToken: string = user.data().device_token;

        // Device token is not set
        if (deviceToken === null || deviceToken === undefined || deviceToken === "") {
            continue;
        }

        // Save notification
        // If the notification is not saved, the notification is not sent
        let notificationId: string;
        try {
            await firestore.collection('user_notifications').doc(uid).update({
                "updated_at": now,
            });
            
            const notification: DocumentData = await firestore.collection('user_notifications').doc(uid).collection('notifications').add({
                "content": content,
                "created_at": now,
                "is_read": false,
            });

            notificationId = notification.id;
        } catch (error) {
            logger.error("Failed to save notification - id: ", uid, " error: ", error);
            continue;
        }

        // Send notification
        // If the notification is not sent, the notification is deleted
        try {
            await messaging.send(
                {
                    token: deviceToken,
                    notification: {
                        title: "양식장에 새로운 소식이 도착했습니다",
                        body: content,
                    },
                    data: {
                        type: "message",
                    },
                    apns: {
                        payload: {
                            aps: {
                                sound: "default",
                            },
                        },
                    },
                }
            )
        } catch (error) {
            logger.error("Failed to send notification - id: ", user.data().id, " error: ", error);

            await firestore.collection('user_notifications').doc(uid).collection('notifications').doc(notificationId).delete();
            
            continue;
        }

        // Save completed user id
        completedUserIds.push(user.data().id);
    }


    return res.status(201).json(
        {
            success: true,
            data: {
                receivers: completedUserIds,
            },
            error: null,
        }
    );
});

const getReceviedUsers = async (content: string, type: string) => {
    const endAt: any = new Date(Date.now());
    const startAt: any = new Date(endAt - 60000);

    // Read notification Logs
    const notificationLogs : DocumentData = await firestore.collection('notification_logs')
        .where('created_at', '>=', startAt)
        .where('created_at', '<=', endAt)
        .get();

    // Filter notification logs by time range
    const duplicatedNotificationLogs = notificationLogs.docs.filter((doc: any) => {
        const logContent: string = doc.data().content;
        const logType: string = doc.data().type;

        return logContent === content && logType === type;
    });

    // Get all received user ids in the time range
    var beforeReceivedUserIds: string[] = [];

    for (const doc of duplicatedNotificationLogs) {
        const currentUserIds: string[] = doc.data().to_user_ids;

        beforeReceivedUserIds = beforeReceivedUserIds.concat(currentUserIds);
    }

    // Remove duplicate user ids
    const userIds: string[] = Array.from(new Set(beforeReceivedUserIds));
    
    // Read All Users
    const totalUsers: DocumentData = await firestore.collection('users')
        .where('is_allowed_notification', '==', true)
        .get();

    // Filter users who have not received the notification
    const receivedUsers: DocumentData = totalUsers.docs.filter((doc: any) => {
        return !userIds.includes(doc.data().id);
    });

    return receivedUsers;
};