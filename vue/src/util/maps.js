import mapboxgl from "mapbox-gl";

mapboxgl.accessToken = process.env.VUE_APP_MAP_ACCESS_TOKEN;

export default {
  //default values for the map, default center is new orleans
  mapSettings: {
    container: "map",
    style: "mapbox://styles/mapbox/outdoors-v11",
    center: [-90.0715, 29.9511],
    zoom: 13,
  },
  //styling for the routeline layer
  routeLine: {
    id: "routeline-active",
    type: "line",
    source: "route",
    layout: {
      "line-join": "round",
      "line-cap": "round",
    },
    paint: {
      "line-color": "#3887be",
      "line-width": ["interpolate", ["linear"], ["zoom"], 12, 3, 22, 12],
    },
  },

  //styling for the arrows of a route
  routeArrow: {
    id: "routearrows",
    type: "symbol",
    source: "route",
    layout: {
      "symbol-placement": "line",
      "text-field": "▶",
      "text-size": ["interpolate", ["linear"], ["zoom"], 12, 24, 22, 60],
      "symbol-spacing": ["interpolate", ["linear"], ["zoom"], 12, 30, 22, 160],
      "text-keep-upright": false,
    },
    paint: {
      "text-color": "#3887be",
      "text-halo-color": "hsl(55, 11%, 96%)",
      "text-halo-width": 3,
    },
  },
  //create new map
  newMap(mapSettings = this.mapSettings) {
    return new mapboxgl.Map(mapSettings);
  },
  //adds a basic waypoint to a map
  addBasicWaypoint(lngLat, map) {
    new mapboxgl.Marker().setLngLat(lngLat).addTo(map);
  },
};
