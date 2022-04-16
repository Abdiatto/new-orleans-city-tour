import axios from "axios";

export default {
  getLandmarks() {
    return axios.get("/landmarks");
  },
  addLandmark(landmark) {
    return axios.post("/landmarks", landmark);
  },
  getDistricts() {
    return axios.get("/districts");
  },
  getLandmarksByItineraryId(id) {
    return axios.get(`/itinerary/${id}/landmarks`);
  },
};
