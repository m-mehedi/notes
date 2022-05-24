## STEP: 01 (ADD TWILIO SID & TOKEN)
`TWILIO_ACC_SID=AC3700f51b83690af5fa99ef4fa64d4bc7`
`TWILIO_AUTH_TOKEN=c1ab4e6a9a862c1ccd83b7d82d961498`

## STEP: 02 (Dependencies)
1. Add dependencies to `package.json`
`"twilio": "^3.62.0",`
2. Require packages
`const accountSid = process.env.TWILIO_ACC_SID;`
`const authToken = process.env.TWILIO_AUTH_TOKEN;`
`const client = require('twilio')(accountSid, authToken);`

## STEP: 03
CONFIGURE YOU TWILIO

## STEP: 04
```
            // Smart Notification
              client.messages
                  .create({body: `Hi, I am Alexa. Welcome to AHD report. ${outputSpeech}`, from: '+17207990766', to: '+8801985440869'})
                 .then(message => console.log(message.sid));


            // WhatsApp Notification
            client.messages
                  .create({
                    from: 'whatsapp:+14155238886',
                    body: `Hi, I am Alexa. Welcome to AHD report. ${outputSpeech}`,
                    mediaUrl: ['https://desert-barracuda-2351.twil.io/assets/Alexa.png'], 
                    to: 'whatsapp:+8801985440869'
                  })
                  .then(message => console.log(message.sid));
```