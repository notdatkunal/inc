package com.inc.backend.service;

import com.inc.backend.domain.Post;
import com.inc.backend.exception.ApplicationException;

import java.util.List;

/**
 * Customer only has get operations in this phase
 * -- Search by title --done
 * -- Search by category --done
 * -- Search by category & location --done
 * -- Search by location --done
 */
public interface CustomerService {

    Post searchByTitle(String title) throws ApplicationException;
    List<Post> searchByCategory(String category) throws ApplicationException;
    List<Post> searchByCategoryAndLocation(String category,String location) throws ApplicationException;
    List<Post> searchByLocation(String location) throws ApplicationException;


}
