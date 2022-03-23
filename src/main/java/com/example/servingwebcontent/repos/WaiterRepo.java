package com.example.servingwebcontent.repos;

import com.example.servingwebcontent.domain.Waiter;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface WaiterRepo extends CrudRepository<Waiter, Long> {
    Waiter findByPhoneNumber(String phone_number);
    List<Waiter> findByFullNameWaiter(String name);

}
