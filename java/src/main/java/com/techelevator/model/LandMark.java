package com.techelevator.model;

import java.util.List;

public class LandMark {
    private int landMarkId;
    private String name;
    private String content;
    private String status;
    private Address address;
    private District district;
    private List<Photo> photos;

    public List<Photo> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }
//getters and setters


    public LandMark() {
    }

    public LandMark(int landMarkId, String name, String content, String status, Address address, District district) {
        this.landMarkId = landMarkId;
        this.name = name;
        this.content = content;
        this.status = status;
        this.address = address;
        this.district = district;
    }

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

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }
}
