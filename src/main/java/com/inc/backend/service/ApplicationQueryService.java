package com.inc.backend.service;

import com.inc.backend.domain.Category;
import com.inc.backend.domain.Location;
import com.inc.backend.exception.ApplicationException;

import java.util.List;

public interface ApplicationQueryService {
     Category getCategoryByName(String categoryName) throws ApplicationException;
     Location getLocationByName(String locationName) throws ApplicationException;

     List<Location> getLocationByState(String state);
}
