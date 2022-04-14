<template>
  <div id="app">
    <nav-bar />
    <div class="clear"></div>
    <main class="container">
      <router-view />
    </main>
  </div>
</template>

<script>
import "@picocss/pico";
import NavBar from "./components/NavBar.vue";

export default {
  components: { NavBar },
  created() {
    this.$store.dispatch("getLandmarks");
    this.$store.dispatch("getDistricts");
  },
};
</script>

<style>
.clear {
  clear: both;
  display: block;
  overflow: hidden;
  visibility: hidden;
  width: 0;
  height: 0;
}
:root {
  --font-family: "Montserrat", sans-serif;
  --header-font-family: "Merriweather", serif;
}

[data-theme="light"],
:root:not([data-theme="dark"]) {
  --primary: #49416d;
  --primary-light: #a882dd;
  --primary-hover: var(--primary-light);
  --primary-focus: rgba(94, 53, 177, 0.125);
  --primary-inverse: #fff;
  --complement: #e3b505;
  --success: #56a3a6;
  --warn: #db504a;
  --primary-light: #a882dd;

  --form-element-active-border-color: var(--primary);
  --form-element-focus-color: var(--primary-focus);
  --switch-color: var(--primary-inverse);
  --switch-checked-background-color: var(--primary);
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: var(--header-font-family);
  --typography-spacing-vertical: 0.2rem;
}

.form-button button {
  max-width: 200px;
}
.form-button {
  display: flex;
  justify-content: flex-end;
}
.form-error {
  color: var(--form-element-invalid-border-color);
  padding-left: 0.5rem;
}
.warning {
  background-color: var(--warn);
  border-color: var(--warn);
}

@media screen and (max-width: 620px) {
  .form-button button {
    max-width: initial;
  }
  .form-button {
    display: block;
  }
}
</style>
