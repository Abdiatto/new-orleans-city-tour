package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryAddDTO;
import com.techelevator.model.LandMark;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface ItineraryDao {

    void deleteItinerary (int itineraryID);
    void deleteItineraryLandmark (int itineraryID, int landmarkID);
    Itinerary add(Itinerary itinerary);
    void update(ItineraryAddDTO itineraryAddDTO, Integer itineraryID);
    Itinerary findByID(int itineraryID);
    List<Itinerary> findAll();
}
