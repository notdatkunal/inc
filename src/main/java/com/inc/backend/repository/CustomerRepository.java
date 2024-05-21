package com.inc.backend.repository;


import com.inc.backend.domain.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface CustomerRepository extends JpaRepository<Customer,Integer> {


}
