package com.project.service;

import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.project.models.ImageData;
import com.project.repository.ImageRepository;


@Service
@Transactional
//@ComponentScan(basePackageClasses = ServiceUser.class)
public class ImageDataService implements ImageIService {
	@Autowired
    private ImageRepository imageRepositoy;


	@Override
	public ImageData uploadImage(MultipartFile file, String description, String title) throws IOException {
		try {
	        byte[] imageDataBytes = file.getBytes();
	        ImageData imageData = ImageData.builder()
	                .name(UUID.randomUUID().toString())
	                .type(file.getContentType())
	                .imageData(imageDataBytes)
	                .build();
	        imageData.setDescription(description);
	        imageData.setTitle(title);
	        return imageRepositoy.save(imageData);
	    } catch (IOException e) {
	        // handle or re-throw the exception as needed
	        throw new IOException("Failed to read file data", e);
	    }
	}



	@Override
	public byte[]  downloadImage(Long fileId) {
		Optional<ImageData> dbImageData = imageRepositoy.findById(fileId);
        byte[] images= dbImageData.get().getImageData();
        
        return images;
	}

	    
	   


}
/*ImageData imageData = dbImageData.orElse(new ImageData());

String title = imageData.getTitle();
String description = imageData.getDescription();*/