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
        String sqlCode = " ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCode);
        while (results.next()){
            landMarks.add(mapRowToLandmark(results));
        }
        return null;
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
