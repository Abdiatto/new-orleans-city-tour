export default {
  validateLength(value, minLength, maxLength) {
    let message = "";
    let isValid = true;
    if (!value || value.length < minLength) {
      message = `Field must be at least ${minLength} characters`;
      isValid = false;
    }
    if (value && value.length > maxLength) {
      message = `Field can not be longer than ${maxLength} characters`;
      isValid = false;
    }
    return { isValid, message };
  },
  validateZip(value) {
    const isValid = /(^\d{5}$)|(^\d{5}-\d{4}$)/.test(String(value));
    const message = isValid ? "" : "Not a valid ZIP Code.";
    return { isValid, message };
  },
  validateSelect(value) {
    let isValid = true;
    let message = "";
    if (!value || value.length < 1) {
      isValid = false;
      message = "Please select an option.";
    }
    return { isValid, message };
  },
  validateFile(value) {
    let isValid = true;
    let message = "";
    if (!value.has("file")) {
      isValid = false;
      message = "Please choose an image file";
    }
    return { isValid, message };
  },
  composeAddressString(address) {
    return `${address.addressLineOne} ${address.addressLineTwo || ""} ${
      address.city
    } ${address.state} ${address.zipCode}`;
  },
  composeCloudinary(url, filter) {
    const actualFilter = filter ? filter : "";
    const sub = "https://res.cloudinary.com/dd7jkh7y6/image/upload/";
    const replaceStr = sub + actualFilter + "/";
    return url.replace(sub, replaceStr);
  },
  getMiles(meters) {
    const miles = meters * 0.000621371192;
    return Math.round(miles * 100) / 100;
  },
  getHoursMinutes(seconds) {
    const time = new Date(seconds * 1000).toISOString();
    const hours = Number(time.substr(11, 2));
    const minutes = Number(time.substr(14, 2));
    let hoursString = "";
    if (hours > 0) {
      hoursString = hours > 1 ? hours + " Hours " : hours + " Hour ";
    }
    let minutesString = "";
    if (minutes > 0) {
      minutesString = minutes > 1 ? minutes + " Minutes" : minutes + " Minute";
    }
    return hoursString + minutesString;
  },
};
