package com.techelevator.dao;

import com.techelevator.model.Review;
import org.apache.catalina.valves.rewrite.RewriteCond;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcReviewDao implements ReviewDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<Review> list(Integer landmarkId) {
        List<Review> reviews = new ArrayList<>();
        String sqlCode = "SELECT reviews.review_id, content, thumbs_up, username FROM reviews " +
                "JOIN landmarks_reviews ON reviews.review_id = landmarks_reviews.review_id " +
                "JOIN users ON users.user_id = reviews.user_id " +
                "WHERE landmark_id = ? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCode, landmarkId);
        while(results.next()){
            reviews.add(mapRowToReview(results));
        }
        return reviews;
    }

    @Override
    public void add(Integer landmarkId, String content) {
        String sql = "INSERT INTO reviews(content, thumbs_up, user_id) " +
                "VALUES(?, ?, ?) RETURNING review_id; ";
        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, content);
        String sql2 = "INSERT INTO landmarks_reviews(landmark_id, review_id) " +
                "VALUES(?, ?);";
        jdbcTemplate.update(sql2,landmarkId,id);
    }

    private Review mapRowToReview(SqlRowSet row){
        Review review = new Review();
        review.setUsername(row.getString("username"));
        review.setContent(row.getString("content"));
        review.setThumbs_Up(row.getBoolean("thumbs_up"));
        return review;
    }
}
