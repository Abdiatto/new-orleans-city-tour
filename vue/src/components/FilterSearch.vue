<template>
  <div>
    <div id="geocoder"></div>
    <label for="distance">
      Mile Radius <input name="distance" v-model="distance" type="number" />
    </label>
    <button @click="filter">Filter</button>
  </div>
</template>

<script>
import maps from "@/util/maps.js";
//import util from "@/util/util.js";
import mapService from "@/services/MapService.js";

export default {
  name: "filter-search",
  data() {
    return {
      startingPoint: [],
      distance: 15,
    };
  },
  mounted() {
    const geo = maps.newGeocoderSearch();
    geo.addTo("#geocoder");
    geo.on("result", (e) => {
      this.startingPoint = e.result.center;
    });
    geo.on("clear", () => {
      this.startingPoint = [];
    });
  },
  computed: {
    // filtered() {
    // }
  },
  methods: {
    filter() {
      mapService
        .getLandmarkChords(this.$store.state.allLandmarks)
        .then((allPositions) => {
          const filtered = this.$store.state.allLandmarks.filter((landmark) => {
            const center = allPositions.find(
              (l) => landmark.landMarkId == l.landMarkId
            ).center;
            const distance = maps.getDistance(this.startingPoint, center);
            return distance <= this.distance;
          });
          console.log(filtered);
        });

      // const filtered = this.$store.state.allLandmarks.filter((landmark) => {
      //   const address = util.composeAddressString(landmark.address);
      //   mapService.getMapPosition(address).then()
      //   //get distance from starting point
      //   const distance = maps.getDistance(this.startingPoint, chords);

      //   return distance <= this.distance;
      // });
      // console.log(filtered);
    },
  },
};
</script>

<style>
#geocoder {
  z-index: 1;
  margin: 20px;
}
.mapboxgl-ctrl-geocoder {
  position: relative;
}
.mapboxgl-ctrl-geocoder .mapboxgl-ctrl-geocoder--pin-right > * {
  z-index: 2;
  position: absolute;
  right: 8px;
  top: 7px;
  display: none;
}
.mapboxgl-ctrl-geocoder.mapboxgl-ctrl-geocoder--collapsed {
  width: 50px;
  min-width: 50px;
  transition: width 0.25s, min-width 0.25s;
}
.mapboxgl-ctrl-geocoder .suggestions {
  background-color: #fff;
  border-radius: 4px;
  left: 0;
  list-style: none;
  margin: 0;
  padding: 0;
  position: absolute;
  width: 100%;
  top: 110%; /* fallback */
  top: calc(100% + 6px);
  z-index: 1000;
  overflow: hidden;
  font-size: 15px;
}
.mapboxgl-ctrl-geocoder .suggestions > li > a {
  cursor: default;
  display: block;
  padding: 6px 12px;
  color: #404040;
}

.mapboxgl-ctrl-geocoder .suggestions > .active > a,
.mapboxgl-ctrl-geocoder .suggestions > li > a:hover {
  color: #404040;
  background-color: #f3f3f3;
  text-decoration: none;
  cursor: pointer;
}

.mapboxgl-ctrl-geocoder--suggestion-title {
  font-weight: bold;
}
#geocoder {
  margin: 0;
}
#geocoder button {
  width: auto;
  line-height: 1;
}
#geocoder input {
  margin: 0;
  font-size: 1rem;
}
.mapboxgl-ctrl-geocoder {
  min-width: 100%;
}
.mapboxgl-ctrl-geocoder--icon {
  top: 50px;
  padding: 0;
}
</style>
