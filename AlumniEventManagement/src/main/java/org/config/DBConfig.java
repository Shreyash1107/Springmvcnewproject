package org.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class DBConfig {
	@Bean(name = "datasource")
	public DriverManagerDataSource getsource() {
		DriverManagerDataSource datasource = new DriverManagerDataSource();
		datasource.setUsername("root");
		datasource.setPassword("Shreyash@123");
		datasource.setUrl("jdbc:mysql://localhost:3306/alumnieventmvc");
		datasource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		return datasource;
	}
	@Bean(name = "template")
	public JdbcTemplate getdata() {
		return new JdbcTemplate(getsource());
	}
}
