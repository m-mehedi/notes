## APLA File Render
```
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
```

## APLA Document Sample
```
{
  "type": "APLA",
  "version": "0.9",
  "description": "This document demonstrates key components used to create audio responses.",
  "compositions": {},
  "resources": [],
  "mainTemplate": {
    "parameters": [
      "payload"
    ],
    "item": {
          "description": "This allows us to add a spoken item that is not a text item in the APL document.",
          "type": "Speech",
          "contentType": "SSML",
          "content": "${payload.data.properties.bodyText}"
    }
  }
}
```