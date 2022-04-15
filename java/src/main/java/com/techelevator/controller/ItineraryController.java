package com.techelevator.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.techelevator.dao.ItineraryDao;
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
    @RequestMapping (path= "/itineraries/{itineraryID}", method = RequestMethod.DELETE)
    public void deleteItinerary (@PathVariable Integer itineraryID) {
        itineraryDao.deleteItinerary(itineraryID);
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping (path = "/itineraries/{itineraryID}/{landmarkID}", method = RequestMethod.DELETE)
    public void deleteItineraryLandmark (@PathVariable Integer itineraryID, @PathVariable Integer landmarkID) {
        itineraryDao.deleteItineraryLandmark(itineraryID, landmarkID);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path="/itineraries", method=RequestMethod.POST)
    public Itinerary add(@RequestBody Itinerary itinerary) {
        return itineraryDao.add(itinerary);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path="/itineraries/{itineraryID}", method=RequestMethod.PUT)
    public void update(@PathVariable Integer itineraryID, @RequestBody ItineraryAddDTO itineraryAddDTO) {
        itineraryDao.update(itineraryAddDTO, itineraryID);
    }
    @RequestMapping(path = "/itinerary/{itineraryID}", method=RequestMethod.GET)
    public ResponseEntity<ItineraryResponse> getItineraryByID(@PathVariable Integer itineraryID) {
        Itinerary itinerary = itineraryDao.findByID(itineraryID);
        if (itinerary != null)
            return new ResponseEntity<>(new ItineraryResponse(itinerary), HttpStatus.OK);
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    @RequestMapping(path= "/itineraries", method= RequestMethod.GET)
    public ResponseEntity<List<ItineraryResponse>> getAllItineraries() {
        List<Itinerary> itineraryList = itineraryDao.findAll();
        List<ItineraryResponse> responses = new ArrayList<>();
        for (Itinerary itinerary: itineraryList) {
            responses.add(new ItineraryResponse(itinerary));
        }
        return new ResponseEntity<>(responses, HttpStatus.OK);
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

