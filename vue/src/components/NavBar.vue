<template>
  <nav class="d-flex flex-row align-content-center">
    <ul>
      <li>
        <router-link v-bind:to="{ name: 'home' }"
          ><dynamic-image imagePath="logo-small.png"
        /></router-link>
      </li>
      <li v-if="isAdmin"><router-link v-bind:to="{ name: 'add' }">Add</router-link></li>
      <li v-if="isLoggedIn">
        <router-link v-bind:to="{ name: 'itineraries' }"
          >Itineraries</router-link
        >
      </li>
      <li v-if="isNotLoggedIn"><router-link v-bind:to="{name: 'register'}">Register</router-link></li>
      <li v-if="isNotLoggedIn"><router-link v-bind:to="{name: 'login'}">Login</router-link></li>
    </ul>
    <div class="flex-grow-1"></div>
    <div class="align-self-center" style="margin-top: 60px; color: #000; text-transform: capitalize; font-size: 12pt;" v-if="isLoggedIn">Welcome, {{ getUsername }}. <router-link v-bind:to="{name: 'logout'}" style="text-decoration: underline">Logout</router-link></div>
  </nav>
</template>

<script>
export default {
  name: "nav-bar",
  data() {
    return {
      showMenu: true,
    };
  },
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
    }
  },
};
</script>

<style>
nav {
  padding: 0.5rem;
}
</style>
