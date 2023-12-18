package ru.yakovitalik.phonebook.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import ru.yakovitalik.phonebook.models.ProgramUser;

import java.util.Collection;

public class ProgramUserDetails implements UserDetails {

    private final ProgramUser programUser;

    @Autowired
    public ProgramUserDetails(ProgramUser programUser) {
        this.programUser = programUser;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getPassword() {
        return this.programUser.getPassword();
    }

    @Override
    public String getUsername() {
        return this.programUser.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    // Чтобы получать данные аутентифицированного пользователя
    public ProgramUser getProgramUser() {
        return this.programUser;
    }
}
