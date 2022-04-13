<template>
  <nav>
    <ul>
      <li>
        <router-link v-bind:to="{ name: 'home' }"
          ><dynamic-image imagePath="logo-small.png"
        /></router-link>
      </li>
      <li><router-link v-bind:to="{ name: 'add' }">Add</router-link></li>
    </ul>
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
  computed: {},
};
</script>

<style>
nav {
  padding: 0.5rem;
}
</style>
