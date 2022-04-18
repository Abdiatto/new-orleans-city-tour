<template>
  <article class="map-wrapper">
    <div id="map"></div>
  </article>
</template>

<script>
import mapboxgl from "mapbox-gl";
import mapService from "@/services/MapService.js";
const my_access_token = "pk.eyJ1IjoidGVrMTQiLCJhIjoiY2wyMTJmNGg2MTJndjNpbzM0NWZlajFiZSJ9.gQOh3Z5Vkxnq6tZZpe89Pw" 
export default {
name: "single-point-map",
props: ["address"],
data(){
    return {
      loading: false,
      location: "",
      access_token:my_access_token,
      center: [-90.0715, 29.9511],
      map: {},
    };
},
mounted() {
    this.createMap();
    mapService
      .getMapPosition("")
      .then((r) => {
        console.log(r);
      });
  },
   methods: {
    async createMap() {
      try {
        mapboxgl.accessToken = this.access_token;
        this.map = new mapboxgl.Map({
          container: "map",
          style: "mapbox://styles/mapbox/outdoors-v11",
          center: this.center,
          zoom: 9,
        });
        // creating markers for each location 
        
        mapService.getMapPosition(this.address).then((location) =>{
            if(location) {
                new mapService.Marker().setLngLat.at(this.location).addTo(this.map)
            }
        });
        new mapboxgl.Marker().setLngLat([-90.0638, 29.95764]).addTo(this.map);
      } catch (err) {
        console.log("map error", err);
      }
    },
  },

}
</script>

<style>

</style>