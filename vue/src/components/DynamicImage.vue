<template>
  <img :src="require('../assets/landmark_images/' + imagePath)" alt="" />
</template>

<script>
export default {
  name: "dynamic-image",
  props: ["imagePath"],
};
</script>

<style></style>
