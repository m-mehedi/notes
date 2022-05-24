## Set APL
```
{
    "type": "APL",
    "version": "1.6",
    "license": "Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.\nSPDX-License-Identifier: LicenseRef-.amazon.com.-AmznSL-1.0\nLicensed under the Amazon Software License  http://aws.amazon.com/asl/",
    "theme": "dark",
    "settings": { "idleTimeout": 120000 },
    "import": [
        {
            "name": "alexa-layouts",
            "version": "1.3.0"
        }
    ],
    "layouts": {
        "AlexaImageList": {
            "parameters": [
                {
                    "name": "theme",
                    "description": "Colors will be swiched depend on the specified theme (light/dark). Default to dark theme",
                    "type": "string",
                    "default": "dark"
                },
                {
                    "name": "headerBackButtonCommand",
                    "description": "Command that is issued when back button is pressed.",
                    "type": "any",
                    "default": {
                        "type": "SendEvent",
                        "arguments": [
                            "goBack"
                        ]
                    }
                },
                {
                    "name": "exitBtnCommand",
                    "description": "Command that is issued when exit button is pressed.",
                    "type": "any",
                    "default": {
                        "type": "SendEvent",
                        "arguments": [
                            "exit"
                        ]
                    }
                },
                {
                    "name": "exitBtn",
                    "description": "Toggle to display back button in header. Defaults to false.",
                    "type": "any"
                }
            ],
            "items": [
                {
                    "type": "Container",
                    "width": "100%",
                    "height": "100%",
                    "entities": "${entities}",
                    "items": [
                        {
                            "type": "AlexaBackground"
                        },
                        {
                            "type": "AlexaHeader"
                        },
                        {
                            "type": "Container",
                            "height": "100vh",
                            "justifyContent": "${(@viewportProfile == @hubRoundSmall || @viewportProfile == @hubLandscapeSmall || @viewportProfile == @tvLandscapeOverlay) ? 'start' : 'center'}",
                            "top": "${@viewportProfile == @tvLandscapeOverlay ? '50dp' : 'auto'}",
                            "width": "100%",
                            "shrink": "1",
                            "paddingBottom": "0",
                            "items": [
                                {},
                                {
                                  "type": "AlexaButton",
                                  "alignSelf": "end",
                                  "paddingBottom": "5dp",
                                  "paddingRight": "8vh",
                                  "accessibilityLabel": "exit button",
                                  "buttonText": "exit",
                                  "buttonStyle": "contained",
                                  "id": "exitBtn",
                                    "primaryAction": [
                                        {
                                            "type": "SendEvent",
                                            "arguments": [
                                                "exitButton"
                                            ]
                                        },
                                      {
                                        "type": "SetValue",
                                        "componentId": "exitBtn",
                                        "property": "buttonText",
                                        "value": "closed"
                                      },
                                      {
                                        "type": "SetValue",
                                        "componentId": "exitBtn",
                                        "property": "buttonStyle",
                                        "value": "ingress"
                                      }
                                  
                                    ]
            
                                }
                            ]
                        }
                        
                    ]
                }
            ]
        }
    },
    "mainTemplate": {
        "parameters": [
            "payload"
        ],
        "items": [
            {
                "type": "AlexaImageList",
                "id": "reportList",
                "headerTitle": "${payload.imageListData.title}",
                "headerSubtitle": "${payload.imageListData.headerSubtitle}",
                "headerBackButton": false,
                "headerDivider": false,
                "headerAttributionImage": "${payload.imageListData.logoUrl}",
                "backgroundImageSource": "${payload.imageListData.backgroundImage.sources[0].url}",
                "backgroundBlur": false,
                "backgroundColorOverlay": false,
                "imageAspectRatio": "square",
                "imageMetadataPrimacy": true,
                "imageScale": "best-fill",
                "listItems": "${payload.imageListData.listItems}",
                "hintText": "${payload.imageListData.hintText}",
                "theme": "dark"
            }
        ]
    }
}
```

## Usage
```
canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
        && (Alexa.getIntentName(handlerInput.requestEnvelope) === 'EndSession'
        || Alexa.getIntentName(handlerInput.requestEnvelope) === 'AMAZON.StopIntent'
               )
        
        || (Alexa.getRequestType(handlerInput.requestEnvelope) === 'Alexa.Presentation.APL.UserEvent' &&
            handlerInput.requestEnvelope.request.arguments[0] === 'exitButton');
    },
```