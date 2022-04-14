package com.techelevator.controller;

import com.techelevator.dao.ItineraryDao;
import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryAddDTO;
import com.techelevator.model.ItineraryDTO;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
public class ItineraryController {
    ItineraryDao itineraryDao;

    public ItineraryController(ItineraryDao itineraryDao) {
        this.itineraryDao = itineraryDao;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping (path= "/itineraries/{itineraryID}", method = RequestMethod.PUT)
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


}

