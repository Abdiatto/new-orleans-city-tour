<template>
  <span class="weather-icon" v-bind:class="iconLookUp[icon] || ''"> </span>
</template>

<script>
export default {
  props: ["icon"],
  data() {
    return {
      iconLookUp: {
        "01d": "icon-sun",
        "01n": "icon-moon",
        "02d": "icon--cloud-sun-fog",
        "02n": "icon-cloud-moon-fog",
        "03d": "icon-clouds",
        "03n": "icon-clouds1",
        "04d": "icon--cloud-sun-fog",
        "04n": "icon-cloud-moon-fog",
        "09d": "icon-cloud-raindrops",
        "09n": "icon-cloud-raindrops1",
        "10d": "icon-cloud-sun-raindrops",
        "10n": "icon-cloud-moon-raindrops",
        "11d": "icon-cloud-sun-lightning",
        "11n": "icon-cloud-moon-lightning",
        "13d": "icon-cloud-sun-snowflakes",
        "13n": "icon-cloud-moon-snowflakes",
        "50d": "icon-cloud-fog",
        "50n": "icon-cloud-fog",
      },
    };
  },
};
</script>

<style></style>
