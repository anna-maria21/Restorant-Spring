package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.domain.User;
import com.example.servingwebcontent.domain.Waiter;
import com.example.servingwebcontent.repos.WaiterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.stream.StreamSupport;

@Controller
public class WaiterController {

    @Autowired
    private WaiterRepo waiterRepo;

    @GetMapping("/")
    public String greeting() {
        return "home";
    }

    @GetMapping("/admin")
    public String adminPanel() {
        return "admin";
    }

    @GetMapping("/waiters")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Waiter> waiters;

        if (filter != null && !filter.isEmpty()) {
            waiters = waiterRepo.findByFullNameWaiter(filter);
        } else {
            waiters = waiterRepo.findAll();
        }
        if (StreamSupport.stream(waiters.spliterator(), false).count() == 0) {
            model.addAttribute("emptyMessage", true);
        }

        model.addAttribute("waiters", waiters)
                .addAttribute("filter", filter);

        return "waiters";
    }

    @PostMapping("/waiters")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String fullNameWaiter,
            @RequestParam String phoneNumber,
            @RequestParam String experience,
            @RequestParam String salary,
            Model model) {
        if (waiterRepo.findByPhoneNumber(phoneNumber) != null) {
            Waiter tempWaiter = new Waiter(fullNameWaiter, phoneNumber, experience, salary, user);
            model.addAttribute("tempWaiter", tempWaiter)
                    .addAttribute("message", true)
                    .addAttribute("waiters", waiterRepo.findAll());
            return "waiters";
        } else {
            waiterRepo.save(new Waiter(fullNameWaiter, phoneNumber, experience, salary, user));
            return "redirect:/waiters";
        }
    }

    @PostMapping("/waiters/delete")
    public String delete(@RequestParam Long id_waiter){
        waiterRepo.deleteById(id_waiter);
        return "redirect:/waiters";
    }

    @GetMapping("/waiters/edit/{id_waiter}")
    public String getEditPage(@PathVariable Long id_waiter, Model model) {
        Waiter waiter = waiterRepo.findById(id_waiter).get();
        model.addAttribute("waiter", waiter);
        return "editWaiter";
    }
    @PostMapping("/waiters/edit")
    public String waiterEdit(
            @RequestParam String fullNameWaiter,
            @RequestParam String phoneNumber,
            @RequestParam String experience,
            @RequestParam String salary,
            @RequestParam("id_waiter") Long id_waiter,
            Model model) {

        Waiter waiter = waiterRepo.findById(id_waiter).get();
        if (waiterRepo.findByPhoneNumber(phoneNumber) != null && !waiterRepo.findByPhoneNumber(phoneNumber).getId_waiter().equals(id_waiter)) {
            model.addAttribute("waiter", waiter)
                    .addAttribute("message", true);
            return "editWaiter";
        } else {
            waiter.setFullNameWaiter(fullNameWaiter);
            waiter.setPhoneNumber(phoneNumber);
            waiter.setExperience(experience);
            waiter.setSalary(salary);
            waiterRepo.save(waiter);
            return "redirect:/waiters";
        }
    }

}
