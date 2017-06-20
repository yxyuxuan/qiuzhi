package com.qiuzhi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.qiuzhi.entity.ApplicantAccount;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.service.ApplicantAccountService;

@Controller
@RequestMapping(value="/applicantaccount")
public class ApplicantAccountController {
	@Autowired
	private ApplicantAccountService applicantAccountService;
	
	/**
	 * 登录
	 * @param loginAccount
	 * @return
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public BaseResult login(ApplicantAccount loginAccount){
		BaseResult result = new BaseResult();
		result = applicantAccountService.login(loginAccount);
		System.out.println(result.toString());
		return result;
	}
	
	/**
	 * 注册
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/register")
	public BaseResult register(ApplicantAccount newApplicantAccount){
		BaseResult result = new BaseResult();
		result = applicantAccountService.register(newApplicantAccount);
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
		result = applicantAccountService.changePassword(oldPassword, newPassword);	
		return result;
	}
	
}
