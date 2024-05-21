package com.inc.backend.repository;


import com.inc.backend.domain.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SellerRepository extends JpaRepository<Seller,Integer> {
    Optional<Seller> findSellerByUsername(String username);

}
