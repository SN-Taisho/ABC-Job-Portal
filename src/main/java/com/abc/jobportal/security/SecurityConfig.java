package com.abc.jobportal.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	System.out.println("At authentication configure");
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
 
    	System.out.println("At security configure");
        http
        		
                .formLogin()
                    .loginPage("/login")
                    .loginProcessingUrl("/login")
                    .failureUrl("/login-error")
                    .permitAll()
                    .defaultSuccessUrl("/login-success", true)
                .and()
                .csrf()
                .and()
                .authorizeRequests()
                    .antMatchers("/").permitAll()
                    .antMatchers("/css/**").permitAll()
                    .antMatchers("/images/**").permitAll()
                    .antMatchers("/js/**").permitAll()
                    .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
                    .antMatchers(HttpMethod.GET, "/home").permitAll()
                    .antMatchers(HttpMethod.GET, "/login").permitAll()
                    .antMatchers(HttpMethod.GET, "/registration").permitAll()
                    .antMatchers(HttpMethod.GET, "/about-us").permitAll()      
                    .antMatchers(HttpMethod.GET, "/contact-us").permitAll() 
                    .antMatchers(HttpMethod.GET, "/privacy-policy").permitAll() 
                    .antMatchers(HttpMethod.GET, "/homepage").hasAnyRole("User", "Admin")
                    .antMatchers(HttpMethod.GET, "/my-profile").hasAnyRole("User", "Admin")
                    .antMatchers(HttpMethod.GET, "/view-profile").hasAnyRole("User", "Admin")
                    .antMatchers(HttpMethod.GET, "/search").hasAnyRole("User", "Admin")
                    .antMatchers(HttpMethod.GET, "/jobs").hasAnyRole("User", "Admin")
                    .antMatchers(HttpMethod.GET, "/create-thread").hasAnyRole("User", "Admin")
                    .antMatchers(HttpMethod.GET, "/create-job-post").hasRole("Admin")
                .and()
                .logout()
                    .logoutSuccessUrl("/logout")
                    .invalidateHttpSession(true);
        
        http.exceptionHandling().accessDeniedPage("/access-denied");
                  
    }
}