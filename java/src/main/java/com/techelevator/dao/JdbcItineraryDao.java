package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryAddDTO;
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

    @Override
    public Itinerary add(Itinerary itinerary) {
        String sql = "INSERT INTO itinerary(user_id, active) " +
                "VALUES(?, ?) RETURNING itinerary_id;";
        jdbcTemplate.queryForObject(sql, Integer.class, itinerary.getItineraryId());
        return itinerary;
    }

    @Override
    public void update(ItineraryAddDTO itineraryAddDTO, Integer itineraryID) {
        String sql = "UPDATE landmarks_itinerary " +
                "SET landmark_id = ? " +
                "WHERE itinerary_id = ?";
        jdbcTemplate.update(sql, itineraryAddDTO.getLandmarkId(), itineraryID);
    }

}
