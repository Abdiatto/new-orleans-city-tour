package com.techelevator.dao;

import com.techelevator.controller.LandmarkController;
import com.techelevator.model.LandMark;

public interface LandMarkDao {
    LandMark get(int landMarkId);
    LandMark add(LandMark landMark);
}
