package com.techelevator.model;

import javax.validation.constraints.NotEmpty;

public class ItineraryDTO {
    @NotEmpty
    private String name;
    @NotEmpty
    private String startingPoint;

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
}
