<template>
  <article class="map-wrapper">
    <div id="map"></div>
  </article>
</template>

<script>
import mapboxgl from "mapbox-gl";
import mapService from "@/services/MapService.js";
import * as turf from "@turf/turf";

export default {
  name: "test-map",
  props: ["address"],
  data() {
    return {
      loading: false,
      location: "",
      access_token: process.env.VUE_APP_MAP_ACCESS_TOKEN,
      center: [-90.0715, 29.9511],
      map: {},
    };
  },
  mounted() {
    mapService
      .getOptimizationForAddresses([
        "701 Chartres St. New Orleans, LA 70116",
        "500 Chartres St. New Orleans, LA 70130",
        "1418 Governor Nicholls St,New Orleans, LA 70116",
        "400 Esplanade Ave,New Orleans, LA 70116",
      ])
      .then((v) => {
        this.createMap(v);
      });
  },

  methods: {
    async createMap(geoData) {
      try {
        mapboxgl.accessToken = this.access_token;
        this.map = new mapboxgl.Map({
          container: "map",
          style: "mapbox://styles/mapbox/outdoors-v11",
          center: this.center,
          zoom: 12,
        });

        this.map.on("load", () => {
          const routeGeoJSON = turf.featureCollection([
            turf.feature(geoData.trips[0].geometry),
          ]);
          this.map.addSource("route", {
            type: "geojson",
            data: routeGeoJSON,
          });
          geoData.waypoints.forEach((waypoint) => {
            new mapboxgl.Marker().setLngLat(waypoint.location).addTo(this.map);
          });

          this.map.addLayer(
            {
              id: "routeline-active",
              type: "line",
              source: "route",
              layout: {
                "line-join": "round",
                "line-cap": "round",
              },
              paint: {
                "line-color": "#3887be",
                "line-width": [
                  "interpolate",
                  ["linear"],
                  ["zoom"],
                  12,
                  3,
                  22,
                  12,
                ],
              },
            },
            "waterway-label"
          );
          this.map.addLayer(
            {
              id: "routearrows",
              type: "symbol",
              source: "route",
              layout: {
                "symbol-placement": "line",
                "text-field": "▶",
                "text-size": [
                  "interpolate",
                  ["linear"],
                  ["zoom"],
                  12,
                  24,
                  22,
                  60,
                ],
                "symbol-spacing": [
                  "interpolate",
                  ["linear"],
                  ["zoom"],
                  12,
                  30,
                  22,
                  160,
                ],
                "text-keep-upright": false,
              },
              paint: {
                "text-color": "#3887be",
                "text-halo-color": "hsl(55, 11%, 96%)",
                "text-halo-width": 3,
              },
            },
            "waterway-label"
          );
        });
      } catch (err) {
        console.log("map error", err);
      }
    },
  },
};
</script>

<style>
#map {
  width: 100%;
  height: 600px;
  padding: 0;
  margin: 0;
}
</style>
