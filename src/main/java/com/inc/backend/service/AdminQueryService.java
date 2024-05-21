package com.inc.backend.service;

import com.inc.backend.domain.Category;
import com.inc.backend.domain.Location;
import com.inc.backend.domain.Post;
import com.inc.backend.domain.Seller;
import com.inc.backend.exception.IdNotFoundException;

import java.util.List;

/**
 * will contain only GET Operations for admin
 *  -- Return List of all Sellers -- done
 *  -- Return List of all Posts -- done
 *  -- Return List of all Categories -- done
 *  -- Return List of all Locations --done
 *  -- Return Location By ID -- done
 *  -- Return Category By ID -- done
*/
public interface AdminQueryService {

    List<Seller> listSellers();

    List<Post> listPosts();

    List<Category> listCategories();

    List<Location> listLocations();

    Location getLocationById(Integer locationId) throws IdNotFoundException;

    Category getCategoryById(Integer categoryId) throws IdNotFoundException;


    List<String> listStates();
}
