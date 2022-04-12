import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem("token");
const currentUser = JSON.parse(localStorage.getItem("user"));

if (currentToken != null) {
  axios.defaults.headers.common["Authorization"] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || "",
    user: currentUser || {},
    activeLandmarkId: 0,
    allLandmarks: [
      {
        id: 0,
        name: "Garden District",
        content: "the description/details of the landmark",
        addressLineOne: "line1",
        addressLineTwo: "line2",
        state: "LA",
        city: "New Orleans",
        zipcode: 15569,
        photos: [{ path: "garden_district.jpg", isFeatured: true }],
      },
      {
        id: 1,
        name: "Longue Vue House Gardens",
        content: "the description/details of the landmark",
        addressLineOne: "line1",
        addressLineTwo: "line2",
        state: "LA",
        city: "New Orleans",
        zipcode: 15569,
        photos: [
          {
            path: "longue_vue_house_gardens.jpg",
            isFeatured: true,
          },
        ],
      },
      {
        id: 2,
        name: "St Louis Cathedral",
        content: "the description/details of the landmark",
        addressLineOne: "line1",
        addressLineTwo: "line2",
        state: "LA",
        city: "New Orleans",
        zipcode: 15569,
        photos: [
          {
            path: "st_louis_catherdal.jpg",
            isFeatured: true,
          },
        ],
      },
    ],
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem("token", token);
      axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem("user", JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem("token");
      localStorage.removeItem("user");
      state.token = "";
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_ACTIVE_LANDMARK(state, id) {
      state.activeLandmarkId = id;
    },
  },
});
