package com.example.servingwebcontent.repos;

import com.example.servingwebcontent.domain.Dish;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DishRepo extends CrudRepository<Dish, Long> {
    List<Dish> findByName(String name);
}
