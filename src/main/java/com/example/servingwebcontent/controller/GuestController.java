package com.example.servingwebcontent.controller;

import com.example.servingwebcontent.domain.Guest;
import com.example.servingwebcontent.domain.User;
import com.example.servingwebcontent.repos.GuestRepo;
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
public class GuestController {
    @Autowired
    private GuestRepo guestRepo;

    @GetMapping("/guests")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Guest> guests;

        if (filter != null && !filter.isEmpty()) {
            guests = guestRepo.findByPhoneNumber(filter);
        } else {
            guests = guestRepo.findAll();
        }
        if (StreamSupport.stream(guests.spliterator(), false).count() == 0) {
            model.addAttribute("emptyMessage", true);
        }

        model.addAttribute("guests", guests)
                .addAttribute("filter", filter);

        return "guests";
    }


    @PostMapping("/guests")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String fullName,
            @RequestParam String phoneNumber,
            Model model) {
        if (guestRepo.findByPhoneNumber(phoneNumber) != null) {
            Guest tempGuest = new Guest(fullName, phoneNumber, user);
            model.addAttribute("tempGuest", tempGuest)
                    .addAttribute("message", true)
                    .addAttribute("guests", guestRepo.findAll());
            return "guests";
        } else {
            guestRepo.save(new Guest(fullName, phoneNumber, user));
            return "redirect:/guests";
        }
    }

    @PostMapping("/guests/delete")
    public String delete(@RequestParam Long id){
        guestRepo.deleteById(id);
        return "redirect:/guests";
    }

    @GetMapping("guests/edit/{id}")
    public String getEditPage(@PathVariable Long id, Model model) {
        Guest guests = guestRepo.findById(id).get();
        model.addAttribute("guests", guests);
        return "guestsEdit";
    }

    @PostMapping("guests/edit")
    public String groupEdit(
            @RequestParam String fullName,
            @RequestParam String phoneNumber,
            @RequestParam("id") Long id,
            Model model) {
        Guest guests = guestRepo.findById(id).get();
        if (guestRepo.findByPhoneNumber(phoneNumber) != null && !guestRepo.findByPhoneNumber(phoneNumber).get(0).getId().equals(id)) {
            model.addAttribute("guests", guests)
                    .addAttribute("message", true);
            return "guestsEdit";
        } else {
            guests.setFullName(fullName);
            guests.setPhoneNumber(phoneNumber);
            guestRepo.save(guests);
            return "redirect:/guests";
        }
    }
}
