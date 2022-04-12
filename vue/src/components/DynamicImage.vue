<template>
  <img :src="imagePath" alt="" />
</template>

<script>
export default {
  name: "dynamic-image",
  props: ["imagePath"],
};
</script>

<style></style>
