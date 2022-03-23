package com.example.servingwebcontent.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "guest")
public class Guest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fullName;
    private int numberOfOrders = 0;
    private String phoneNumber;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ElementCollection(targetClass = Orders.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "guest_order", joinColumns = @JoinColumn(name = "id_guest"))
    @Enumerated(EnumType.STRING)
    private Set<Orders> orders;

    public Guest() {}

    public Guest(String fullName, String phoneNumber, User user) {
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.author = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getNumberOfOrders() {
        return numberOfOrders;
    }

    public void setNumberOfOrders(String numberOfOrders) {
        this.numberOfOrders = Integer.parseInt(numberOfOrders);
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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
    public void increaseAmountOfOrders() {
        this.numberOfOrders++;
    }
}
