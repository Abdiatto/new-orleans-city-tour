package com.techelevator.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;

public class ItineraryDTO {
    @NotEmpty
    private String name;
    @Positive
    private Boolean active;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}
