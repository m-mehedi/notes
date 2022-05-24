## STEP: 01 (Add Argument to APL datasource)
```
{
    "imageListData": {
        "type": "object",
        "objectId": "imageListSample",
        "backgroundImage": {},
        "title": "AHD Sales Report",
        "headerSubtitle": "SK+F",
        "listItems": [
            {
                "primaryText": "Sales Analysis Live",
                "imageSource": "https://ahds3.s3.amazonaws.com/ahd/ahdreport/resource/thumbnails/Thumbnail1.png",
                "primaryAction": [
                    {
                        "type": "SetValue",
                        "componentId": "reportList",
                        "property": "headerSubtitle",
                        "value": "${payload.imageListData.listItems[0].primaryText} is selected"
                    },
                    {
                        "type": "SendEvent",
                        "arguments": [
                            "live"
                        ]
                    }
                ]
            }
        ],
        "logoUrl": "https://ahds3.s3.amazonaws.com/ahd/ahdreport/resource/img/AHDlogo.png",
        "hintText": "Try, \"Alexa, report 1, 2 or 3\""
    }
}
```

## Usage 
```
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
        && (Alexa.getIntentName(handlerInput.requestEnvelope) === 'ChartIntent')
        || (Alexa.getRequestType(handlerInput.requestEnvelope) === 'Alexa.Presentation.APL.UserEvent' &&
               handlerInput.requestEnvelope.request.arguments[0] === 'chartTouchEvent');
    },

```