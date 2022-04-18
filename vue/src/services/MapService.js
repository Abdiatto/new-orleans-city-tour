import geocoding from "@mapbox/mapbox-sdk/services/geocoding";

const geocodingClient = geocoding({
  accessToken: process.env.VUE_APP_MAP_ACCESS_TOKEN,
});

export default {
  async getMapPosition(address) {
    const response = await geocodingClient
      .forwardGeocode({
        query: address,
        autocomplete: false,
        limit: 1,
      })
      .send();
    const chords = (await response.body.features[0].center) || [];
    return chords.length === 2 ? chords : false;
  },
};
