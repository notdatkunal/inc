//package com.inc.backend.service.impl;
//
//import com.inc.backend.domain.Admin;
//import com.inc.backend.domain.Role;
//import com.inc.backend.repository.AdminRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Service;
//
//import java.util.HashSet;
//
//@Service
//public class LoginService implements UserDetailsService {
//
//    @Autowired
//    private PasswordEncoder passwordEncoder;
//    @Autowired
//    private AdminRepository adminRepository;
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        System.out.print("this is username "+username);
//
//        return adminRepository.findUserByUsername(username).orElseThrow(()->new UsernameNotFoundException(username));
//
//    }
//}
