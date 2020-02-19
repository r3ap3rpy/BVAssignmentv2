package com.example.BetVictor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class BetVictorApplication {

	@RequestMapping("/")
	public String hello(){
		return "Welcome to the v2 of my assignmenet from BetVictor!";
	}
	public static void main(String[] args) {
		SpringApplication.run(BetVictorApplication.class, args);
	}

}
