<template>
  <div class="image-wrapper">
    <img v-if="isUrl" :src="getUrl" :alt="altText" />
    <img v-else :src="require(`../assets/images/${imagePath.trim()}`)" />
  </div>
</template>

<script>
import util from "@/util/util.js";
export default {
  name: "dynamic-image",
  data() {
    return {
      isLoaded: false,
    };
  },
  props: ["imagePath", "altText", "filter"],
  computed: {
    isUrl() {
      return (
        this.imagePath.startsWith("https://") ||
        this.imagePath.startsWith("http://")
      );
    },
    getUrl() {
      if (this.imagePath.startsWith("https://res.cloudinary.com/")) {
        return util.composeCloudinary(this.imagePath, this.filter);
      }
      return this.imagePath;
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
