package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.domain.*;
import com.example.servingwebcontent.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class OrdersController {
    @Autowired
    private OrdersRepo ordersRepo;

    @Autowired
    private GuestRepo guestRepo;

    @Autowired
    private WaiterRepo waiterRepo;

    @Autowired
    private StatusRepo statusRepo;

    @Autowired
    private SaleRepo saleRepo;

    @Autowired
    private DishRepo dishRepo;

    @Autowired
    private GroupsRepo groupsRepo;

    @GetMapping("/orders")
    public String main(Model model) {
        Iterable<Orders> orders = ordersRepo.findAll();

        model.addAttribute("orders", orders)
                .addAttribute("guests", guestRepo.findAll())
                .addAttribute("sales", saleRepo.findAll())
                .addAttribute("statuses", statusRepo.findAll())
                .addAttribute("waiters", waiterRepo.findAll())
                .addAttribute("categories", groupsRepo.findAll());
        return "orders";
    }


    @PostMapping("/orders")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam Long idWaiter,
            @RequestParam Long idGuest,
            @RequestParam Long idStatus,
            @RequestParam Long idSale,
            @RequestParam Map<String, String> dishes) {
        Set<Dish> collect = dishes.keySet().stream()
                .filter(x -> dishes.get(x).equals("on"))
                .map(x -> (dishRepo.findById(Long.parseLong(x))).get())
                .collect((Collectors.toSet()));
        float price = 0;
        Sale sale = saleRepo.findById(idSale).get();
        for (Dish d : collect) {
            price += d.getPrice();
        }
        if (sale.getPercentOfSale()*0.01*price > sale.getMaxSumOfSale() ) {
            price -= sale.getMaxSumOfSale();
        } else {
            price -= sale.getPercentOfSale()*0.01*price;
        }
        Guest guest = guestRepo.findById(idGuest).get();
        guest.increaseAmountOfOrders();
        LocalDate date = LocalDate.now();
        LocalTime time = LocalTime.now();
        Orders order = new Orders(date, time, price, guest,
                waiterRepo.findById(idWaiter).get(), statusRepo.findById(idStatus).get(), user);
        order.setDishes(collect);
        order.setSale(saleRepo.findById(idSale).get());

        ordersRepo.save(order);
        return "redirect:/orders";
    }

    @PostMapping("/orders/delete")
    public String delete(@RequestParam Long id){
        ordersRepo.deleteById(id);
        return "redirect:/orders";
    }

    @GetMapping("orders/edit/{id}")
    public String getEditPage(@PathVariable Long id, Model model) {
        Orders orders = ordersRepo.findById(id).get();
        model.addAttribute("guests", guestRepo.findAll())
                .addAttribute("sales", saleRepo.findAll())
                .addAttribute("statuses", statusRepo.findAll())
                .addAttribute("waiters", waiterRepo.findAll())
                .addAttribute("orders", orders)
                .addAttribute("categories", groupsRepo.findAll());
        return "ordersEdit";
    }

    @PostMapping("orders/edit")
    public String ordersEdit(
            @RequestParam Long idWaiter,
            @RequestParam Long idGuest,
            @RequestParam Long idStatus,
            @RequestParam Long idSale,
            @RequestParam Map<String, String> dishes,
            @RequestParam("id") Long id) {
        Orders orders = ordersRepo.findById(id).get();
        orders.setWaiter(waiterRepo.findById(idWaiter).get());
        orders.setGuest(guestRepo.findById(idGuest).get());
        orders.setStatus(statusRepo.findById(idStatus).get());
        orders.setSale(saleRepo.findById(idSale).get());
        Set<Dish> collect = dishes.keySet().stream()
                .filter(x -> dishes.get(x).equals("on"))
                .map(x -> (dishRepo.findById(Long.parseLong(x))).get())
                .collect((Collectors.toSet()));
        orders.setDishes(collect);
        float price = 0;
        for (Dish d : collect) {
            price += d.getPrice();
        }
        orders.setPrice(price);
        ordersRepo.save(orders);
        return "redirect:/orders";
    }
}
