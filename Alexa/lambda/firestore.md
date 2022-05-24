## Step: 01 (Dependencies)
1. Add dependencies to `package.json`
` "firebase-admin": "^8.9.2",`

## STEP: 02 (Add Dependency)
`const admin = require("firebase-admin");`

## STEP: 03 (Create service account file in `lambda\log\firebase.json` )
```
{
  "type": "service_account",
  "project_id": "alexa-8b17d",
  "private_key_id": "",
  "private_key": "-----BEGIN PRIVATE KEY-----\n\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-ewq6t@alexa-8b17d.iam.gserviceaccount.com",
  "client_id": "102097729387003562784",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ewq6t%40alexa-8b17d.iam.gserviceaccount.com"
}
```
## STEP: 04 (Service Account)
`const serviceAccount = require("./log/firebase.json");`

## STEP: 05 (Initialize firestore)
```
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
//   databaseURL: 'https://<DATABASE_NAME>.firebaseio.com'
});
const DB = admin.firestore();
```
## STEP: 05 (Usage)
```
        // Firestore
        await DB.collection('AHD').add({
                Address: ADDRESS_MESSAGE,
                Name: userName,//profileName,
                DATE: TRANSDATE
            })
```