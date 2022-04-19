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
  composeAddressString(address) {
    return `${address.addressLineOne} ${address.addressLineTwo || ""} ${
      address.city
    } ${address.state} ${address.zipCode}`;
  },
};
