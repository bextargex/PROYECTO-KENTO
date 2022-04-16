package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{

	@Bean
    public BCryptPasswordEncoder passwordCodifica() {
        return new BCryptPasswordEncoder();
    }


   @Override
   public void configure(AuthenticationManagerBuilder auth) throws Exception {
       PasswordEncoder encoder = passwordCodifica();
       UserBuilder usuarios=org.springframework.security.core.userdetails.User.builder().passwordEncoder(password ->{return encoder.encode(password);});
       auth.inMemoryAuthentication()
       .withUser(usuarios.username("Admninistrador").password("123").roles("ADMIN","USER"))
       .withUser(usuarios.username("David").password("123").roles("USER"));

   }
   

	 @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.authorizeRequests()
	        .antMatchers("/","/css/", "/images/","/js/","/webfonts/").permitAll()
	        .anyRequest() .authenticated()
	        .and().formLogin().loginPage("/").defaultSuccessUrl("/principal").permitAll()
	        .and().logout().permitAll()
	        ;
	    }

	
	
}
