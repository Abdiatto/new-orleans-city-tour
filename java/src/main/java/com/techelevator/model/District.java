package com.techelevator.model;

import java.util.List;

public class District {
    private int districtId;
    private String name;


    public District() {

    }

    public District(int districtId, String name) {
        this.districtId = districtId;
        this.name = name;
    }


    //getters and setters

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
