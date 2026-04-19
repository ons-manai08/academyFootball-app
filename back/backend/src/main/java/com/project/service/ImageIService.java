package com.project.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.project.models.ImageData;

public interface ImageIService {
	public ImageData uploadImage(MultipartFile file, String description, String title) throws IOException;
    public byte[] downloadImage(Long fileId);
}