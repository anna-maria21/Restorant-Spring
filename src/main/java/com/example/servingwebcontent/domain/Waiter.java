package com.example.servingwebcontent.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Waiter {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_waiter;

    private String fullNameWaiter;
    private String phoneNumber;
    private Integer experience;
    private float salary;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ElementCollection(targetClass = Orders.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "waiter_order", joinColumns = @JoinColumn(name = "id_waiter"))
    @Enumerated(EnumType.STRING)
    private Set<Orders> orders;

    public Waiter() {}
    public Waiter(String fullNameWaiter, String phoneNumber, String experience, String salary, User user) {
        this.author = user;
        this.fullNameWaiter = fullNameWaiter;
        this.phoneNumber = phoneNumber;
        this.experience = Integer.parseInt(experience);
        this.salary = Float.parseFloat(salary);
    }
    public String getAuthorName() {
        return author != null ? author.getUsername() : "<none>";
    }

    public Long getId_waiter() {
        return id_waiter;
    }

    public void setId_waiter(Long id_waiter) {
        this.id_waiter = id_waiter;
    }

    public String getFullNameWaiter() {
        return fullNameWaiter;
    }

    public void setFullNameWaiter(String fullNameWaiter) {
        this.fullNameWaiter = fullNameWaiter;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = Integer.parseInt(experience);
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = Float.parseFloat(salary);
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Set<Orders> getOrders() {
        return orders;
    }

    public void setOrders(Set<Orders> orders) {
        this.orders = orders;
    }
}
