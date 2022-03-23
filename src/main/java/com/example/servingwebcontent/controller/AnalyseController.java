package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.repos.AnalyseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.LocalTime;

@Controller
public class AnalyseController {
    @Autowired
    private AnalyseRepository analyseRepo;

    @GetMapping("/analyse")
    public String getAnalysePage(Model model) {
        model.addAttribute("rows", analyseRepo.amountOfDishes());
        model.addAttribute("forWaitersStatistics", analyseRepo.workWaiters());
        model.addAttribute("forGuestStatistics", analyseRepo.ordersGuests());
        model.addAttribute("time1", "10:00:00");
        model.addAttribute("time2", "10:00:00");
        return "analyse";
    }
    @GetMapping("/analyse/between")
    public String getAnalyseBetweenPrice(@RequestParam String price1, @RequestParam String price2, Model model) {
        model.addAttribute("price1", price1);
        model.addAttribute("price2", price2);
        model.addAttribute("time1", "10:00:00");
        model.addAttribute("time2", "10:00:00");
        model.addAttribute("rows", analyseRepo.amountOfDishes());
        model.addAttribute("forWaitersStatistics", analyseRepo.workWaiters());
        model.addAttribute("forGuestStatistics", analyseRepo.ordersGuests());
        model.addAttribute("dishesBetween", analyseRepo.betweenPrice(Float.parseFloat(price1), Float.parseFloat(price2)));
        return "analyse";
    }
    @GetMapping("/analyse/time")
    public String getAnalyseTimePage(@RequestParam String time1, @RequestParam String time2, Model model) {
        model.addAttribute("time1", time1);
        model.addAttribute("time2", time2);
        model.addAttribute("rows", analyseRepo.amountOfDishes());
        model.addAttribute("forWaitersStatistics", analyseRepo.workWaiters());
        model.addAttribute("forGuestStatistics", analyseRepo.ordersGuests());
        model.addAttribute("dishes", analyseRepo.countDishes(LocalTime.parse(time1), LocalTime.parse(time2)));
        return "analyse";
    }


}
