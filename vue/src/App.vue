<template>
  <div id="app">
    <nav-bar />
    <div class="clear"></div>
    <router-view />
  </div>
</template>

<script>
import "@picocss/pico";
import NavBar from "./components/NavBar.vue";

export default {
  components: { NavBar },
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
</style>
