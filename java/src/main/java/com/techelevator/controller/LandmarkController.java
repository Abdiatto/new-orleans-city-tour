package com.techelevator.controller;

import com.techelevator.dao.LandmarkDao;
import com.techelevator.model.*;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Locale;

@RestController
@CrossOrigin
public class LandmarkController {

    private LandmarkDao landmarkDao;

    public LandmarkController(LandmarkDao landmarkDao) {
        this.landmarkDao = landmarkDao;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/landmark/create", method = RequestMethod.POST)
    public void register(@Valid @RequestBody LandmarkDTO newLandmark) {
        landmarkDao.createLandmark(new Landmark(
                newLandmark.getName(),
                newLandmark.getContent(),
                newLandmark.getStatus(),
                newLandmark.getAddressLineOne(),
                newLandmark.getAddressLineTwo(),
                newLandmark.getCity(),
                newLandmark.getState(),
                newLandmark.getZipcode(),
                newLandmark.getPhotos()
        ));
    }
}
