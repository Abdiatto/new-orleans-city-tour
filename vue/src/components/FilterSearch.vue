<template>
  <details>
    <summary role="button" class="secondary">Filter</summary>
    <div class="filter-grid">
      <label for="geocoder" id="geocoder-label">
        Starting Point
        <div id="geocoder"></div>
      </label>
      <label for="distance">
        Mile Radius <input name="distance" v-model="distance" type="number" />
      </label>
    </div>
  </details>
</template>

<script>
import maps from "@/util/maps.js";
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
    this.$store.commit(
      "SET_FILTERED_LANDMARKS",
      this.$store.state.allLandmarks
    );
    const geo = maps.newGeocoderSearch();
    geo.addTo("#geocoder");
    geo.on("result", (e) => {
      this.startingPoint = e.result.center;
    });
    geo.on("clear", () => {
      this.startingPoint = [];
    });
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
            return this.distance > 0 ? distance <= this.distance : true;
          });
          this.$store.commit("SET_FILTERED_LANDMARKS", filtered);
        });
    },
  },
  watch: {
    startingPoint() {
      this.filter();
    },
    distance() {
      this.filter();
    },
  },
};
</script>

<style>
.filter-grid {
  display: flex;
  gap: 1rem;
}
.filter-grid #geocoder-label {
  flex-basis: 80%;
  flex-grow: 1;
}
#geocoder {
  z-index: 1;
  margin: 20px;
}
.mapboxgl-ctrl-geocoder {
  position: relative;
}
.mapboxgl-ctrl-geocoder--button {
  margin: 0;
  padding: 1rem;
  background-color: initial;
  border: none;
  color: initial;
  box-shadow: none;
}
.mapboxgl-ctrl button:not(:disabled):hover {
  background-color: initial;
}
.mapboxgl-ctrl-geocoder .mapboxgl-ctrl-geocoder--pin-right > * {
  z-index: 2;
  position: absolute;
  right: -3px;
  top: 0px;
  display: none;
}
.mapboxgl-ctrl-geocoder.mapboxgl-ctrl-geocoder--collapsed {
  width: 50px;
  min-width: 50px;
  transition: width 0.25s, min-width 0.25s;
}
.mapboxgl-ctrl-geocoder .suggestions {
  background-color: #fff;
  border: 1px solid #a2afb9;
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
  padding-left: 1.5rem;

  margin-top: calc(var(--spacing) * 0.25);
}
.mapboxgl-ctrl-geocoder {
  min-width: 100%;
}
.mapboxgl-ctrl-geocoder--icon {
  position: absolute;
  top: 27px;
  padding: 0;
  left: 6px;
}
@media screen and (max-width: 994px) {
  .mapboxgl-ctrl-geocoder--icon {
    top: 23px;
  }
  .filter-grid {
    flex-direction: column;
  }
}
</style>
