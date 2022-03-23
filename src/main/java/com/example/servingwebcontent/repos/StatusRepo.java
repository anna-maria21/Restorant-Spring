package com.example.servingwebcontent.repos;

import com.example.servingwebcontent.domain.Statuses;
import org.springframework.data.repository.CrudRepository;

public interface StatusRepo extends CrudRepository<Statuses, Long> {
}
