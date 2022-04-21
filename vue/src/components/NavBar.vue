<template>
  <nav class="d-flex flex-row align-content-center">
    <ul>
      <li>
        <router-link v-bind:to="{ name: 'home' }"
          ><dynamic-image imagePath="logo-small.png"
        /></router-link>
      </li>
      <li v-if="isAdmin">
        <router-link v-bind:to="{ name: 'add' }">Add</router-link>
      </li>
      <li v-if="isLoggedIn">
        <router-link v-bind:to="{ name: 'itineraries' }"
          >Itineraries</router-link
        >
      </li>
      <li v-if="isNotLoggedIn">
        <router-link v-bind:to="{ name: 'register' }">Register</router-link>
      </li>
      <li v-if="isNotLoggedIn">
        <router-link v-bind:to="{ name: 'login' }">Login</router-link>
      </li>
    </ul>
    <ul>
      <li v-if="isLoggedIn">Welcome, {{ getUsername }}.</li>
      <li><router-link v-bind:to="{ name: 'logout' }">Logout</router-link></li>
    </ul>
    <weather/>
  </nav>
</template>

<script>
import Weather from '@/components/Weather.vue';
export default {
  name: "nav-bar",
  data() {

    return {
      showMenu: true,
    };
  },
  components: {Weather},
  computed: {
  
    isLoggedIn() {
      return this.$store.getters.isUserLoggedIn();
    },
    isNotLoggedIn() {
      return !this.$store.getters.isUserLoggedIn();
    },
    getUsername() {
      return this.$store.getters.getUsername();
    },
    isAdmin() {
      return this.$store.getters.isUserAdmin();
    },
  },
};
</script>

<style>
nav {
  padding: 0.5rem;
}
</style>
