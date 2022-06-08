## APL pager
```
"const LiveSummaryIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'LiveSummaryIntent';
    },
    async handle(handlerInput) {
        let outputSpeech = ""<speak><audio src='https://ahdnews.s3.us-east-2.amazonaws.com/NewsEffect.mp3'/></speak>"";
        await getRemoteData('https://ahdnews.s3.us-east-2.amazonaws.com/data.json')
          .then((response) => {
            const data = JSON.parse(response);
                let title1=data[0].titleText;
                let speakText1=data[0].speakText;
                let displayText1=data[0].displayText;
                
        return handlerInput.responseBuilder
            .addDirective({                      
              ""type"": ""Alexa.Presentation.APL.RenderDocument"",
              ""document"": require('./APL/liveSales/apl.json'),
              ""datasources"": {
                  ""card"": {
                      ""type"": ""object"",
                      ""properties"": {
                          ""pagerData"": [
                              {
                                  ""text"": displayText1,
                                  ""id"": ""one"",
                                  ""pageText"": switchVoice(speakText1,""Matthew""),
                                  ""HeaderText"": title1
                              },
                              {
                                  ""text"": ""Thanks for watching. That's all for now."",
                                  ""id"": ""Ending"",
                                  ""pageText"": switchVoice(""Thanks for watching."",""Matthew""),
                                  ""HeaderText"": ""Thank you""
                              }
                          ],
                          ""uploadTime"": ``,
                          ""preambleSsml"": `<speak>Greetings from AHD News. Today is ${speakDate} </speak>`
                      },
                      ""transformers"": [
                          {
                              ""inputPath"": ""pagerData[*].pageText"",
                              ""outputName"": ""textSpeech"",
                              ""transformer"": ""ssmlToSpeech""
                          },
                          {
                              ""inputPath"": ""preambleSsml"",
                              ""outputName"": ""preambleSpeech"",
                              ""transformer"": ""ssmlToSpeech""
                          }
                      ]
                  }
              }
                      
            })
            
          })
    
        return handlerInput.responseBuilder
          .speak(outputSpeech)
          .getResponse();
          
    
        
    }
};"

```

## Pager Data
```
"{
    ""type"": ""APL"",
    ""version"": ""1.4"",
    ""settings"": {},
    ""theme"": ""dark"",
    ""import"": [
        {
            ""name"": ""alexa-layouts"",
            ""version"": ""1.2.0""
        }
    ],
    ""resources"": [],
    ""styles"": {},
    ""graphics"": {},
    ""commands"": {},
    ""layouts"": {},
  ""mainTemplate"": {
                  ""parameters"": [
                      ""card""
                  ],
                  ""item"": {
                      ""type"": ""Container"",
                      ""id"": ""cardSlideshowContainer"",
                      ""width"": ""100%"",
                      ""height"": ""100%"",
                      ""speech"": ""${card.properties.preambleSpeech}"",
                      ""items"": [
                           {
                        ""type"": ""AlexaBackground"",
                        ""backgroundImageSource"": ""https://ahdnews.s3.us-east-2.amazonaws.com/bg/bg-4.jpg"",
                        ""backgroundBlur"": false,
                        ""colorOverlay"": true,
                        ""backgroundScale"": ""best-fill""
                    },
                          {
                          ""type"": ""Pager"",
                          ""navigation"": ""wrap"",
                          ""id"": ""cardSlideshow"",
                          ""numbered"": true,
                          ""height"": ""100%"",
                          ""width"": ""100%"",
                          ""data"": ""${card.properties.pagerData}"",
                          ""items"": {
                              ""type"": ""Container"",
                              ""direction"": ""col"",
                              ""id"": ""slideContainer"",
                              ""shrink"": 0,
                              ""width"": ""100%"",
                              ""height"": ""100%"",
                              ""items"": [
                                   {
                                        ""type"": ""AlexaHeader"",
                                        ""headerTitle"": ""${data.HeaderText}"",
                                        ""headerAttributionImage"": ""https://ahdnews.s3.us-east-2.amazonaws.com/bg/AHDlogo.png"",
                                        ""headerDivider"": false,
                                        ""headerAttributionPrimacy"": false
                                    },
                                      {
                                      ""type"": ""Text"",
                                      ""textAlign"":""right"",
                                      ""fontStyle"":""normal"",
                                      ""id"": """",
                                      ""text"": ""${card.properties.uploadTime}"",
                                      ""color"": ""#e3ff00"",
                                      ""fontSize"": 15,
                                      ""fontWeight"": ""bold"",
                                      ""fontFamily"": ""Consolas"",
                                      ""paddingRight"": 20
                                  },
                                  {
                                      ""type"": ""Text"",
                                      ""id"": ""${data.id}"",
                                      ""text"": ""${data.text}"",
                                      ""speech"": ""${data.textSpeech}"",
                                      ""color"": ""#ffffff"",
                                      ""width"": ""100%"",
                                      ""fontSize"": 32,
                                      ""fontFamily"": ""Arial"",
                                      ""fontWeight"": ""100"",
                                      ""paddingLeft"": 110,
                                      ""paddingTop"": 5,
                                      ""paddingRight"": 10
                                  }
                                
                              ]
                          }
                      }]
                  }
              },
  ""onMount"": [
                  {
                      ""type"": ""Sequential"",
                      ""commands"": [
                          {
                              ""type"": ""SpeakItem"",
                              ""componentId"": ""cardSlideshowContainer""
                          },
                          {
                              ""type"": ""SpeakItem"",
                              ""componentId"": ""one""
                          },
                          {
                              ""type"": ""SetPage"",
                              ""componentId"": ""cardSlideshow"",
                              ""position"": ""relative"",
                              ""delay"": 1000,
                              ""value"": 1
                          },
                          {
                              ""type"": ""SpeakItem"",
                              ""componentId"": ""Ending""
                          },
                          {
                              ""type"": ""SetPage"",
                              ""componentId"": ""cardSlideshow"",
                              ""position"": ""relative"",
                              ""delay"": 1000,
                              ""value"": 1
                          }
                      ]
                  }
              ]
}"
```