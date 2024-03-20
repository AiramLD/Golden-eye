package com.codebay.goldeneye;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
// Importa la clase correspondiente de la API para modificar nombres y apellidos

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
    private String manipulateFullName(String fullName) {
        String[] parts = fullName.split("\\s+");
        StringBuilder manipulatedFullNameBuilder = new StringBuilder();
    
        for (String part : parts) {
            String manipulatedPart = part.substring(0, 1).toUpperCase() + part.substring(1).toLowerCase();
    
            manipulatedFullNameBuilder.append(manipulatedPart).append(" ");
        }
    
        String manipulatedFullName = manipulatedFullNameBuilder.toString().trim();
    
        // Create an instance to the class InappropriateWordsRemover

        // InappropriateWordsRemover remover = new InappropriateWordsRemover();
        // String cleanedFullName = remover.removeInappropriateWords(manipulatedFullName);
    

        // Return the cleaned full name
        return manipulatedFullName;
    }
    
}