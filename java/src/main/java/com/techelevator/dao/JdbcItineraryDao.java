package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryAddDTO;
import com.techelevator.model.LandMark;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public Itinerary findByID(int itineraryID) {
        String sql = "SELECT * " +
                "FROM itinerary " +
                "WHERE active = true AND itinerary_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, itineraryID);
        if (results.next()) {
            return mapRowToItinerary(results);
        }
        return null;
    }

    @Override
    public List<Itinerary> findAll() {
        List<Itinerary> itineraryList = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM itinerary " +
                "WHERE active = true";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
           itineraryList.add(mapRowToItinerary(results));
        }
        return itineraryList;
    }

    private Itinerary mapRowToItinerary(SqlRowSet rs) {
        // get the user's name
        Long user_id = rs.getLong("user_id");
        JdbcUserDao userDao = new JdbcUserDao(jdbcTemplate);
        String name = userDao.getUserById(user_id).getUsername();

        // get the list of landmarks under this itinerary
        int itineraryID = rs.getInt("itinerary_id");
        String sql = "SELECT * " +
                "FROM landmarks_itinerary " +
                "WHERE itinerary_id = ?";
        SqlRowSet rsLandmarks = jdbcTemplate.queryForRowSet(sql, itineraryID);
        List<Integer> landmark_ids = new ArrayList<>();
        while (rsLandmarks.next()) {
            landmark_ids.add(rsLandmarks.getInt("landmark_id"));
        }

        // create a new instance of itinerary
        Itinerary itinerary = new Itinerary();
        itinerary.setItineraryId(itineraryID);
        itinerary.setName(name);
        itinerary.setStartingPoint(rs.getString("Starting_point"));
        itinerary.setLandMarkList(landmark_ids);
        return itinerary;
    }
}
