package ru.yakovitalik.phonebook.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.yakovitalik.phonebook.models.ProgramUser;

import java.util.Optional;

@Repository
public interface ProgramUserRepository extends JpaRepository<ProgramUser, Integer> {
    Optional<ProgramUser> findByUsername(String username);
}
