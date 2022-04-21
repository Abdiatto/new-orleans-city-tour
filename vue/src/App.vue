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
import '@/assets/icons.css'
import NavBar from "./components/NavBar.vue";

export default {
  components: { NavBar },
  mounted() {
    this.$store.dispatch("getLandmarks");
    this.$store.dispatch("getDistricts");
    this.$store.dispatch("getItineraries");
    this.$store.dispatch("getWeather") ;
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
html {
  min-height: 100vh;
  background-image: linear-gradient(
    330deg,
    hsl(48deg 95% 85%) 1%,
    hsl(48deg 96% 86%) 44%,
    hsl(47deg 97% 88%) 51%,
    hsl(47deg 98% 89%) 52%,
    hsl(47deg 99% 90%) 52%,
    hsl(46deg 100% 92%) 52%,
    hsl(46deg 100% 93%) 51%,
    hsl(46deg 100% 95%) 52%,
    hsl(46deg 100% 96%) 54%,
    hsl(46deg 100% 97%) 61%,
    hsl(46deg 100% 99%) 73%,
    hsl(0deg 0% 100%) 100%
  );
  transition: transform 0.3s ease-out;
  transform: scaleY(1);
  transform-origin: top;
  height: auto;
}

article {
  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
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

@media (min-width: 1600px) {
  .container {
    max-width: 1480px;
  }
}
</style>
