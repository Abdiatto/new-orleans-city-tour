package com.techelevator.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;

public class DistrictDTO {
    @NotEmpty
    private String name;
    @Positive
    private int district_id;


    public String getName() {
        return name;
    }

    public int getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(int district_id) {
        this.district_id = district_id;
    }

    public void setName(String name) {
        this.name = name;
    }

}
