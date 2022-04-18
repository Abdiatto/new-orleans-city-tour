import axios from "axios";

export default {
  get() {
    return axios.get("/itineraries");
  },
  update(itineraries) {
    return axios.put("/itineraries", itineraries);
  },
};
