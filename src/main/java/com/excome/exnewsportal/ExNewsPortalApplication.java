package com.excome.exnewsportal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class ExNewsPortalApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExNewsPortalApplication.class, args);
	}

}
