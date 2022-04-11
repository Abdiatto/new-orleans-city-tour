package com.techelevator.model;

public class LandMark {
    private int landMarkId;
    private String name;
    private String content;
    private Address address;

//setters and getters
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

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
