<template>
  <nav>
    <template class="nav-desktop">
      <ul class="nav-desktop">
        <li>
          <router-link v-bind:to="{ name: 'home' }"
            ><dynamic-image imagePath="logo-small.png"
          /></router-link>
        </li>

        <li v-if="isLoggedIn">
          <router-link v-bind:to="{ name: 'itineraries' }"
            >Itineraries</router-link
          >
        </li>
        <li v-if="isAdmin">
          <router-link v-bind:to="{ name: 'add' }">Add</router-link>
        </li>
        <li v-if="isNotLoggedIn">
          <router-link v-bind:to="{ name: 'register' }">Register</router-link>
        </li>
        <li v-if="isNotLoggedIn">
          <router-link v-bind:to="{ name: 'login' }">Login</router-link>
        </li>
      </ul>
      <ul class="nav-desktop">
        <li class="nav-user" v-if="isLoggedIn">Welcome, {{ getUsername }}.</li>
        <li v-if="isLoggedIn">
          <router-link v-bind:to="{ name: 'logout' }">Logout</router-link>
        </li>
        <li><weather /></li>
      </ul>
    </template>

    <template class="nav-mobile">
      <ul class="nav-mobile">
        <li>
          <router-link v-bind:to="{ name: 'home' }"
            ><dynamic-image imagePath="logo-small.png"
          /></router-link>
        </li>
        <li><weather /></li>
      </ul>
      <ul class="nav-mobile nav-mobile-menu">
        <span>
          <li v-if="isLoggedIn">
            <router-link v-bind:to="{ name: 'itineraries' }"
              >Itineraries</router-link
            >
          </li>
          <li v-if="isAdmin">
            <router-link v-bind:to="{ name: 'add' }">Add</router-link>
          </li>
        </span>
        <span>
          <li v-if="isNotLoggedIn">
            <router-link v-bind:to="{ name: 'register' }">Register</router-link>
          </li>
          <li v-if="isNotLoggedIn">
            <router-link v-bind:to="{ name: 'login' }">Login</router-link>
          </li>
          <li v-if="isLoggedIn">
            <router-link v-bind:to="{ name: 'logout' }">Logout</router-link>
          </li>
        </span>
      </ul>
    </template>
  </nav>
</template>

<script>
import Weather from "@/components/Weather.vue";
export default {
  name: "nav-bar",
  data() {
    return {
      showMenu: true,
    };
  },
  components: { Weather },
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
  padding: 0 0.5rem;
  flex-direction: column;
  margin-bottom: 1rem;
}
.nav-desktop {
  display: none;
}
ul.nav-mobile {
  width: 100%;
  justify-content: space-between;
}
.nav-mobile li {
  padding: 0 0.5rem;
}
.nav-mobile-menu {
  background: #f4f4f5;
  padding: 0.5rem 1rem;
  border-radius: var(--border-radius);
}

@media screen and (min-width: 820px) {
  nav {
    padding: 0 2rem;
    flex-direction: row;
  }
  .nav-desktop {
    display: flex;
  }
  .nav-mobile {
    display: none;
  }
}

@media screen and (max-width: 1200px) {
  .nav-user {
    display: none;
  }
}
</style>
