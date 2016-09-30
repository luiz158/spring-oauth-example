package de.frontierpsychiatrist.example.oauth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.sql.DataSource;

/**
 * @author Moritz Schulze
 */
@SpringBootApplication
public class ResourceServerMain {

    @Configuration
    static class CorsConfig extends WebMvcConfigurerAdapter {

        @Override
        public void addCorsMappings(CorsRegistry registry) {
            // TODO only for OPTIONS requests, but Chrome expect Acess-Control-Allow-Origin on all responses!
            // TODO or maybe chrome can't accept the fact of 403 and no header?
            registry.addMapping("/todos/**").allowedMethods("GET", "HEAD", "PUT", "POST", "DELETE");
        }
    }

    /**
     * Main data source containing the credentials.
     * In this is example this is the DB from the resource server.
     */
    @Bean
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource mainDataSource() {
        return DataSourceBuilder.create().build();
    }

    public static void main(String[] args) {
        SpringApplication.run(ResourceServerMain.class, args);
    }

}
