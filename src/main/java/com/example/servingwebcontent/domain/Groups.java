package com.example.servingwebcontent.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "categories")
public class Groups {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @OneToMany(mappedBy = "group")
    @ElementCollection(targetClass = Dish.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "group_dish", joinColumns = @JoinColumn(name = "id_group"))
    @Enumerated(EnumType.STRING)
    private Set<Dish> dishes;

    public Groups() {}

    public Groups(String name, User user) {
        this.name = name;
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

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Set<Dish> getDishes() {
        return dishes;
    }

    public void setDishes(Set<Dish> dishes) {
        this.dishes = dishes;
    }
}
