const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
exports.helloworld = functions.database.ref("status/state").onUpdate(evt => {
    const theft_alert = {
        notification: {
            title: "Message from Porch Guard",
            body: "THEFT ALERT: Your alarm has been triggered.",
            badge: "1",
            sound: "defualt"

        }
    };
    const delivery_alert = {
        notification: {
            title: "Message from Porch Guard",
            body: "Your package has been delivered and is being monitored.",
            badge: "1",
            sound: "defualt"
        }
    };
    const reset_alert = {
        notification: {
            title: "Message from Porch Guard",
            body: "Your system has been reset to idle state.",
            badge: "1",
            sound: "defualt"
        }
    };
    const error_alert = {
        notification: {
            title: "Message from Porch Guard",
            body: "System Failed !",
            badge: "1",
            sound: "defualt"
        }
    };
    return admin.database().ref("fcm-token").once("value").then(allToken => {
        if (allToken.val()) {
            console.log("token available");
            admin.database().ref("status/state").once('value', (snap) => {
                console.log(JSON.stringify(snap.val()));
                if (snap.val() == 0) {
                    const token = Object.keys(allToken.val());
                    return admin.messaging().sendToDevice(token, reset_alert);
                } else if (snap.val() == 1) {
                    const token = Object.keys(allToken.val());
                    return admin.messaging().sendToDevice(token, delivery_alert);
                } else if (snap.val() == 2) {
                    const token = Object.keys(allToken.val());
                    return admin.messaging().sendToDevice(token, theft_alert);
                } else {
                    const token = Object.keys(allToken.val());
                    return admin.messaging().sendToDevice(token, error_alert);
                }
            });
            
            
        } else {
            console.log("token unavailable");
        }

    });

});
