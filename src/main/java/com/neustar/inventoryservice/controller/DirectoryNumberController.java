package com.neustar.inventoryservice.controller;

import com.neustar.inventoryservice.data.dto.DirectoryNumber;
import com.neustar.inventoryservice.data.dto.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/directory-number")
public class DirectoryNumberController {

    @Autowired
    RestTemplate restTemplate;

    @PostMapping
    public ResponseEntity<DirectoryNumber> addNumber(@RequestBody DirectoryNumber directoryNumber){
        System.out.println("DN is added --> " + directoryNumber);
        Email emailNotification = new Email("vishal@test.com", "DN is added successfully", "Hi Vishal, This is regarding ...");
//        restTemplate.postForEntity("http://localhost:8081/api/email-notification", emailNotification, Boolean.class);
        restTemplate.postForEntity("http://notification-service.cscp-loms-nt-cmf-mesh:8080/api/email-notification", emailNotification, Boolean.class);
        return new ResponseEntity<>(directoryNumber, HttpStatus.CREATED);
    }

}
