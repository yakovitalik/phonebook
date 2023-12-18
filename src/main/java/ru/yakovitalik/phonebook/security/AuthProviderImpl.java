package ru.yakovitalik.phonebook.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import ru.yakovitalik.phonebook.services.ProgramUserDetailsService;

import java.util.Collections;

@Component
public class AuthProviderImpl implements AuthenticationProvider {

    private final ProgramUserDetailsService programUserDetailsService;

    @Autowired
    public AuthProviderImpl(ProgramUserDetailsService programUserDetailsService) {
        this.programUserDetailsService = programUserDetailsService;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();

        UserDetails programUserDetails = programUserDetailsService.loadUserByUsername(username);

        String password = authentication.getCredentials().toString();
        if(!password.equals(programUserDetails.getPassword())) {
            throw new BadCredentialsException("Неправильный пароль!");
        }

        return new UsernamePasswordAuthenticationToken(programUserDetails, password, Collections.emptyList());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
}
