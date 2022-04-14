package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Itinerary {
    private int itineraryId;
    private String name;
    private String startingPoint;
    private List<Integer> landMarkList = new ArrayList<Integer>();

    public Itinerary() {
    }

    public Itinerary(int itineraryId, String name, String startingPoint) {
        this.itineraryId = itineraryId;
        this.name = name;
        this.startingPoint = startingPoint;
    }

    public int getItineraryId() {
        return itineraryId;
    }

    public void setItineraryId(int itineraryId) {
        this.itineraryId = itineraryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartingPoint() {
        return startingPoint;
    }

    public void setStartingPoint(String startingPoint) {
        this.startingPoint = startingPoint;
    }

    public List<Integer> getLandMarkList() {
        return landMarkList;
    }

    public void setLandMarkList(List<Integer> landMarkList) {
        this.landMarkList = landMarkList;
    }
}
