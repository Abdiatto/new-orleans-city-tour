package com.techelevator.controller;

import com.techelevator.dao.LandMarkDao;
import com.techelevator.model.LandMark;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

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

}
