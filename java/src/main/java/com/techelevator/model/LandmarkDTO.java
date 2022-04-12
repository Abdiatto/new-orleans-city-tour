package com.techelevator.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;

public class LandmarkDTO {
    @Positive
    private int landMarkId;
    @NotEmpty
    private String name;
    @NotEmpty
    private String content;
    @NotEmpty
    private String status;
    @NotEmpty
    private String addressLineOne;
    private String addressLineTwo;
    @NotEmpty
    private String state;
    @NotEmpty
    private String city;
    @Positive
    private int zipCode;
    @Positive
    private int district_id;

    //getters and setters

    public int getLandMarkId() {
        return landMarkId;
    }

    public void setLandMarkId(int landMarkId) {
        this.landMarkId = landMarkId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddressLineOne() {
        return addressLineOne;
    }

    public void setAddressLineOne(String addressLineOne) {
        this.addressLineOne = addressLineOne;
    }

    public String getAddressLineTwo() {
        return addressLineTwo;
    }

    public void setAddressLineTwo(String addressLineTwo) {
        this.addressLineTwo = addressLineTwo;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public int getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(int district_id) {
        this.district_id = district_id;
    }
}
