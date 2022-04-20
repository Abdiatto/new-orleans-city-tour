<template>
  <div id="app">
    <nav-bar />
    <main class="container">
      <router-view />
    </main>
    <v-dialog />
  </div>
</template>

<script>
import "@picocss/pico";
import NavBar from "./components/NavBar.vue";

export default {
  components: { NavBar },
  mounted() {
    this.$store.dispatch("getLandmarks");
    this.$store.dispatch("getDistricts");
    this.$store.dispatch("getItineraries");
  },
};
</script>

<style>
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

.form-button button,
.form-button input[type="submit"] {
  max-width: 220px;
}
.form-button {
  display: flex;
  justify-content: flex-end;
  gap: 0.5rem;
}
.form-error {
  color: var(--form-element-invalid-border-color);
  padding-left: 0.5rem;
}
.warning {
  background-color: var(--warn);
  border-color: var(--warn);
}
.mapboxgl-popup-content h6 {
  font-size: 0.7rem;
}
@media screen and (min-width: 576px) and (max-width: 768px) {
  .container {
    max-width: 560px;
  }
}

@media (max-width: 620px) {
  .form-button button {
    max-width: initial;
  }
  .form-button {
    display: block;
  }
}
</style>
