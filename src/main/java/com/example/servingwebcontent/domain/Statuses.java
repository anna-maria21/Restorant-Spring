package com.example.servingwebcontent.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "statuses")
public class Statuses {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String reason;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ElementCollection(targetClass = Orders.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "statuses_order", joinColumns = @JoinColumn(name = "id_status"))
    @Enumerated(EnumType.STRING)
    private Set<Orders> orders;

    public Statuses() {}
    public Statuses(String name, String reason, User user) {
        this.name = name;
        this.reason = reason;
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

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
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
