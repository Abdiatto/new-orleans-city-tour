import axios from "axios";
export default {
    get() {
      return axios.get("/reviews");
    },
    update(reviews) {
      return axios.put("/reviews", reviews);
    },
  };
  