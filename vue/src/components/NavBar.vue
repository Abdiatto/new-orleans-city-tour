<template>
  <nav>
    <ul>
      <li>
        <router-link v-bind:to="{ name: 'home' }"
          ><dynamic-image imagePath="logo-small.png"
        /></router-link>
      </li>
      <li><router-link v-bind:to="{ name: 'add' }">Add</router-link></li>
      <li>
        <router-link v-bind:to="{ name: 'itineraries' }"
          >Itineraries</router-link
        >
      </li>
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
  computed: {
    
  },
  components: {Weather}
};
</script>

<style>
nav {
  padding: 0.5rem;
}
</style>
