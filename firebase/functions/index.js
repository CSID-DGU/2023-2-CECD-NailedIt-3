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
