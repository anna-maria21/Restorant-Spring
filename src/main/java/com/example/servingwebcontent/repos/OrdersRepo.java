package com.example.servingwebcontent.repos;

import com.example.servingwebcontent.domain.Orders;
import org.springframework.data.repository.CrudRepository;

public interface OrdersRepo extends CrudRepository<Orders, Long> {
}
