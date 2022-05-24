## DOTENV

## STEP: 01 (Dependecies)
1. Add dependencies to `package.json`
   ` "dotenv": "^9.0.2"`

2. Require packages
`const dotenv = require('dotenv');`
`require('dotenv').config();`

## STEP: 02 (DOT.ENV interceptor creation)
```

// dot env interceptor
const EnvironmentCheckInterceptor = {
  process(handlerInput) {
    // load environment variable from .env
    dotenv.config();

    // check for process.env.S3_PERSISTENCE_BUCKET
    if (!process.env.S3_PERSISTENCE_BUCKET) {
      handlerInput.attributesManager.setRequestAttributes({ invalidConfig: true });
    }
  },
};
```

## STEP: 03 (Add to Skill Builder)
```
exports.handler = Alexa.SkillBuilders.custom()
    .addRequestHandlers(
        LaunchIntentHandler,
        IntentReflectorHandler)
    .addRequestInterceptors(
        EnvironmentCheckInterceptor
        )
    .addErrorHandlers(
        ErrorHandler)
    .withApiClient(new Alexa.DefaultApiClient())  // calls APIs to access personal informations
    .withCustomUserAgent('sample/hello-world/v1.2')
    .lambda();
```