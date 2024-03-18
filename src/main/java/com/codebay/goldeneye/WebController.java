package com.codebay.goldeneye;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.GetMapping;  
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.http.ResponseEntity;
@Controller
public class WebController {  
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @PostMapping("/generate")
    public ResponseEntity<String> generateEmail(
        @RequestParam("name") String name,
        @RequestParam("surname") String surname,
        @RequestParam("office") String office,
        @RequestParam("department") String department,
        Model model
    ) {

        char nameMail = name.charAt(0);
        String surnameMail = surname.split(" ")[0];
        
        String email = nameMail + surnameMail + '.' + department + '@' + office + ".goldeneye.com";
        
        return ResponseEntity.ok(email);
    }
}