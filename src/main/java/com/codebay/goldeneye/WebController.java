package com.codebay.goldeneye;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.GetMapping;  
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class WebController {  
   @PostMapping("/generate")
    public ResponseEntity<String> generateEmail(
        @RequestParam("name") String name,
        @RequestParam("surname") String surname,
        @RequestParam("office") String office,
        @RequestParam("department") String department,
        Model model
    ) {
        model.addAttribute("name", name);
        model.addAttribute("surname", surname);
        model.addAttribute("office", office);
        model.addAttribute("department", department);
        char nameMail = name.charAt(0);
        String surnameMail = surname.split(" ")[0];
        
        String email = nameMail + surnameMail + '.' + department + '@' + office + ".goldeneye.com";
        
        return ResponseEntity.ok(email);
    }
}
