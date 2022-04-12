package com.techelevator.dao;

import com.techelevator.model.Photo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcPhotoDao implements PhotoDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcPhotoDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Photo> list(Integer landmark_id) {
        List<Photo> photos = new ArrayList<>();
        String sqlCode = "SELECT photos.photo_id, photo_path, featured, username FROM photos " +
        "JOIN landmarks_photos on photos.photo_id = landmarks_photos.photo_id " +
                "JOIN users ON users.user_id = photos.user_id " +
        "WHERE landmark_id = ? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCode, landmark_id);
        while (results.next()) {
            photos.add(mapRowToPhoto(results));
        }
        return photos;
    }

    @Override
    public void add(Integer landmarkId, String photoPath) {
        String sql = "INSERT INTO photos(user_id, photo_path, featured) " +
                "VALUES (2,?, true) RETURNING photo_id; ";
        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, photoPath);
        String sql2 = "INSERT INTO landmarks_photos(landmark_id, photo_id) " +
                "VALUES (?, ?); ";
        jdbcTemplate.update(sql2, landmarkId,id );
    }

    private Photo mapRowToPhoto(SqlRowSet row) {
        Photo photo = new Photo();
        photo.setUsername(row.getString("username"));
        photo.setPath(row.getString("photo_path"));
        photo.setFeatured(row.getBoolean("featured"));
        return photo;
    }
}
