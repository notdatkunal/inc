package com.inc.backend.repository;

import com.inc.backend.domain.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LocationRepository extends JpaRepository<Location, Integer> {

     Optional<Location> findLocationByDistrict(String district);

     List<Location> findLocationsByState(String state);

}
