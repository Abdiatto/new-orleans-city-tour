<template>
  <div v-if="!error" id="map"></div>
  <h4 v-else>There was an error with loading the map</h4>
</template>

<script>
import maps from "@/util/maps.js";
import util from "@/util/util.js";
import mapService from "@/services/MapService.js";

export default {
  props: ["address"],
  data() {
    return {
      map: {},
      loaded: false,
      error: false,
    };
  },
  mounted() {
    try {
      this.map = maps.newMap();
      this.map.on("load", () => {
        this.loaded = true;
        const addressString = util.composeAddressString(this.address);
        mapService.getMapPosition(addressString).then((position) => {
          if (position) {
            maps.addBasicWaypoint(position, this.map);
            this.map.flyTo({
              center: position,
            });
          }
        });
      });
    } catch {
      this.error = "true";
    }
  },
};
</script>

<style scoped>
#map {
  width: 100%;
  height: 400px;
  padding: 0;
  margin: 1rem 0 0 0;
}
</style>
