## API List
const userId = Alexa.getUserId(handlerInput.requestEnvelope);
const deviceId = Alexa.getDeviceId(handlerInput.requestEnvelope);
const locale = Alexa.getLocale(handlerInput.requestEnvelope);
const sessionStatus = Alexa.isNewSession(handlerInput.requestEnvelope);
const viewPortProfile = Alexa.getViewportProfile(handlerInput.requestEnvelope);
const viewPortOrientation = Alexa.getViewportOrientation(handlerInput.requestEnvelope);
// let {deviceID} = handlerInput.requestEnvelope.context.System.device.deviceId;

// Data from account linking
let accessToken = handlerInput.requestEnvelope.context.System.user.accessToken;
let url = `https://api.amazon.com/user/profile?access_token=${accessToken}`;

const deviceAddressServiceClient = serviceClientFactory.getDeviceAddressServiceClient();
const upsServiceClient = serviceClientFactory.getUpsServiceClient();

const profileName = await upsServiceClient.getProfileName();
const profileEmail = await upsServiceClient.getProfileEmail();
const profileMobileObject = await upsServiceClient.getProfileMobileNumber();
const profileMobile = profileMobileObject.phoneNumber;
const usertimeZone = await upsServiceClient.getSystemTimeZone(deviceId);
const localTime = new Date(new Date().toLocaleString(locale, {timeZone: usertimeZone}));

const address = await deviceAddressServiceClient.getFullAddress(deviceId);
// const shortAddress = await deviceAddressServiceClient.getCountryAndPostalCode(deviceId);
const ADDRESS_MESSAGE = `${address.addressLine1}, ${address.stateOrRegion}-${address.postalCode},${address.city}`;            
// const ADDRESS2_MESSAGE = `Here is your full address: ${address.addressLine2}, ${address.countryCode}, ${address.city}, ${address.districtOrCounty}`;
// const SHORT_MESSAGE = `Here is your full address: ${shortAddress.ShortAddress}`;

// const distanceUnit = await upsServiceClient.getSystemDistanceUnits(deviceId);
// const userDistanceUnit = distanceUnit.DistanceUnits;
// const temperatureUnit = await upsServiceClient.getSystemTemperatureUnit(deviceId);
// const userProfileTemperatureUnit = terperatureUnit.TemperatureUnit;
// const systemTimeZone = await upsServiceClient.getSystemTimeZone(deviceId);