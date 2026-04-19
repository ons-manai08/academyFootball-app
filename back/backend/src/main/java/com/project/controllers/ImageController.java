package com.project.controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.project.models.ImageData;
import com.project.repository.ImageRepository;
import com.project.service.ImageIService;
@RestController
@RequestMapping("/image")
public class ImageController {
	
	 @Autowired
	 private ImageIService service;

    @PostMapping("/upload")
    public ResponseEntity<?> uploadImage(@RequestParam("image") MultipartFile file,@RequestParam("description")String description ,@RequestParam("title") String title) throws IOException {
        ImageData uploadImage = service.uploadImage(file,description,title);
        return ResponseEntity.status(HttpStatus.OK)
                .body(uploadImage);
    }

    @GetMapping("/download/{id}")
    public ResponseEntity<?> downloadImage(@PathVariable Long id){
    	byte[] imageData=service.downloadImage(id);
        return ResponseEntity.status(HttpStatus.OK)
                .contentType(MediaType.valueOf("image/png"))
                .body(imageData);

    }
}