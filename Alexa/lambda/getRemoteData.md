## Step:01 (Node Function)
```
const getRemoteData = (url) => new Promise((resolve, reject) => {
  const client = url.startsWith('https') ? require('https') : require('http');
  const request = client.get(url, (response) => {
    if (response.statusCode < 200 || response.statusCode > 299) {
      reject(new Error(`Failed with status code: ${response.statusCode}`));
    }
    const body = [];
    response.on('data', (chunk) => body.push(chunk));
    response.on('end', () => resolve(body.join('')));
  });
  request.on('error', (err) => reject(err));
});
```

## Usage
```

const YesterdaySummaryIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'YesterdaySummaryIntent'
            || (Alexa.getRequestType(handlerInput.requestEnvelope) === 'Alexa.Presentation.APL.UserEvent' &&
               handlerInput.requestEnvelope.request.arguments[0] === 'yesterday');
    },
    async handle(handlerInput) {
        await getRemoteData(`${externalAPI}`)
          .then((response) => {
            const data = JSON.parse(response);
                let title1=data.yesterday1.titleText;
                let speakText1=data.yesterday1.speakText;
                let displayText1=data.yesterday1.displayText;
                let title2=data.yesterday2.titleText;
                let speakText2=data.yesterday2.speakText;
                let displayText2=data.yesterday2.displayText;
                
                let lastUpdated=data.time.lastUpdatedDisplay;
                let mobileDisplay = data.yesterday1.mDisplayText;
                
                if (!supportsAPL(handlerInput)) {
                    var intro_doc = require('./APLA/APLA_docIntro.json');

                    handlerInput.responseBuilder
                    .addDirective({
                    type: 'Alexa.Presentation.APLA.RenderDocument',
                    document: intro_doc,
                    datasources: {
                      data: {
                        type: 'object',
                        properties: {
                            "bodyText":`${introTheme} ${greet} ${speakText1} ${speakText2} . To hear another report you can say, report one or report three. Which one would you like to try?`,
                        },
                      },
                    },
                  });

                  return handlerInput.responseBuilder                  
                  .withSimpleCard(`${title1}`, `${mobileDisplay}`)
                  .reprompt("You can say, report one for sales analysis <phoneme alphabet='ipa' ph='laiv'>live</phoneme> or report three for Month to date sales analysis.")
                  .getResponse();
                }   
                
        return handlerInput.responseBuilder
            .speak(introTheme)
            .addDirective({                      
              "type": "Alexa.Presentation.APL.RenderDocument",
              "document": require('./APL/yesterday/apl.json'),
              "datasources": {
                  "card": {
                      "type": "object",
                      "properties": {
                          "pagerData": [
                              {
                                  "text": displayText1,
                                  "id": "one",
                                  "pageText": switchVoice(speakText1,""),
                                  "HeaderText": title1
                              },
                              {
                                  "text": displayText2,
                                  "id": "two",
                                  "pageText": switchVoice(speakText2,""),
                                  "HeaderText": title2
                              },
                              {
                                  "text": "Thanks for watching. <br>To see another report you can say, <br><i>'Alexa, Open report one'</i> or <br><i>'Alexa, Open report three'</i>",
                                  "id": "Ending",
                                  "pageText": switchVoice("To see another report<break time='0.3s'/> you can say, 'Alexa,<break time='0.5s'/> Open report One' or 'Alexa,<break time='0.5s'/> Open report Three'",""),
                                  "HeaderText": "Thank you"
                              }
                          ],
                          "uploadTime": `${lastUpdated}`,
                          "preambleSsml": `<speak>Greetings to AHD report. Today is ${speakDate} </speak>`
                      },
                      "transformers": [
                          {
                              "inputPath": "pagerData[*].pageText",
                              "outputName": "textSpeech",
                              "transformer": "ssmlToSpeech"
                          },
                          {
                              "inputPath": "preambleSsml",
                              "outputName": "preambleSpeech",
                              "transformer": "ssmlToSpeech"
                          }
                      ]
                  }
              }
                      
            })
            
          })
    
        return handlerInput.responseBuilder
          .getResponse();
          
    
        
    }
};

```