## Localization

## Step:01
1. Add dependencies to `package.json`
    ```
    "i18next": "^20.2.4",
    "i18next-sprintf-postprocessor": "^0.2.2",
        ```
2. Require packages
`const i18n = require('i18next');`
`const sprintf = require('i18next-sprintf-postprocessor');`

## Step:02 (Language Strings Creation)
1. create a folder named `languages`
2. create a file using locale `en-US`
    ```
    module.exports = {
        translation: {
            SKILL_NAME: 'AHD Report',
            FALLBACK: [
            'Sorry, I don\'t know about that. There might be something wrong. Can you please try again?'
            ],
            INTENT_REFLECTOR: [
            'You just triggered %s.',
            'You reached to %s.',
            'You triggered %s.',
            ],
            NOTIFY_MISSING_PERMISSIONS_ACC_INFO: 'Please enable profile permissions in the Amazon Alexa app.',
            ERROR_ACC_INFO: 'Uh Oh. Looks like something went wrong.',
            CANCEL_STOP_RESPONSE: [
            'Good bye',
            'Okay. I\'ll be here if you need me.',
            ]
        },
    };

    ```
3. `LanguageStrings.js` file define in `lambda\languages` dir
```
module.exports = {
  "en-US": require("./en-US.js"),
  "en-IN": require("./en-IN.js"),
  "hi-IN": require("./hi-IN.js")
};
```


## Step:03 (Setting Up LanguageStrings)
Add languageStrings `const languageStrings = require('./languages/languageStrings');`

## Step:04 (Localization Interceptor)
```
const LocalizationInterceptor = {
  process(handlerInput) {
    const { requestEnvelope, attributesManager } = handlerInput;

    const localizationClient = i18n.use(sprintf).init({
      lng: requestEnvelope.request.locale,
      fallbackLng: 'en-US',
      resources: languageStrings,
    });

    localizationClient.localize = (...args) => {
      // const args = arguments;
      const values = [];

      for (let i = 1; i < args.length; i += 1) {
        values.push(args[i]);
      }
      const value = i18n.t(args[0], {
        returnObjects: true,
        postProcess: 'sprintf',
        sprintf: values,
      });

      if (Array.isArray(value)) {
        return value[Math.floor(Math.random() * value.length)];
      }
      return value;
    };

    const attributes = attributesManager.getRequestAttributes();
    attributes.t = (...args) => localizationClient.localize(...args);
  },
};
```

## Step:05 (Add Inteceptor in SkillBuilders)
```
exports.handler = Alexa.SkillBuilders.custom()
    .addRequestHandlers(
        LaunchIntentHandler,
        FallbackIntentHandler,
        SessionEndedRequestHandler,
        IntentReflectorHandler)
    .addRequestInterceptors(
        LocalizationInterceptor,
        )
    .addErrorHandlers(
        ErrorHandler)
    .withApiClient(new Alexa.DefaultApiClient())  // calls APIs to access personal informations
    .withCustomUserAgent('sample/hello-world/v1.2')
    .lambda();
```