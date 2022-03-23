package com.example.servingwebcontent.repos;

import com.example.servingwebcontent.domain.Dish;
import com.example.servingwebcontent.domain.Groups;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalTime;
import java.util.List;

@Repository
public interface AnalyseRepository extends JpaRepository<Dish, Long> {

    @Query("select d from Dish d left join d.group")
    List<Dish> generateMenu();

    @Query("select d from Dish d left join d.group where d.group=?1")
    List<Dish> generateMenuCategory(Groups group);

    @Query(value = "select d.name as name, d.weight as weight, d.price as price\n" +
            "from dish as d\n" +
            "where d.price <= ?2 and d.price >= ?1", nativeQuery = true)
    List<EntityRepo> betweenPrice(Float price1, Float price2);

    @Query(value = "select d.name as name, count(od.dish_id) as counter\n" +
            "from dish as d\n" +
            "inner join order_dish as od\n" +
            "on d.id = od.dish_id\n" +
            "inner join orders as o\n" +
            "on o.id = od.order_id\n" +
            "where o.time < ?2 and o.time > ?1 and o.id_status = 1\n" +
            "group by od.dish_id\n" +
            "order by count(od.dish_id)", nativeQuery = true)
    List<EntityRepo> countDishes(LocalTime time1, LocalTime time2);

    @Query(value = "select d.name as name, d.price as price, count(od.dish_id) as counter \n" +
            "from dish as d\n" +
            "left join order_dish as od\n" +
            "on d.id = od.dish_id\n" +
            "group by od.dish_id", nativeQuery = true)
    List<EntityRepo> amountOfDishes();

    @Query(value = "select w.full_name_waiter as name, count(o.id) as counter\n" +
            "from waiter as w\n" +
            "inner join orders as o\n" +
            "on o.id_waiter = w.id_waiter\n" +
            "group by o.id_waiter", nativeQuery = true)
    List<EntityRepo> workWaiters();

    @Query(value = "select g.full_name as name, count(o.id) as counter, sum(o.price) as price\n" +
            "from guest as g\n" +
            "left join orders as o\n" +
            "on o.id_guest = g.id\n" +
            "group by o.id_guest", nativeQuery = true)
    List<EntityRepo> ordersGuests();
}
