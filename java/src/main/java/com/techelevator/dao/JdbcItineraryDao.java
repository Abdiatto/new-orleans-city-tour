package com.techelevator.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JdbcItineraryDao implements ItineraryDao {
    JdbcTemplate jdbcTemplate;

    public JdbcItineraryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void deleteItinerary(int itineraryID) {
        String sql = "UPDATE itinerary " +
                "SET active = false " +
                "WHERE itinerary_id = ?";
        jdbcTemplate.update(sql, itineraryID);
    }

    @Override
    public void deleteItineraryLandmark(int itineraryID, int landmarkID) {
        String sql = "DELETE FROM landmarks_itinerary " +
            "WHERE itinerary_id = ? and landmark_id = ?;";
        jdbcTemplate.update(sql, itineraryID, landmarkID);
    }
}
