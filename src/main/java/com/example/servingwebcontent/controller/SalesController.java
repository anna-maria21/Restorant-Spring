package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.domain.Sale;
import com.example.servingwebcontent.domain.User;
import com.example.servingwebcontent.repos.SaleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SalesController {

    @Autowired
    private SaleRepo saleRepo;

    @GetMapping("/sales")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Sale> sales = saleRepo.findAll();
        model.addAttribute("sales", sales);
        return "sales";
    }

    @PostMapping("/sales")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String percentOfSale,
            @RequestParam String maxSumOfSale) {
        saleRepo.save(new Sale(name, maxSumOfSale, percentOfSale, user));
        return "redirect:/sales";
    }

    @PostMapping("/sales/delete")
    public String delete(@RequestParam Long id){
        saleRepo.deleteById(id);
        return "redirect:/sales";
    }

    @GetMapping("sales/edit/{id}")
    public String getEditPage(@PathVariable Long id, Model model) {
        Sale sale = saleRepo.findById(id).get();
        model.addAttribute("sale", sale);
        return "editSale";
    }
    @PostMapping("sales/edit")
    public String saleEdit(
            @RequestParam String name,
            @RequestParam String percentOfSale,
            @RequestParam String maxSumOfSale,
            @RequestParam("id") Long id) {
        Sale sale = saleRepo.findById(id).get();
        sale.setName(name);
        sale.setMaxSumOfSale(maxSumOfSale);
        sale.setPercentOfSale(percentOfSale);
        saleRepo.save(sale);
        return "redirect:/sales";
    }

}
