<template>
  <img v-if="isUrl" :src="imagePath" :alt="altText" />
  <img v-else :src="require(`../assets/landmark_images/${imagePath}`)" />
</template>

<script>
export default {
  name: "dynamic-image",
  props: ["imagePath", "altText"],
  computed: {
    isUrl() {
      return (
        this.imagePath.startsWith("https://") ||
        this.imagePath.startsWith("http://")
      );
    },
  },
};
</script>

<style scoped>
img {
  display: block;
  margin: 0 auto;
}
</style>
