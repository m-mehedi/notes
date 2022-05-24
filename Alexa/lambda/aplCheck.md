## STEP: 01 (Check APL Function)
```
function supportsAPL(handlerInput) {
  const supportedInterfaces = handlerInput.requestEnvelope.context.System.device.supportedInterfaces;
  const aplInterface = supportedInterfaces['Alexa.Presentation.APL'];
  return aplInterface !== null && aplInterface !== undefined;
}
```

## STEP: 02 (Usage)
```
if (!supportsAPL(handlerInput)) {
            return handlerInput.responseBuilder
            .speak('')
            .withShouldEndSession(true)
            .getResponse();
        }
```