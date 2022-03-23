package com.example.servingwebcontent.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "dish")
public class Dish {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private float price;
    private int weight;
    private int timeForCooking;

    @ManyToOne
    @JoinColumn(name = "id_group")
    private Groups group;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ManyToMany(mappedBy = "dishes")
    private Set<Orders> orders;

    public Dish() {}

    public Dish(String name, String price, String weight, String timeForCooking, Groups group, User user) {
        this.name = name;
        this.price = Float.parseFloat(price);
        this.weight = Integer.parseInt(weight);
        this.timeForCooking = Integer.parseInt(timeForCooking);
        this.group = group;
        this.author = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = Float.parseFloat(price);
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = Integer.parseInt(weight);
    }

    public int getTimeForCooking() {
        return timeForCooking;
    }

    public void setTimeForCooking(String timeForCooking) {
        this.timeForCooking = Integer.parseInt(timeForCooking);
    }

    public Groups getGroup() {
        return group;
    }

    public void setGroup(Groups group) {
        this.group = group;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}
