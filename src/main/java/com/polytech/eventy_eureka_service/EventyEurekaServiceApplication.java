package com.polytech.eventy_eureka_service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class EventyEurekaServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(EventyEurekaServiceApplication.class, args);
	}

}
