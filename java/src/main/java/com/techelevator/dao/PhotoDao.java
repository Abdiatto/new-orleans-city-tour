package com.techelevator.dao;

import com.techelevator.model.Photo;

import java.util.List;

public interface PhotoDao {

     List<Photo> list(Integer landmark_id);
     void add(Integer landmarkId, String photoPath);
}
