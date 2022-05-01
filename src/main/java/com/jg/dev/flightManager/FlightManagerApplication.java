package com.jg.dev.flightManager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ResourceBundleMessageSource;

@SpringBootApplication
public class FlightManagerApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(SpringApplicationBuilder.class);
	}

	@Bean
	public ResourceBundleMessageSource messageSource(){

		ResourceBundleMessageSource resources = new ResourceBundleMessageSource();

		resources.setBasename("resources/messages");

		return resources;
	}

	public static void main(String[] args) {
		SpringApplication.run(FlightManagerApplication.class, args);
	}

}
