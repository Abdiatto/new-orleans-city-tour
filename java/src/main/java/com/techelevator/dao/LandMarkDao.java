package com.techelevator.dao;

import com.techelevator.model.District;
import com.techelevator.model.LandMark;
import com.techelevator.model.LandmarkDTO;

import java.util.List;

public interface LandMarkDao {

    LandMark get(int landMarkID);
    LandMark Add(LandmarkDTO landMark);
    List<LandMark> list();
    List<District> getDistricts();
    List<LandMark> findLandmarksByItineraryId(Long itineraryID);
}
