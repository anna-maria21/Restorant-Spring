package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.domain.Groups;
import com.example.servingwebcontent.repos.AnalyseRepository;
import com.example.servingwebcontent.repos.GroupsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MenuController {
    @Autowired
    private AnalyseRepository analyseRepository;

    @Autowired
    private GroupsRepo groupsRepo;

    @GetMapping("/menu")
    public String getMenu(Model model) {
        model.addAttribute("menu", analyseRepository.generateMenu());
        model.addAttribute("categories", groupsRepo.findAll());
        model.addAttribute("nameCategory", new Groups());
        return "menuView";
    }
    @GetMapping("/menu/category")
    public String getMenuCategory(@RequestParam Long idGroup, Model model) {
        model.addAttribute("menu", analyseRepository.generateMenuCategory(groupsRepo.findById(idGroup).get()));
        model.addAttribute("categories", groupsRepo.findAll());
        model.addAttribute("nameCategory", groupsRepo.findById(idGroup).get());
        return "menuView";
    }
}
