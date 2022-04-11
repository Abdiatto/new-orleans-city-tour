package com.techelevator.model;

public class Landmark {
    private String name = "";
    private String content = "";
    private String status = "";
    private String addressLineOne = "";
    private String addressLineTwo = "";
    private String state = "";
    private String city = "";
    private int zipcode = 0;

    private Photos [] photos;

    public Landmark(String name, String content, String status, String addressLineOne, String addressLineTwo, String state, String city, int zipcode, Photos[] photos) {
        this.name = name;
        this.content = content;
        this.addressLineOne = addressLineOne;
        this.addressLineTwo = addressLineTwo;
        this.state = state;
        this.city = city;
        this.zipcode = zipcode;
        this.photos = photos;
        this.status = status;
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

    public int getZipcode() {
        return zipcode;
    }

    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }

    public Photos[] getPhotos() {
        return photos;
    }

    public void setPhotos(Photos[] photos) {
        this.photos = photos;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
