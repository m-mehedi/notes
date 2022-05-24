## STEP: 01 (Create Slot)
Build > Slot Types >Add New Slot Type > slot name

## STEP: 02 (Catch Slot Value)
`let intent = handlerInput.requestEnvelope.request.intent;`
`let consentType = intent.slots.report_consent.value;`