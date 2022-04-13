<template>
  <form v-on:submit.prevent="saveLandmark" novalidate="true">
    <label for="name"
      >Location Name<input
        type="text"
        name="name"
        id="name"
        placeholder="Name"
        v-model="newLandmark.name"
        :aria-invalid="!formErrors.name.isValid"
        required
      />
      <small v-show="!formErrors.name.isValid" class="form-error">{{
        formErrors.name.message
      }}</small>
    </label>

    <label for="address-line-one"
      >Address Line 1<input
        type="text"
        name="address-line-one"
        id="address-line-one"
        placeholder="Address Line One"
        v-model="newLandmark.addressLineOne"
        :aria-invalid="!formErrors.addressLineOne.isValid"
        required
      />
      <small v-show="!formErrors.addressLineOne.isValid" class="form-error">{{
        formErrors.addressLineOne.message
      }}</small>
    </label>

    <label for="address-line-two"
      >Address Line 2<input
        type="text"
        name="address-line-two"
        id="address-line-two"
        placeholder="Address Line Two"
        v-model="newLandmark.addressLineTwo"
      />
    </label>
    <div class="grid">
      <label for="city"
        >City<input
          type="text"
          name="city"
          id="city"
          placeholder="New Orleans"
          :aria-invalid="!formErrors.city.isValid"
          disabled
          v-model="newLandmark.city"
        />
        <small v-show="!formErrors.city.isValid" class="form-error">{{
          formErrors.city.message
        }}</small>
      </label>
      <label for="zipcode"
        >ZIP Code<input
          type="text"
          pattern="[0-9]*"
          name="zipcode"
          id="zipcode"
          placeholder="70119"
          :aria-invalid="!formErrors.zipCode.isValid"
          required
          v-model="newLandmark.zipCode"
        />
        <small v-show="!formErrors.zipCode.isValid" class="form-error">{{
          formErrors.zipCode.message
        }}</small>
      </label>
      <label for="district">
        District
        <select
          name="district"
          id="district"
          v-model="newLandmark.district_id"
          :aria-invalid="!formErrors.district_id.isValid"
        >
          <option value="" selected>Select a district...</option>
          <option
            v-for="district in $store.state.allDistricts"
            :value="district.districtId"
            :key="district.districtId"
            >{{ district.name }}</option
          >
        </select>
        <small v-show="!formErrors.district_id.isValid" class="form-error">{{
          formErrors.district_id.message
        }}</small>
      </label>
    </div>
    <label for="imagePath">
      Path to Image
      <input
        type="url"
        name="imagePath"
        id="imagePath"
        v-model="newLandmark.photoPath"
        :aria-invalid="!formErrors.photoPath.isValid"
      />
      <small v-show="!formErrors.photoPath.isValid" class="form-error">{{
        formErrors.photoPath.message
      }}</small>
    </label>
    <label for="content">About this new location</label>
    <textarea
      name="content"
      id="content"
      cols="30"
      rows="10"
      v-model="newLandmark.content"
      :aria-invalid="!formErrors.content.isValid"
    ></textarea>
    <small v-show="!formErrors.photoPath.isValid" class="form-error">{{
      formErrors.content.message
    }}</small>
    <button type="submit">Submit</button>
  </form>
</template>

<script>
import landmarkService from "@/services/LandmarkService.js";
import util from "@/util/util.js";
export default {
  name: "add-landmark-form",
  data() {
    return {
      newLandmark: {
        name: "",
        addressLineOne: "",
        addressLineTwo: "",
        status: "approved",
        state: "LA",
        city: "New Orleans",
        zipCode: "",
        district_id: "",
        content: "",
        photoPath: "",
      },
      formErrors: {
        name: { isValid: true, message: "" },
        addressLineOne: { isValid: true, message: "" },
        state: { isValid: true, message: "" },
        city: { isValid: true, message: "" },
        zipCode: { isValid: true, message: "" },
        district_id: { isValid: true, message: "" },
        content: { isValid: true, message: "" },
        photoPath: { isValid: true, message: "" },
      },
    };
  },
  methods: {
    validateForm() {
      const name = util.validateLength(this.newLandmark.name, 3, 200);
      this.formErrors.name = name;
      const addressLineOne = util.validateLength(
        this.newLandmark.addressLineOne,
        3,
        200
      );
      this.formErrors.addressLineOne = addressLineOne;
      const state = util.validateLength(this.newLandmark.state, 1, 4);
      this.formErrors.state = state;
      const city = util.validateLength(this.newLandmark.city, 3, 100);
      this.formErrors.city = city;
      const zipCode = util.validateZip(this.newLandmark.zipCode);
      this.formErrors.zipCode = zipCode;
      const district_id = util.validateSelect(this.newLandmark.district_id);
      this.formErrors.district_id = district_id;
      const content = util.validateLength(this.newLandmark.content, 25, 10000);
      this.formErrors.content = content;
      const photoPath = util.validateLength(this.newLandmark.photoPath, 3, 300);
      this.formErrors.photoPath = photoPath;
      return (
        name.isValid &&
        addressLineOne.isValid &&
        state.isValid &&
        zipCode.isValid &&
        district_id.isValid &&
        content.isValid &&
        photoPath.isValid &&
        city.isValid
      );
    },
    saveLandmark() {
      if (this.validateForm()) {
        landmarkService.addLandmark(this.newLandmark).then(() => {
          this.$store.dispatch("getLandmarks");
          this.$store.dispatch("getDistricts");
          this.$router.push({ name: "home" });
        });
      }
    },
  },
};
</script>

<style>
form button {
  max-width: 128px;
}
.form-error {
  color: var(--form-element-invalid-border-color);
  padding-left: 0.5rem;
}
</style>
