package com.example.servingwebcontent.repos;

import com.example.servingwebcontent.domain.Groups;
import org.springframework.data.repository.CrudRepository;

public interface GroupsRepo extends CrudRepository<Groups, Long> {
}
