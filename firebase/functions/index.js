/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const logger = require("firebase-functions/logger");
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const express = require("express");

admin.initializeApp({
  locationId: 'asia-northeast3',
});

const firestore = admin.firestore();
const messaging = admin.messaging();
const app = express();
const api = express.Router();

app.use(cors());
app.use(express.json());
app.use('/v1', api);

exports.api = functions.region('asia-northeast3').https.onRequest(app);


/* --------------------------------------------------------------------------------------------- */
/* -------------------------------------- Trigger Functions ------------------------------------ */
/* --------------------------------------------------------------------------------------------- */

exports.SignUp = functions.region('asia-northeast3').auth.user().onCreate((user) => {
    const { uid, displayName } = user;

    const beforeNickname = displayName.replace(/\s/g, '');
    const afterNickname = beforeNickname.length < 15 ? beforeNickname : beforeNickname.substring(0, 15);

    return firestore.collection('users').doc(uid).get()
      .then((docSnapshot) => {
        if (docSnapshot.exists) {
          return;
        } else {
          firestore.collection('users').add({
            id: uid,
            nickname: afterNickname,
            is_allowed_notification: true,
            device_token: '',
            create_at: admin.firestore.FieldValue.serverTimestamp(),
          });
        }
      })
      .catch((error) => {
        logger.error('Error checking document existence', error);
      });
  }
);

exports.Withdrawal = functions.region('asia-northeast3').auth.user().onDelete(async (user) => {
    const { uid } = user;

    const userDoc = await firestore.collection('users').where('id', '==', uid).get();

    userDoc.forEach((doc) => {
      doc.ref.delete();
    });

    return;
  }
);


/* --------------------------------------------------------------------------------------------- */
/* ---------------------------------------- Https Functions ------------------------------------ */
/* --------------------------------------------------------------------------------------------- */

api.post('/notifications', async (req, res) => {
    const { data } = req.body;

    let message;
    const type = "notification";

    // Body Validation
    try {
      message = data.message;
    } catch (error) {
      logger.error("Invalid request body");
      res.status(400).json();
      return;
    }

    // Duplicate Message Log In 1 minute
    const endAt = new Date(Date.now());
    const startAt = new Date(endAt - 60000);

    // Find Send User Device Token
    const users = await getReceviedUsers(message, type, startAt, endAt);
    const userIds = users.map((user) => user.id);
    const deviceTokens = users.map((user) => user.device_token);

    // Save Notification Log
    firestore.collection('notification_logs').add({
      message,
      type,
      user_id: userIds,
      create_at: admin.firestore.FieldValue.serverTimestamp(),
    });

    // Send Notification
    for (const deviceToken of deviceTokens) {
      const message = {
        token: deviceToken,
        notification: {
          title: "양식장에 새로운 소식이 도착했습니다",
          body: message,
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
      };

      await messaging.send(message)
    }

    res.status(200).json();
  }
);

const getReceviedUsers = async (message, type, startAt, endAt) => {
  // Caluculate time range
  const endAt = new Date(Date.now());
  const startAt = new Date(endAt - 60000);

  // Read notification logs
  const notificationLogs = await firestore.collection('notification_logs')
    .where("message", "==", message)
    .where("type", "==", type)
    .get();

  // Filter duplicated notification logs
  const duplicatedNotificationLogs = notificationLogs.docs.filter((doc) => {
    const createAt = doc.data().create_at.toDate();
    return createAt >= startAt && createAt <= endAt;
  });

  // Get duplicated user ids
  const userIds = duplicatedNotificationLogs.reduce((acc, doc) => {
    const userId = doc.data().user_id;
    if (!acc.includes(userId)) {
      acc.push(userId);
    }
    return acc;
  }, []);

  // Read all users
  const totalUsers = await firestore.collection('users').get();

  // Filter users who have not received the notification
  const receivedUsers = totalUsers.docs.filter((doc) => {
    return !userIds.includes(doc.data().id);
  });

  return receivedUsers;
};
