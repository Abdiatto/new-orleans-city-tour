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
                "JOIN users ON users.user_id = reviews.user_id " +
                "WHERE landmark_id = ? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCode, landmarkId);
        while(results.next()){
            reviews.add(mapRowToReview(results));
        }
        return reviews;
    }

    @Override
    public Review add(Review review) {
        String sql = "INSERT INTO reviews(content, thumbs_up, user_id, landmark_id) " +
                "VALUES(?, ?, ?) RETURNING review_id; ";
        Integer id = jdbcTemplate.queryForObject(sql, Integer.class,review.getContent(), review.isThumbs_Up());
        return review;
    }

    @Override
    public void update(Review review) {
        String sqlCode = "UPDATE reviews " +
                "SET content=?, thumbs_up=?, user_id=?, landmark_id=? " +
                "WHERE review_id=?";
        jdbcTemplate.update(sqlCode,review.getContent(), review.isThumbs_Up());
    }

    private Review mapRowToReview(SqlRowSet row){
        Review review = new Review();
        review.setUsername(row.getString("username"));
        review.setContent(row.getString("content"));
        review.setThumbs_Up(row.getBoolean("thumbs_up"));

        return review;
    }
}
