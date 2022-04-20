package com.techelevator.dao;

import com.techelevator.model.Review;

import java.util.List;

public interface ReviewDao {
    List<Review> list(Integer landmark_id);
    void add(Integer landmark_id, String content);
}
