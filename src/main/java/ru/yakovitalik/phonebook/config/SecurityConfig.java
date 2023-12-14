package ru.yakovitalik.phonebook.config;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfiguration {

    // настраивает аутентификацию
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider();  // TODO
    }
}
