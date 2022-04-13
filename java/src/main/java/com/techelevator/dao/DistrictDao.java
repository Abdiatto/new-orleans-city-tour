package com.techelevator.dao;

import com.techelevator.model.District;
import com.techelevator.model.DistrictDTO;

import java.util.List;

public interface DistrictDao {

    District get(int district_id);
    District add(DistrictDTO district);
    List<District> list();
}
