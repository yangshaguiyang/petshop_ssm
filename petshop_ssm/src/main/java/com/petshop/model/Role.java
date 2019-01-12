package com.petshop.model;

public class Role {
    private Integer id;

    private String name;

    private String resouceid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getResouceid() {
        return resouceid;
    }

    public void setResouceid(String resouceid) {
        this.resouceid = resouceid == null ? null : resouceid.trim();
    }
}