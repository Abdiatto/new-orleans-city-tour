import geocoding from "@mapbox/mapbox-sdk/services/geocoding";
import optimization from "@mapbox/mapbox-sdk/services/optimization";
import util from "@/util/util.js";

const token = {
  accessToken: process.env.VUE_APP_MAP_ACCESS_TOKEN,
};
//sets up a cache for already found addresses
let cachedAddresses = {};
//client setup
const geocodingClient = geocoding(token);
const optimizationClient = optimization(token);

export default {
  async getMapPosition(address) {
    if (cachedAddresses[address]) {
      return cachedAddresses[address];
    } else {
      const response = await geocodingClient
        .forwardGeocode({
          query: address,
          autocomplete: false,
          limit: 1,
        })
        .send();
      const chords = (await response.body.features[0].center) || [];
      if (chords.length === 2) cachedAddresses[address] = chords;
      return chords.length === 2 ? chords : false;
    }
  },

  async getAddresses(addressArray) {
    return await Promise.all(
      addressArray.map((address) => this.getMapPosition(address))
    );
  },

  async getLandmarkChords(landmarks) {
    return await Promise.all(
      landmarks.map(async (landmark) => {
        const address = util.composeAddressString(landmark.address);
        return {
          landMarkId: landmark.landMarkId,
          center: await this.getMapPosition(address),
        };
      })
    );
  },

  async getOptimization(locations) {
    const waypoints = locations.map((current) => {
      return { coordinates: current };
    });
    if (locations && locations.length >= 2 && locations.length <= 12) {
      const response = await optimizationClient
        .getOptimization({
          waypoints,
          source: "first",
          overview: "full",
          steps: true,
          geometries: "geojson",
        })
        .send();
      return await response.body;
    }
  },

  async getOptimizationForAddresses(addressArray) {
    const chordsArray = await this.getAddresses(addressArray);
    return await this.getOptimization(chordsArray);
  },
};
