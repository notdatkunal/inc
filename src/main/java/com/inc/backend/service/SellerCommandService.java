package com.inc.backend.service;

import com.inc.backend.domain.Post;
import com.inc.backend.domain.Seller;
import com.inc.backend.exception.AccountCreationException;
import com.inc.backend.exception.ApplicationException;

/**
 *
 * -- Verify Seller (POST) -- delayed
 * -- Create Post (POST) -- done
 * -- Register (POST) -- done
 */

public interface SellerCommandService {

    void createPost(Post post,Integer sellerId) throws ApplicationException;

    void register(Seller seller) throws AccountCreationException;

}
