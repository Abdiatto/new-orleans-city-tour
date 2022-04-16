<template>
  <article>
    <h3>Please fill in the fields below to receive a copy of your itinerary.</h3>
    <email-form v-bind:itinerary="itinerary" />
  </article>
</template>

<script>
import EmailForm from "../components/EmailForm.vue";
export default {
    data() {
        return {
            itineraryId:  this.$route.params.id
        }
    },
    computed: {
        itinerary() {
            return this.$store.getters.getItinerary(this.itineraryId);
        }
    },
    components: { EmailForm },
};
</script>

<style></style>
