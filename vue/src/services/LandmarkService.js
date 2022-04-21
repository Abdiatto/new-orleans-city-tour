import axios from "axios";
const cloudname = "dd7jkh7y6";
const cloudurl =
  "https://api.cloudinary.com/v1_1/" + cloudname + "/image/upload";
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
  uploadImage(formData) {
    return axios.post(cloudurl, formData);
  },
};
