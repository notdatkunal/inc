package com.inc.backend.service.impl;

import com.inc.backend.domain.Category;
import com.inc.backend.domain.Location;
import com.inc.backend.exception.ApplicationException;
import com.inc.backend.repository.CategoryRepository;
import com.inc.backend.repository.LocationRepository;
import com.inc.backend.service.ApplicationQueryService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ApplicationService implements ApplicationQueryService {

    @Autowired
    private final CategoryRepository categoryRepository;
    @Autowired
    private final LocationRepository locationRepository;



    @Override
    public Category getCategoryByName(String categoryName) throws ApplicationException {
        var categoryOptional= categoryRepository.findCategoryByName(categoryName);
        if (categoryOptional.isEmpty())
                throw ApplicationException.builder()
                        .title("unknown category")
                        .Description("please choose right category")
                        .build();
        return categoryOptional.get();
    }

    @Override
    public Location getLocationByName(String locationName) throws ApplicationException{

        var locations= locationRepository.findLocationByDistrict(locationName);
         if (locations.isEmpty())
             throw ApplicationException.builder()
                     .title("unknown location selected")
                     .Description("please choose right location")
                     .build();
        return locations.get();
    }

    @Override
    public List<Location> getLocationByState(String state) {
        return locationRepository.findLocationsByState(state);
    }
}
