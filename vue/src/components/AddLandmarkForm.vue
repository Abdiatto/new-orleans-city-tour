<template>
  <form v-on:submit.prevent="addLandmark">
    <label for="name"
      >Location Name<input
        type="text"
        name="name"
        id="name"
        placeholder="Name"
        v-model="newLandmark.name"
        required
      />
    </label>

    <label for="address-line-one"
      >Address Line 1<input
        type="text"
        name="address-line-one"
        id="address-line-one"
        placeholder="Address Line One"
        v-model="newLandmark.addressLineOne"
        required
      />
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
          v-model="newLandmark.city"
        />
      </label>
      <label for="zipcode"
        >ZIP Code<input
          type="text"
          pattern="[0-9]*"
          name="zipcode"
          id="zipcode"
          placeholder="70119"
          required
          v-model="newLandmark.zipcode"
        />
      </label>
      <label for="district">
        District
        <select name="district" id="district" v-model="newLandmark.district">
          <option value="" selected>Select a district...</option>
          <option value="none">Not in a district</option>
          <option value="district1">District 1</option>
          <option value="district2">District 2</option>
          <option value="district3">District 3</option>
        </select>
      </label>
    </div>
    <label for="content">About {{ newLandmark.name || "New Location" }} </label>
    <textarea name="content" id="content" cols="30" rows="10"></textarea>
    <button type="submit">Submit</button>
  </form>
</template>

<script>
export default {
  name: "add-landmark-form",
  data() {
    return {
      newLandmark: {
        name: "",
        addressLineOne: "",
        addressLineTwo: "",
        state: "LA",
        city: "New Orleans",
        zipcode: "",
        district: "",
        content: "",
      },
    };
  },
  methods: {
    saveLandmark() {
      console.log(this.landmark);
    },
  },
};
</script>

<style>
form button {
  max-width: 128px;
}
</style>