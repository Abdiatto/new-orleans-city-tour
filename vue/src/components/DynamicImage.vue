<template>
  <div class="image-wrapper">
    <img v-if="isUrl" :src="imagePath" :alt="altText" />
    <img v-else :src="require(`../assets/images/${imagePath.trim()}`)" />
  </div>
</template>

<script>
export default {
  name: "dynamic-image",
  data() {
    return {
      isLoaded: false,
    };
  },
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
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
