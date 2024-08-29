package com.abc.model;

public class Staff {
    private int id;
    private String name;
    private String email;
    private String role;
    private String username;
    private String password;

    // Constructor with all fields
    public Staff(int id, String name, String email, String role, String username, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
        this.username = username;
        this.password = password;
    }

    // Constructor without ID (used when adding new staff)
    public Staff(String name, String email, String role, String username, String password) {
        this.name = name;
        this.email = email;
        this.role = role;
        this.username = username;
        this.password = password;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
