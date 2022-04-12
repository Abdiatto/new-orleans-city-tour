package com.techelevator.controller;

import com.techelevator.dao.LandMarkDao;
import com.techelevator.model.Address;
import com.techelevator.model.LandMark;
import com.techelevator.model.LandmarkDTO;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
@RestController
public class LandMarkController {
    private LandMarkDao landMarkDao;

    public LandMarkController(LandMarkDao landMarkDao) {
        this.landMarkDao = landMarkDao;
    }
    @RequestMapping(path="/landmarks", method = RequestMethod.GET)
    public List<LandMark> list() {
        return landMarkDao.list();
    }
    @RequestMapping(path="/landmarks/{id}", method = RequestMethod.GET)
    public LandMark get(@PathVariable("id") int landMarkId){
        return landMarkDao.get(landMarkId);
    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path="/landmarks/add", method = RequestMethod.POST)
    public void post(@Valid @RequestBody LandmarkDTO landmarkDTO) {
        Address address = new Address();
        address.setAddressLineOne(landmarkDTO.getAddressLineOne());
        address.setAddressLineTwo(landmarkDTO.getAddressLineTwo());
        address.setCity(landmarkDTO.getCity());
        address.setState(landmarkDTO.getState());
        address.setZipCode(landmarkDTO.getZipCode());
        landMarkDao.Add(new LandMark(
                landmarkDTO.getLandMarkId(),
                landmarkDTO.getName(),
                landmarkDTO.getContent(),
                landmarkDTO.getStatus(),
                address,
                landmarkDTO.getDistrict_id()));
    }

}
