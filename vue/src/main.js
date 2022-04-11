import Vue from "vue";
import App from "./App.vue";
import router from "./router/index";
import store from "./store/index";
import axios from "axios";
import DynamicImage from "./components/DynamicImage";

Vue.config.productionTip = false;

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

Vue.component("dynamic-image", DynamicImage);

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
