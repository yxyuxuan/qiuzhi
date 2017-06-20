package com.qiuzhi.entity;

import org.springframework.stereotype.Component;

@Component
public class AdminAccount {
    private Integer id;

    private String account;

    private String password;
    
    private String type;
    
    public AdminAccount(){
    	
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
    
    
}