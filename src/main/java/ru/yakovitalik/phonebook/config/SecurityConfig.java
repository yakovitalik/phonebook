package ru.yakovitalik.phonebook.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import ru.yakovitalik.phonebook.security.AuthProviderImpl;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfiguration {

    private final AuthProviderImpl authProviderImpl;

    @Autowired
    public SecurityConfig(AuthProviderImpl authProviderImpl) {
        this.authProviderImpl = authProviderImpl;
    }

    // настраивает аутентификацию
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authProviderImpl);
    }
}
