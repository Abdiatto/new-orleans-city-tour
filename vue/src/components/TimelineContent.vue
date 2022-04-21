<template>
  <div class="timeline-block" :class="timelineClass">
    <div class="marker" :class="{ 'timeline-small': small }"></div>
    <div class="timeline-content">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  props: ["direction", "small"],
  computed: {
    timelineClass() {
      return this.direction == "left"
        ? "timeline-block-left"
        : "timeline-block-right";
    },
  },
};
</script>

<style></style>
