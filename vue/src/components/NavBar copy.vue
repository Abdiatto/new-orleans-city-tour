<template>
  <div>
    <span>
      <a
        href="#"
        class="secondary"
        role="button"
        v-on:click="showMenu = !showMenu"
        >…</a
      >
      <span id="logo">
        <router-link v-bind:to="{ name: 'home' }">Logo Placeholder</router-link>
      </span>
    </span>
    <nav>
      <ul>
        <li><router-link v-bind:to="{ name: 'home' }">Find</router-link></li>
        <li><router-link v-bind:to="{ name: 'home' }">Plan</router-link></li>
        <li><router-link v-bind:to="{ name: 'home' }">Add</router-link></li>
      </ul>
      <ul>
        <li class="secondary">
          <router-link v-bind:to="{ name: 'home' }">Login</router-link>
        </li>
        <li class="secondary">
          <router-link v-bind:to="{ name: 'home' }">Sign Up</router-link>
        </li>
      </ul>
    </nav>
  </div>
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
  justify-content: flex-start;
  position: relative;
}
nav ul:nth-last-child(2) {
  flex-grow: 1;
}
#burger-icon {
  display: none;
}
.burger-menu {
  position: static;
  min-width: none;
}

@media screen and (max-width: 600px) {
  nav {
    display: block;
  }
  /* .burger-menu {
    position: absolute;
    z-index: 999;
    min-width: 100vw;
  } */
  #logo {
    display: inline-block;
  }
  #burger-icon {
    display: inline-block;
  }
  li#burger-icon a {
    display: inline;
  }
  nav li {
    display: block;
    padding: calc(var(--nav-element-spacing-vertical) * 0.5)
      var(--nav-element-spacing-horizontal);
  }
  nav ul {
    display: block;
  }
  nav li a {
    display: block;
  }
  nav ul:last-child {
    margin-left: var(--nav-element-spacing-horizontal);
  }
}
</style>
