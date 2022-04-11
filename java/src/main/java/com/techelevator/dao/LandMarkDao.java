package com.techelevator.dao;

import com.techelevator.model.LandMark;

import java.util.List;

public interface LandMarkDao {

    LandMark get(int landMarkID);
    LandMark Add(LandMark landMark);
    List<LandMark> list();
}
