package com.example.servingwebcontent.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "sales")
public class Sale {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private int percentOfSale;
    private int maxSumOfSale;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @ElementCollection(targetClass = Orders.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "sales_order", joinColumns = @JoinColumn(name = "id_sale"))
    @Enumerated(EnumType.STRING)
    private Set<Orders> orders;

    public Sale() {}

    public Sale(String name, String maxSumOfSale, String percentOfSale, User user) {
        this.name = name;
        this.maxSumOfSale = Integer.parseInt(maxSumOfSale);
        this.percentOfSale = Integer.parseInt(percentOfSale);
        this.author = user;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public void setName(String name) {
        this.name = name;
    }

    public int getMaxSumOfSale() {
        return maxSumOfSale;
    }

    public void setMaxSumOfSale(String maxSumOfSale) {
        this.maxSumOfSale = Integer.parseInt(maxSumOfSale);
    }

    public int getPercentOfSale() {
        return percentOfSale;
    }

    public void setPercentOfSale(String percentOfSale) {
        this.percentOfSale = Integer.parseInt(percentOfSale);
    }

    public String getName() {
        return name;
    }

    public Set<Orders> getOrders() {
        return orders;
    }

    public void setOrders(Set<Orders> orders) {
        this.orders = orders;
    }
}
