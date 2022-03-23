package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.domain.Statuses;
import com.example.servingwebcontent.domain.User;
import com.example.servingwebcontent.repos.StatusRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StatusesController {
    @Autowired
    private StatusRepo statusRepo;

    @GetMapping("/statuses")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Statuses> statuses = statusRepo.findAll();
        model.addAttribute("statuses", statuses);
        return "statuses";
    }

    @PostMapping("/statuses")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String reason) {
        statusRepo.save(new Statuses(name, reason, user));
        return "redirect:/statuses";
    }

    @PostMapping("/statuses/delete")
    public String delete(@RequestParam Long id){
        statusRepo.deleteById(id);
        return "redirect:/statuses";
    }

    @GetMapping("statuses/edit/{id}")
    public String getEditPage(@PathVariable Long id, Model model) {
        Statuses statuses = statusRepo.findById(id).get();
        model.addAttribute("statuses", statuses);
        return "statusEdit";
    }
    @PostMapping("statuses/edit")
    public String statusEdit(
            @RequestParam String name,
            @RequestParam String reason,
            @RequestParam("id") Long id) {
        Statuses statuses = statusRepo.findById(id).get();
        statuses.setName(name);
        statuses.setReason(reason);
        statusRepo.save(statuses);
        return "redirect:/statuses";
    }

}
