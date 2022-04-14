package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryAddDTO;

public interface ItineraryDao {

    void deleteItinerary (int itineraryID);
    void deleteItineraryLandmark (int itineraryID, int landmarkID);
    Itinerary add(Itinerary itinerary);
    void update(ItineraryAddDTO itineraryAddDTO, Integer itineraryID);


}
