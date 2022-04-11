package com.techelevator.dao;

import com.techelevator.model.Landmark;
import com.techelevator.model.Photos;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.sql.PreparedStatement;

public class JdbcLandmarkDao implements LandmarkDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcLandmarkDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public boolean createLandmark(Landmark landmark) {
        boolean landmarkCreated = false;

        // create address
        String insertAddress = "insert into Address (line1, line2, city, state, zipcode) values(?,?,?,?,?)";

        GeneratedKeyHolder keyHolder = new GeneratedKeyHolder();
        String id_column = "address_id";
        landmarkCreated = jdbcTemplate.update(con -> {
                    PreparedStatement ps = con.prepareStatement(insertAddress, new String[]{id_column});
                    ps.setString(1, landmark.getAddressLineOne());
                    ps.setString(2, landmark.getAddressLineTwo());
                    ps.setString(3, landmark.getCity());
                    ps.setString(4, landmark.getState());
                    ps.setInt(5,landmark.getZipcode());

                    return ps;
                }
                , keyHolder) == 1;
        int newAddressId = (int) keyHolder.getKeys().get(id_column);

        // create landmark
        String insertLandmark = "insert into Landmark (address_id, name, content, status) values(?,?,?,?)";

        String id_column2 = "landmark_id";
        landmarkCreated = jdbcTemplate.update(con -> {
                    PreparedStatement ps = con.prepareStatement(insertLandmark, new String[]{id_column2});
                    ps.setInt(1, newAddressId);
                    ps.setString(2, landmark.getName());
                    ps.setString(3, landmark.getContent());
                    ps.setString(4, landmark.getStatus());
                    return ps;
                }
                , keyHolder) == 1;
        int newLandmarkId = (int) keyHolder.getKeys().get(id_column2);

        // creating photos
        for (Photos p : landmark.getPhotos()) {
            String insertPhoto = "insert into Photo (user_id, landmark_id, photo_path, featured)) values(?,?,?,?)";

            String id_column3 = "photo_id";
            boolean b = jdbcTemplate.update(con -> {
                        PreparedStatement ps = con.prepareStatement(insertPhoto, new String[]{id_column3});
                        ps.setLong(1, p.getUser_id());
                        ps.setInt(2, newLandmarkId);
                        ps.setString(3, p.getPath());
                        ps.setBoolean(4, p.isFeatured());
                        return ps;
                    }
                    , keyHolder) == 1;
            int nePhotoId = (int) keyHolder.getKeys().get(id_column3);
        }

        return landmarkCreated;
    }
}
