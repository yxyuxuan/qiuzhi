package com.qiuzhi.entity;

import org.springframework.stereotype.Component;

@Component
public class CountEntity {
    private Integer id;

    private Integer number;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNumber(){
        return number;
    }

    public void setNumber(Integer number){
        this.number = number;
    }
}