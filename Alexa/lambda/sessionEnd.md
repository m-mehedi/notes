## Session End (withShouldEndSession)
```

const EndSession = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
        && (Alexa.getIntentName(handlerInput.requestEnvelope) === 'EndSession'
        || Alexa.getIntentName(handlerInput.requestEnvelope) === 'AMAZON.StopIntent'
        // || (Alexa.getRequestType(handlerInput.requestEnvelope) === 'Alexa.Presentation.APL.UserEvent' &&
        // handlerInput.requestEnvelope.request.source.id === 'exitBtn')
        // || (Alexa.getRequestType(handlerInput.requestEnvelope) === 'Alexa.Presentation.APL.UserEvent' &&
        //       handlerInput.requestEnvelope.request.arguments[0] === 'exitButton')
               )
        
        || (Alexa.getRequestType(handlerInput.requestEnvelope) === 'Alexa.Presentation.APL.UserEvent' &&
            handlerInput.requestEnvelope.request.arguments[0] === 'exitButton');
    },
    handle(handlerInput) {
        if (!supportsAPL(handlerInput)) {
            return handlerInput.responseBuilder
            .speak('')
            .withShouldEndSession(true)
            .getResponse();
        }

        return handlerInput.responseBuilder
        .addDirective({
            "type": "Alexa.Presentation.APL.RenderDocument",
            "document": require('./APL/Exit/exitAPL.json'),
                    "datasources": require('./APL/Exit/exitAPLdata.json')
        })
        .withShouldEndSession(true)
        .getResponse();
    }
};

```