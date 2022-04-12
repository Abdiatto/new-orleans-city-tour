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
public class JdbcDistrictDao implements DistrictDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcDistrictDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<District> list() {
        List<District> districts = new ArrayList<>();
        String sqlCode = "SELECT districts.district_id, district_name FROM districts";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCode);
        while (results.next()){
            districts.add(mapRowToDistrict(results));
        }
        return districts;
    }

    private District mapRowToDistrict(SqlRowSet row) {
        District district = new District();
        district.setDistrictId(row.getInt("district_id"));
        district.setName(row.getString("district_name"));
        return district;
    }
}
