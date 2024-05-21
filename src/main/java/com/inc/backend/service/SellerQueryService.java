package com.inc.backend.service;


import com.inc.backend.domain.Post;
import com.inc.backend.domain.Seller;
import com.inc.backend.exception.IdNotFoundException;
import com.inc.backend.exception.LogoutException;

import java.util.List;

/**
 * Will Contain all GET Operations for Sellers
 * -- View Seller Profile by Seller id -- done
 * -- View Post By PostId -- done
 * -- Get List Of Posts by Seller id --done
 * -- Get Metrics For Post by Post id -- delayed
 * */
public interface SellerQueryService {

    Seller getSellerById(Integer sellerId) throws IdNotFoundException;
    Post getPostById(Integer postId) throws IdNotFoundException;

    List<Post> getPostsBySellerId(Integer sellerId) throws IdNotFoundException;


    boolean authenticate(String username, String password) throws LogoutException;
}
