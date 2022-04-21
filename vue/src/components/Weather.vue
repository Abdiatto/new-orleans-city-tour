<template>
  <div class="weather" v-if="$store.state.weather">
    <weather-icon v-bind:icon="$store.state.weather['weather'][0].icon" />
    <span> {{ Math.round($store.state.weather["main"].temp) }}°F </span>
  </div>
</template>

<script>
import WeatherIcon from "@/components/WeatherIcon.vue";
import weatherService from "../services/WeatherService.js";

export default {
  name: "weather",
  components: {
    WeatherIcon,
  },
  props: ["temp"],
  data() {
    return {
      main: {
        temp: "",
      },
    };
  },
  created() {
    weatherService.getCurrent(this.$route.params.id);
  },
};
</script>

<style>
.weather {
  font-size: 2rem;
  display: flex;
  align-items: center;
  margin-right: 0.5rem;
}
.weather-icon {
  font-size: 4rem;
}

@media screen and (max-width: 450px) {
  .weather {
    font-size: 1.3rem;
  }
  .weather-icon {
    font-size: 2.5rem;
  }
}
</style>
