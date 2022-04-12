package com.techelevator.dao;

import com.techelevator.model.Photo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.ArrayList;
import java.util.List;

public class JdbcPhotoDao implements PhotoDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcPhotoDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Photo> list(Integer landmark_id) {
        List<Photo> photos = new ArrayList<>();
        String sqlCode = "SELECT photos.photo_id, photo_path, featured FROM photos" +
        "JOIN landmarks_photos on photos.photo_id = landmarks_photos.photo_id " +
        "WHERE landmark_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCode, landmark_id);
        while (results.next()) {
            photos.add(mapRowToPhoto(results));
        }
        return photos;

    }
    private Photo mapRowToPhoto(SqlRowSet row) {
        Photo photo = new Photo();
        photo.setUsername(row.getString("username"));
        photo.setPath(row.getString("photo_path"));
        photo.setFeatured(row.getBoolean("featured"));
        return photo;
    }
}
