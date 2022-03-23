package com.example.servingwebcontent.repos;

import com.example.servingwebcontent.domain.Guest;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface GuestRepo extends CrudRepository<Guest, Long> {
    List<Guest> findByPhoneNumber(String phoneNumber);
}
