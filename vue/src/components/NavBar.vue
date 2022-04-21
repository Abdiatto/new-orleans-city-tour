<template>
  <nav>
    <ul style="display: inline-block">
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
    <span style="float:right" v-if="isLoggedIn">Hello, {{ getUsername }}! <router-link v-bind:to="{name: 'logout'}">Logout</router-link></span>
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
