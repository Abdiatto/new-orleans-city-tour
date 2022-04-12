import axios from "axios";

export default {
    getLandmark(){
        return axios.get('/landmarks');
    },
    addLandmark(landmark){
        return axios.post('/landmarks', landmark)
    },
    getDistricts(){
        return axios.get('/districts')
    }

}