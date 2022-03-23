package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.domain.Dish;
import com.example.servingwebcontent.domain.User;
import com.example.servingwebcontent.repos.DishRepo;
import com.example.servingwebcontent.repos.GroupsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DishController {
    @Autowired
    private DishRepo dishRepo;

    @Autowired
    private GroupsRepo groupsRepo;

    @GetMapping("/dishes")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Dish> dishes;
        if (filter != null && !filter.isEmpty()) {
            dishes = dishRepo.findByName(filter);
        } else {
            dishes = dishRepo.findAll();
        }

        model.addAttribute("dishes", dishes)
                .addAttribute("filter", filter)
                .addAttribute("categories", groupsRepo.findAll());

        return "dishes";
    }


    @PostMapping("/dishes")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String price,
            @RequestParam String weight,
            @RequestParam String timeForCooking,
            @RequestParam Long idGroup) {
        dishRepo.save(new Dish(name, price, weight, timeForCooking, groupsRepo.findById(idGroup).get(), user));
        return "redirect:/dishes";
    }

    @PostMapping("/dishes/delete")
    public String delete(@RequestParam Long id){
        dishRepo.deleteById(id);
        return "redirect:/dishes";
    }

    @GetMapping("dishes/edit/{id}")
    public String getEditPage(@PathVariable Long id, Model model) {
        Dish dishes = dishRepo.findById(id).get();
        model.addAttribute("categories", groupsRepo.findAll())
                .addAttribute("dishes", dishes);
        return "dishesEdit";
    }

    @PostMapping("dishes/edit")
    public String groupEdit(
            @RequestParam String name,
            @RequestParam String price,
            @RequestParam String weight,
            @RequestParam String timeForCooking,
            @RequestParam Long idGroup,
            @RequestParam("id") Long id) {
        Dish dishes = dishRepo.findById(id).get();
        dishes.setName(name);
        dishes.setPrice(price);
        dishes.setWeight(weight);
        dishes.setTimeForCooking(timeForCooking);
        dishes.setGroup(groupsRepo.findById(idGroup).get());
        dishRepo.save(dishes);
        return "redirect:/dishes";
    }
}
