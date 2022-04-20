<template>
  <div class="timeline-container">
    <slot></slot>
  </div>
</template>

<script>
export default {};
</script>

<style scope>
.timeline-small {
  font-size: 0.5rem;
}
h6 {
  --typography-spacing-vertical: -0.4rem;
}
.timeline-container {
  padding: 20px 0;
  position: relative;
  overflow: hidden;
}
.timeline-container img {
  max-height: 240px;
}

.timeline-container:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  margin-left: 7px;
  width: 2px;
  height: 100%;
  background: #ccd1d9;
  z-index: 0;
}

.timeline-block {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: flex;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
  -moz-box-pack: justify;
  justify-content: space-between;
  clear: both;
  z-index: 10;
}
.marker {
  width: 16px;
  height: 16px;
  border-radius: 50%;
  border: 0;
  background: var(--primary);
  margin-top: 10px;
  z-index: 9999;
}

.marker.timeline-small {
  width: 6px;
  height: 6px;
  margin-left: 5px;
  border-radius: 0;
  background: #afafaf;
}

.timeline-content {
  width: 95%;
  padding: 0 15px;
}

.timeline-content h3 {
  margin-top: 5px;
  margin-bottom: 5px;
  font-size: 25px;
  font-weight: 500;
}

.timeline-content span {
  font-size: 15px;
}

.timeline-content p {
  font-size: 14px;
  line-height: 1.5em;
  word-spacing: 1px;
}
</style>
