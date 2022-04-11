package com.techelevator.dao;

import com.techelevator.model.Address;
import com.techelevator.model.District;
import com.techelevator.model.LandMark;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcLandMarkDao implements LandMarkDao{
    private JdbcTemplate jdbcTemplate;

    public JdbcLandMarkDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<LandMark> list() {
        List<LandMark> landMarks = new ArrayList<>();
        String sqlCode = " SELECT landmarks.landmark_id, landmarks.name, landmarks.content, landmarks.address_id, " +
                "address_line_1, address_line_2, city, state, zipcode, districts.district_name, districts.district_id FROM landmarks " +
                "JOIN address ON address.address_id = landmarks.landmark_id " +
                "JOIN districts ON landmarks.district_id = districts.district_id ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCode);
        while (results.next()){
            landMarks.add(mapRowToLandmark(results));
        }
        return landMarks;
    }

    @Override
    public LandMark Add(LandMark landMark) {
        return null;
    }
    @Override
    public LandMark get(int landMarkID) {
        return null;
    }

   private LandMark mapRowToLandmark(SqlRowSet row){
        LandMark landMark = new LandMark();
        Address address = new Address();
        District district = new District();
        landMark.setLandMarkId(row.getInt("LandMarkId"));
        landMark.setName(row.getString("name"));
        landMark.setContent(row.getString("content"));
        landMark.setStatus(row.getString("status"));
        address.setAddressId(row.getInt("addressId"));
        address.setAddressLineOne(row.getString("addressLineOne"));
        address.setAddressLineTwo(row.getString("addressLineTwo"));
        address.setState(row.getString("state"));
        address.setCity(row.getString("city"));
        address.setZipCode(row.getInt("zipCode"));
        district.setDistrictId(row.getInt("districtId"));
        district.setName(row.getString("name"));
        landMark.setAddress(address);
        landMark.setDistrict(district);
        return landMark;
    }
}
