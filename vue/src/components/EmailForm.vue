<template>
  <div class="container">
    <form @submit.prevent="sendEmail">
      <label>Name</label>
      <input
        type="text"
        :value="getName"
        name="to_name"
        placeholder="Your Name"
      />
      <label>Email</label>
      <input
        type="email"
        :value = "getEmail"
        name="to_email"
        placeholder="Your Email"
      />
      <input type="hidden" name="itinerary_name" :value="itinerary_name" />
      <input type="hidden" name="message" :value="landmarks" />
      <div class="form-button">
        <input type="submit" value="Send" />
      </div>
    </form>
  </div>
</template>

<script>
import emailjs from "emailjs-com";

export default {
  name: "email-form",
  data() {
    return {
      // name: this.getName,
      // email: this.getEmail
    };
  },
  props: ["itinerary"],
  computed: {
    getName() { return this.$store.state.user.username},
    getEmail() { return this.$store.state.user.email},
    landmarks() {
      const items = this.$store.getters.getLandmarksByItinerary(
        this.itinerary.itineraryId
      );
      let list = "";
      items.forEach((item) => {
        list += "<li>" + item.name + "</li>";
      });
      return list;
    },
    itinerary_name() {
      console.log(this.itinerary.name);
      return this.itinerary.name;
    },
  },
  methods: {
    sendEmail(e) {
      try {
        emailjs.sendForm(
          "service_ezng6bg",
          "template_t679rk3",
          e.target,
          "g0T_fU4oM6hH-En03"
        );

        // alert('Email sent.');
        // this.name = '';
        // this.email = '';
        // navigate to another page
        this.$router.push({ name: "itineraries" });
      } catch (error) {
        console.log({ error });
        this.name = "error";
      }
    },
  },
};
</script>
