<template>
  <form
    v-on:submit.prevent="saveLandmark"
    novalidate="true"
    enctype="multipart/form-data"
  >
    <label for="name"
      >Location Name<input
        type="text"
        name="name"
        id="name"
        placeholder="Name"
        v-model.trim="newLandmark.name"
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
        v-model.trim="newLandmark.addressLineOne"
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
        v-model.trim="newLandmark.addressLineTwo"
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
          v-model.trim="newLandmark.city"
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
          v-model.trim="newLandmark.zipCode"
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
          v-model.trim="newLandmark.district_id"
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

    <label for="imageUpload">
      Upload an Image
      <input
        type="file"
        name="imageUpload"
        id="imageUpload"
        :aria-invalid="!formErrors.photoFile.isValid"
        @change="uploadChange($event)"
      />
      <small v-show="!formErrors.photoFile.isValid" class="form-error">{{
        formErrors.photoFile.message
      }}</small>
    </label>

    <label for="content">About this new location</label>
    <textarea
      name="content"
      id="content"
      cols="30"
      rows="10"
      v-model.trim="newLandmark.content"
      :aria-invalid="!formErrors.content.isValid"
    ></textarea>
    <small v-show="!formErrors.photoPath.isValid" class="form-error">{{
      formErrors.content.message
    }}</small>
    <div class="form-button"><button type="submit">Submit</button></div>
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
        photoFile: { isValid: true, message: "" },
      },
      photoData: new FormData(),
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
      const photoFile = util.validateFile(this.photoData);
      this.formErrors.photoFile = photoFile;

      return (
        name.isValid &&
        addressLineOne.isValid &&
        state.isValid &&
        zipCode.isValid &&
        district_id.isValid &&
        content.isValid &&
        photoFile.isValid &&
        city.isValid
      );
    },
    saveLandmark() {
      if (this.validateForm()) {
        landmarkService.uploadImage(this.photoData).then((r) => {
          if (r.status >= 200 && r.status < 300) {
            this.newLandmark.photoPath = r.data.secure_url;
            landmarkService.addLandmark(this.newLandmark).then(() => {
              this.$store.dispatch("getLandmarks");
              this.$store.dispatch("getDistricts");
              this.$router.push({ name: "home" });
            });
          }
        });
      }
    },
    uploadChange(e) {
      this.photoData.set("upload_preset", "i3xje6fq");
      this.photoData.set("file", e.target.files[0]);
    },
  },
};
</script>

<style></style>
