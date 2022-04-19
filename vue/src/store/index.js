import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";
import landmarkService from "@/services/LandmarkService.js";
import itinerariesService from "@/services/ItinerariesService.js";

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
    first: false,
    token: currentToken || "",
    user: currentUser || {},
    activeLandmarkId: 0,
    activeItineraryId: 0,
    allLandmarks: [],
    allDistricts: [],
    allItineraries: [],
    landmarksByItinerary: [],
    filteredLandmarks: [],
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
    getLandmarksByItinerary: (state) => (id) => {
      const itinerary = state.allItineraries.find((i) => i.itineraryId == id);
      let landmarks = [];
      if (itinerary !== undefined) {
        itinerary.landmarks.forEach((item) => {
          const landmark = state.allLandmarks.find((l) => l.landMarkId == item);
          landmarks.push(landmark);
        });
      }
      return landmarks;
    },
    getItinerary: (state) => (id) => {
      const itinerary = state.allItineraries.find((i) => i.itineraryId == id);
      return itinerary;
    },
    getActiveItinerary: (state) => () => {
      return state.allItineraries.find(
        (i) => i.itineraryId == state.activeItineraryId
      );
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
    SET_ACTIVE_ITINERARY(state, id) {
      state.activeItineraryId = id;
    },
    SET_LANDMARKS(state, landmarks) {
      state.allLandmarks = landmarks;
    },
    SET_DISTRICTS(state, districts) {
      state.allDistricts = districts;
    },
    SET_LANDMARKS_BY_ITINERARY(state, landmarks) {
      state.landmarksByItinerary = landmarks;
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
    SET_FILTERED_LANDMARKS(state, landmarks) {
      state.filteredLandmarks = landmarks;
    },
    SET_FIRST(state, value) {
      state.first = value;
    },
  },
  actions: {
    getLandmarks({ state, commit }) {
      landmarkService.getLandmarks().then((response) => {
        commit("SET_LANDMARKS", response.data);
        if (!state.first) {
          commit("SET_FIRST", true);
          commit("SET_FILTERED_LANDMARKS", response.data);
        }
      });
    },
    getDistricts({ commit }) {
      landmarkService.getDistricts().then((response) => {
        commit("SET_DISTRICTS", response.data);
      });
    },
    syncItineraries({ state }) {
      localStorage.setItem("itineraries", JSON.stringify(state.allItineraries));
      itinerariesService.update(state.allItineraries);
    },
    getItineraries({ commit }) {
      itinerariesService.get().then((response) => {
        commit("UPDATE_ITINERARIES", response.data);
      });
    },
    getLandmarksByItinerary({ commit }, itineraryId) {
      landmarkService
        .getLandmarksByItineraryId(itineraryId)
        .then((response) => {
          commit("SET_LANDMARKS_BY_ITINERARY", response.data);
        });
    },
  },
});
