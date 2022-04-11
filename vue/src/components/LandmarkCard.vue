<template>
  <article>
    <h3>{{ landmark.name }}</h3>
    <p>{{ landmark.content }}</p>
  </article>
</template>

<script>
export default {
  name: "landmark-card",
  props: ["landmark"],
};
</script>

<style></style>
