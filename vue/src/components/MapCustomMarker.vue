<template>
  <div
    class="map-marker"
    :style="{ backgroundImage: `url(${imageUrl})` }"
  ></div>
</template>

<script>
export default {
  props: ["imageUrl"],
};
</script>

<style>
.map-marker {
  height: 64px;
  width: 64px;
  clip-path: polygon(
    5% 0%,
    95% 0%,
    100% 5%,
    100% 80%,
    95% 85%,
    71.58% 85%,
    48.25% 100%,
    24.92% 85%,
    5% 85%,
    0% 80%,
    0% 5%
  );
}
</style>
