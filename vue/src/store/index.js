import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";
import landmarkService from "@/services/LandmarkService.js";

Vue.use(Vuex);

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem("token");
const currentUser = JSON.parse(localStorage.getItem("user"));

const itineraries = JSON.parse(localStorage.getItem("itineraries"));

if (currentToken != null) {
  axios.defaults.headers.common["Authorization"] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || "",
    user: currentUser || {},
    activeLandmarkId: 0,
    allLandmarks: [],
    allDistricts: [],
    allItineraries: itineraries || [],
  },
  getters: {
    getAvailableLandmarks: (state) => (itinerary) => {
      const itineraryLandmarks = itinerary.landmarks;
      return state.allLandmarks.filter((landmark) => {
        return !itineraryLandmarks.includes(landmark.landMarkId);
      });
    },
    getLandmarksItinerary: (state) => (itinerary) => {
      const itineraryLandmarks = itinerary.landmarks;
      return itineraryLandmarks.map((landmarkId) => {
        return state.allLandmarks.find((l) => l.landMarkId == landmarkId);
      });
    },
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
    SET_LANDMARKS(state, landmarks) {
      state.allLandmarks = landmarks;
    },
    SET_DISTRICTS(state, districts) {
      state.allDistricts = districts;
    },
    UPDATE_ITINERARIES(state, itineraries) {
      state.allItineraries = itineraries;
    },
    UPDATE_ITINERARY(state, { itineraryId, newList }) {
      const index = state.allItineraries.findIndex(
        (i) => i.itineraryId == itineraryId
      );
      state.allItineraries[index].landmarks = newList;
    },
    ADD_ITINERARY(state, name) {
      state.allItineraries.push({
        name,
        landmarks: [],
        itineraryId: Date.now(),
      });
    },
    REMOVE_ITINERARY(state, itinerary) {
      const index = state.allItineraries.findIndex(
        (i) => i.itineraryId == itinerary.itineraryId
      );
      state.allItineraries.splice(index, 1);
    },
  },
  actions: {
    getLandmarks({ commit }) {
      landmarkService.getLandmarks().then((response) => {
        commit("SET_LANDMARKS", response.data);
      });
    },
    getDistricts({ commit }) {
      landmarkService.getDistricts().then((response) => {
        commit("SET_DISTRICTS", response.data);
      });
    },
    syncItineraries({ state }) {
      localStorage.setItem("itineraries", JSON.stringify(state.allItineraries));
    },
    getItineraries({ commit }) {
      const i = localStorage.getItem("itineraries") || [];
      commit("UPDATE_ITINERARIES", JSON.parse(i));
    },
  },
});
