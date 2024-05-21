package com.inc.backend.controller;

import com.inc.backend.domain.Admin;
import com.inc.backend.domain.AdminDTO;
import com.inc.backend.helper.LoginResponse;
import com.inc.backend.service.impl.AuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@RestController
@RequestMapping("/auth")
public class AuthenticationController {

    @GetMapping("/create")
    public ModelAndView Create(ModelAndView modelAndView){
        modelAndView.setViewName("create.html");
        return modelAndView;
    }

    @GetMapping("/login")
    public ModelAndView login(ModelAndView modelAndView){
        modelAndView.setViewName("login.html");
        return modelAndView;
    }
    @Autowired
    private AuthenticationService authenticationService;

    @PostMapping("/register")
    public Admin registerAdmin(@RequestBody AdminDTO admin){

        return authenticationService.register(admin.getUsername(),admin.getPassword());
    }

    @PostMapping("/login")
    public LoginResponse loginResponse(@RequestBody AdminDTO loginResponse){

        return authenticationService.loginResponse(loginResponse.getUsername(),loginResponse.getPassword());
    }





}


