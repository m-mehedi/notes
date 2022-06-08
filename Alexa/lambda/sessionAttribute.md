## Session Attribute
```
async handle(handlerInput) {
        const otpValue = handlerInput.requestEnvelope.request.intent.slots.OTP.value;
        // const otpValue = Math.floor((Math.random() * 10000) + 1);
        let speechText = `Your OTP is <say-as interpret-as=""spell-out"">${otpValue}</say-as>. and I remembered it. You can ask me about it.`;
        
        const attributesManager = handlerInput.attributesManager;
        const responseBuilder = handlerInput.responseBuilder;
        
        const attributes = await attributesManager.getSessionAttributes() || {};
        attributes.otpValue = otpValue;
        attributesManager.setSessionAttributes(attributes);
```