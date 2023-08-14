package com.abc.jobportal.controllers;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class MvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		Path postUploadDir = Paths.get("./post-image");
		String postUploadPath = postUploadDir.toFile().getAbsolutePath();
		
		registry.addResourceHandler("/post-image/**").addResourceLocations("file:/" + postUploadPath + "/");
	}
}
