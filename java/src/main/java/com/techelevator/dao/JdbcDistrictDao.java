package com.techelevator.dao;

import com.techelevator.model.Address;
import com.techelevator.model.District;
import com.techelevator.model.DistrictDTO;
import com.techelevator.model.LandMark;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcDistrictDao implements DistrictDao {

    private JdbcTemplate jdbcTemplate;

    private DistrictDao districtDao;

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

    @Override
    public District add(DistrictDTO district) {
        String sql = " INSERT INTO districts(district_id, district_name) VALUES(DEFAULT, ?) RETURNING district_id";
        Integer id = jdbcTemplate.queryForObject(sql, Integer.class, district.getName());
        return null;
    }

    @Override
    public District get(int district_id) {
        return null;
    }


    private District mapRowToDistrict(SqlRowSet row) {
        District district = new District();
        district.setDistrictId(row.getInt("district_id"));
        district.setName(row.getString("district_name"));
        return district;
    }
}
