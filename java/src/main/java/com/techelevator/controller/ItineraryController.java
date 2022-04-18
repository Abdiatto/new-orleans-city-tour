package com.techelevator.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.techelevator.dao.ItineraryDao;
import com.techelevator.model.ItinerariesDTO;
import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryAddDTO;
import com.techelevator.model.ItineraryDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
public class ItineraryController {
    ItineraryDao itineraryDao;

    public ItineraryController(ItineraryDao itineraryDao) {
        this.itineraryDao = itineraryDao;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping (path = "/itineraries/{itineraryID}/{landmarkID}", method = RequestMethod.DELETE)
    public void deleteItineraryLandmark (@PathVariable Integer itineraryID, @PathVariable Integer landmarkID) {
        itineraryDao.deleteItineraryLandmark(itineraryID, landmarkID);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path="/itineraries/{itineraryID}", method=RequestMethod.PUT)
    public void update(@PathVariable Integer itineraryID, @RequestBody ItineraryAddDTO itineraryAddDTO) {
        itineraryDao.update(itineraryAddDTO, itineraryID);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path="/itineraries", method=RequestMethod.PUT)
    public void testUpdate(@RequestBody String dto) {
        itineraryDao.testUpdate(dto);
    }

    @RequestMapping(path="/itineraries", method=RequestMethod.GET)
    public String testGet(){
        return itineraryDao.testGet();
    }

    static class ItineraryResponse {
        private Itinerary itinerary;

        public ItineraryResponse(Itinerary itinerary) {
            this.itinerary = itinerary;
        }

        @JsonProperty("itinerary")
        public Itinerary getItinerary() {
            return itinerary;
        }

        public void setItinerary(Itinerary itinerary) {
            this.itinerary = itinerary;
        }
    }
}

