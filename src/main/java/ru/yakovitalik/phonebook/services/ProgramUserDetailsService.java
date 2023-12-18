package ru.yakovitalik.phonebook.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.yakovitalik.phonebook.models.ProgramUser;
import ru.yakovitalik.phonebook.repositories.ProgramUserRepository;
import ru.yakovitalik.phonebook.security.ProgramUserDetails;

import java.util.Optional;

@Service
public class ProgramUserDetailsService implements UserDetailsService {
    private final ProgramUserRepository programUserRepository;

    @Autowired
    public ProgramUserDetailsService(ProgramUserRepository programUserRepository) {
        this.programUserRepository = programUserRepository;
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<ProgramUser> programUser = programUserRepository.findByUsername(username);

        if(programUser.isEmpty()) {
            throw new UsernameNotFoundException("Пользователь не найден!");
        }

        return new ProgramUserDetails(programUser.get());
    }
}
