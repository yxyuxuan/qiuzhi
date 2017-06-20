package com.qiuzhi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CompanyAccount;
import com.qiuzhi.service.CompanyAccountService;

@Controller
@RequestMapping(value="/companyaccount")
public class CompanyAccountController {
	@Autowired
	private CompanyAccountService companyAccountService;
	
	/**
	 * 登录
	 * @param loginAccount
	 * @return
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public BaseResult login(CompanyAccount loginAccount){
		BaseResult result = new BaseResult();
		result = companyAccountService.login(loginAccount);
		return result;
	}
	
	/**
	 * 注册
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/register")
	public BaseResult register(CompanyAccount newCompanyAccount){
		System.out.println(newCompanyAccount.toString());
		BaseResult result = new BaseResult();
		result = companyAccountService.register(newCompanyAccount);
		return result;
	}
	
	/**
	 * 修改密码
	 * @param newPassword
	 * @param oldPassword
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/changepwd")
	public BaseResult changePassword(String newPassword ,String oldPassword){
		System.out.println(oldPassword+"  "+newPassword);
		BaseResult result = new BaseResult();
		result = companyAccountService.changePassword(oldPassword, newPassword);	
		return result;
	}
	

}

