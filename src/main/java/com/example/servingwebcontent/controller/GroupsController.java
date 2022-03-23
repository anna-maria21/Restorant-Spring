package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.domain.Groups;
import com.example.servingwebcontent.domain.User;
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
public class GroupsController {
    @Autowired
    private GroupsRepo groupsRepo;

    @GetMapping("/groups")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Groups> sales = groupsRepo.findAll();
        model.addAttribute("groups", sales);
        return "groups";
    }

    @PostMapping("/groups")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name) {
        groupsRepo.save(new Groups(name, user));
        return "redirect:/groups";
    }

    @PostMapping("/groups/delete")
    public String delete(@RequestParam Long id){
        groupsRepo.deleteById(id);
        return "redirect:/groups";
    }

    @GetMapping("groups/edit/{id}")
    public String getEditPage(@PathVariable Long id, Model model) {
        Groups groups = groupsRepo.findById(id).get();
        model.addAttribute("groups", groups);
        return "groupsEdit";
    }
    @PostMapping("groups/edit")
    public String groupEdit(
            @RequestParam String name,
            @RequestParam("id") Long id) {
        Groups groups = groupsRepo.findById(id).get();
        groups.setName(name);
        groupsRepo.save(groups);
        return "redirect:/groups";
    }
}
