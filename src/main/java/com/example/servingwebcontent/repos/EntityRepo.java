package com.example.servingwebcontent.repos;

import org.springframework.stereotype.Repository;

@Repository
public interface EntityRepo {
    String getName();
    Integer getCounter();
    Integer getWeight();
    Float getPrice();
}
