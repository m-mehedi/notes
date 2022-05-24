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
  "private_key_id": "1e2a2994c3b6459ebf7f33119d2a0714902635bd",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCtn0VFa/OLjGJ4\nS/6W//rWXfEhN6a72dciNZODLe3qj+C7mI2RWF3WLW9H1YFSIMbLQNdNGbkgGMJo\n+lnTNiapNF66jt6b1qTOH6jHmJkBtgjEWL3pZ/s6c3RDKfhA+NvJv5gjfs4c6utn\n7pzwfL66dKGyuoPQcPDuP8vIOGt38qKdtoEMp7nSeENXFwSRRc1P7Qz/sF9Y03XK\nvjBRk/+s/amii0kKz8AiVpGbtE2O2H08H/364fuCRBnu3TGgsyFbWlTgkSR6Einy\nmK8dYMu4JsC/E+Nh4rn0uBdILohd36oQ/VhiAVF1whQ9l1qvd99HdAUBWXB8uPXK\nBGpWTimFAgMBAAECggEAAUq8cY4ia3kUSSrfmRth2siA1oDF19irdiYJ6UxP3JKi\nLHiFIn4S11jSiX6i42E6ZCF2Y1d7/it7qYZQtsv3W65NFNGirGwwy8ExOKhVCHiP\nS3lm6F64CtujE4DeHQr9BQeiR9lWCqG2Ng7GJ4VLcghoz539rxu4Ceh69Awfbe64\nIhz1GR/5moMjtJeabSzuxsMO3a7fQz5S6b85uh50QKeqzfLN0bhxmOjoLP8ITrV2\nA1zaNsOGqyvjPhARnP2eHE+ec8BwLZaeskdu/m1NV6AsZw+ANSjZQM6CAZJWmSZy\nAiznB0jtLXmfiHXcrA+XwXB4HbC0cyBmYticH9sRPQKBgQDd59zETJyKOyBKc7VX\nJoUmU3JMn7cH/C3yLSTbt4bV99MYYDW8FyKG1ke/2LWDXj7D5JVzj0VY3byxG5y3\nB/27nbRfcecKIKlYa7xMZUsMjxz/G7dcmZI8RzbyY6w+CLMRboevJD5jvb5Mcz/o\nDMPjIxHVtgbDi48DnsDDkrhdZwKBgQDITEnKWwpHTtxR655i/Yy1JSmUakKwBH9J\nIlaWkIHbQhHUIR4z9dA6gumtl1CyhynhgW7EBCiR1AHa8KkdH9lkB0h3mZfEPmSk\n9Y6MyccgI4SUXqTUINOC7uYIVCRpDFvCITGpJJZqRVSeRowMT59CHlDrffyvevRO\nmxSYsilCMwKBgHdvtqmJOrBEBqtMAAy6VOw9+cU4KcGIgApbNf10mIRN8TarggCM\nyy6b4t5le70LWukA/VfHg2HDZy5EWGNDT9RNm6nLmrkev0cyJZVQ58YIuWituFGE\n7uq2weJQt4JkGE2HmkwwS8xPcj+fwIPbawuz8oN+h8F0OjOOnN4m+Eh9AoGAVSpq\n7cnMEwnrEEIZNIoOvC8zANI1zNX8sUISgy6qqGntXr8+MmXAxkBHz/HY9DAYlLQO\nPvZtsaPtrgRKRAH401ltbL04FM9ax/FJTX+2VWoEw3mCqFfU14Vw9fWhDbGdimvG\ny96svj8AfdQNVGa+lsSBL8CAIrUrEAlMtqh6dpUCgYAlF1EnF/OSCgOXK3GMg4Bb\n3ftZfzHs4fKPWOf8r3mxUU8iTNnGolpsucFYVmeza+f/xa2xHCvBsSK0c8MmuB3J\n1RVroW46PBIXHLOxgATUXWdiYPJdFHvdmmbNf3gAiB9uVf7LRnA/cgY40JD7H34X\ne+cB7/f4DUEk66J56AjCUw==\n-----END PRIVATE KEY-----\n",
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