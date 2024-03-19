package com.codebay.goldeneye;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WebController {

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("employee", new Employee());
        return "index";
    }
    @PostMapping("/postEmail")
    public String postEmail(Model model, @RequestParam String name, @RequestParam String surname, @RequestParam String office, @RequestParam String department) throws Exception {
        String email = generateEmail(name, surname, office, department);
        model.addAttribute("email", email);
        return "postEmail";
    }
    
    private String generateEmail(String name, String surname, String office, String department) {
        char firstLetter = Character.toLowerCase(name.charAt(0));
        String surnameLower = surname.split(" ")[0].toLowerCase();
        String officeLower = office.toLowerCase();
        String departmentLower = department.split(" ")[0].toLowerCase();
    
        StringBuilder emailBuilder = new StringBuilder();
        emailBuilder.append(firstLetter)
                    .append(surnameLower)
                    .append('.')
                    .append(departmentLower)
                    .append('@')
                    .append(officeLower)
                    .append(".goldeneye.com");
    
        return emailBuilder.toString();
    }

   @GetMapping("/manipulate")
   public String manipulate(Model model) {
       model.addAttribute("fullName", "");
       return "manipulate";
   }
   
   @PostMapping("/manipulate")
   public String manipulateString(@RequestParam("fullName") String fullName, Model model) {
       if (fullName == null || fullName.trim().isEmpty()) {
           model.addAttribute("error", "El nombre completo no puede estar vacío.");
           return "manipulate";
       }
   
       String[] parts = fullName.split("\\s+");
       if (parts.length < 2) {
           model.addAttribute("error", "El nombre completo debe contener al menos un nombre y un apellido.");
           return "manipulate";
       }
   
       String name = parts[0];
       String surname = parts[parts.length - 1];
   
       String manipulatedName = name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
   
       String manipulatedFullName = manipulatedName + " " + surname;
   
       model.addAttribute("manipulatedFullName", manipulatedFullName);
   
       return "result";
   }
}