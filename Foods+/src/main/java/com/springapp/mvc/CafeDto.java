package com.springapp.mvc;


public class CafeDto {

    private String name;

    private String description;

    private int middleCost;

    private String address;

    private String contacts;

    private String type;

    public CafeDto(){}

    public CafeDto(String name, String description, int middleCost, String address, String contacts, String type) {
        this.name = name;
        this.description = description;
        this.middleCost = middleCost;
        this.address = address;
        this.contacts = contacts;
        this.type = type;
    }

    public CafeDto(Cafe cafe) {
        this.name = cafe.getName();
        this.description = cafe.getDescription();
        this.middleCost = cafe.getMiddleCost();
        this.address = cafe.getAddress();
        this.contacts = cafe.getContacts();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMiddleCost() {
        return middleCost;
    }

    public void setMiddleCost(int middleCost) {
        this.middleCost = middleCost;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
