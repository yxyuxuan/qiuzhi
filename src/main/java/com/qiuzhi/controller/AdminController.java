package com.qiuzhi.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.qiuzhi.entity.AdminAccount;
import com.qiuzhi.entity.ApplicationAccountAndDetailEntity;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CompanyAccountAndDetailEntity;
import com.qiuzhi.entity.Job;
import com.qiuzhi.entity.NewEntity;
import com.qiuzhi.service.AdminService;
import com.qiuzhi.service.JobService;
import com.qiuzhi.service.NewService;
import com.qiuzhi.util.HelperUtil;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;

	@Autowired
	private NewService newService;

	@Autowired
	private JobService jobService;

	@RequestMapping(value="login")
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/login");
		return modelAndView;
	}

	@RequestMapping(value="/confirmLogin")
	@ResponseBody
	public BaseResult confirmLogin(AdminAccount loginAccount){
		BaseResult result = new BaseResult();
		result = adminService.login(loginAccount);
		return result;
	}
	
	@RequestMapping(value="/home")
	public ModelAndView home(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		AdminAccount adminAccount = adminService.queryDetail(id);
		modelAndView.addObject("adminAccount",adminAccount);
		modelAndView.setViewName("admin/home");
		return modelAndView;
	}
	
	@RequestMapping(value="/exit")
	@ResponseBody
	public BaseResult exit(){
		BaseResult result = new BaseResult();
		// 清空 session
		HelperUtil.clearKeyAndValue();
		result.setMessage("退出成功！");
		result.setStatus(1);
		return result;
	}
	
	@RequestMapping(value="/goModifyPassword")
	public ModelAndView goModifyPassword(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		AdminAccount adminAccount = adminService.queryDetail(id);
		modelAndView.addObject("adminAccount",adminAccount);
		modelAndView.setViewName("admin/modifyPassword");
		return modelAndView;
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
		BaseResult result = new BaseResult();
		result = adminService.changePassword(oldPassword, newPassword);	
		return result;
	}
	
	@RequestMapping(value="/goAddAdmin")
	public ModelAndView goAddAdmin(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		AdminAccount adminAccount = adminService.queryDetail(id);
		modelAndView.addObject("adminAccount",adminAccount);
		ArrayList<AdminAccount> accountList = adminService.selectAccount();
		if(accountList!=null && accountList.size()!=0){
			modelAndView.addObject("accountList",accountList);	
		}
		modelAndView.setViewName("admin/addAdmin");
		return modelAndView;
	}
	/**
	 * 添加管理员账号
	 * @param adminAccount
	 * @return
	 */
	@RequestMapping(value="/addAdminAccount")
	@ResponseBody
	public BaseResult addAdminAccount(AdminAccount adminAccount){
		BaseResult result = new BaseResult();
		result = adminService.addAdminAccount(adminAccount);
		return result;
	}
	
	@RequestMapping(value="/deleteAdminAccount")
	@ResponseBody
	public BaseResult deleteAccount(int id){
		BaseResult result = new BaseResult();
		result = adminService.deleteAdminAccount(id);
		return result;
	}

	@RequestMapping(value="/goNewsManage")
	public ModelAndView goNewsManage(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		AdminAccount adminAccount = adminService.queryDetail(id);
		modelAndView.addObject("adminAccount",adminAccount);
		// 获取新闻
		ArrayList<NewEntity> newsList =newService.queryAllNews();
		if(newsList!=null){
			modelAndView.addObject("newsList",newsList);
		}
		modelAndView.setViewName("admin/newManage");
		return modelAndView;
	}
	
	@RequestMapping(value="/goApplicantUsersManage")
	public ModelAndView goApplicantUsersManage(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		AdminAccount adminAccount = adminService.queryDetail(id);
		modelAndView.addObject("adminAccount",adminAccount);
		ArrayList<ApplicationAccountAndDetailEntity> applicantAccountAndDetailList = adminService.selectAllApplicant();
		if(applicantAccountAndDetailList!=null && applicantAccountAndDetailList.size()!=0){
			modelAndView.addObject("applicantAccountAndDetailList", applicantAccountAndDetailList);
		}
		modelAndView.setViewName("admin/applicantUsersManage");
		return modelAndView;
	}
	
	@RequestMapping(value="/goCompanyUsersManage")
	public ModelAndView goCompanyUsersManage(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		AdminAccount adminAccount = adminService.queryDetail(id);
		modelAndView.addObject("adminAccount",adminAccount);
		ArrayList<CompanyAccountAndDetailEntity> companyAccountAndDetailList = adminService.selectAllCompany();
		if(companyAccountAndDetailList!=null && companyAccountAndDetailList.size()!=0){
			modelAndView.addObject("companyAccountAndDetailList", companyAccountAndDetailList);
		}
		modelAndView.setViewName("admin/companyUsersManage");
		return modelAndView;
	}
	
	@RequestMapping(value="/deleteApplicantAccount")
	@ResponseBody
	public BaseResult deleteApplicantAccount(int id){
		BaseResult result = new BaseResult();
		result = adminService.deleteApplicantAccount(id);
		return result;
	}
	
	@RequestMapping(value="/deleteCompanyAccount")
	@ResponseBody
	public BaseResult deleteCompanyAccount(int id){
		BaseResult result = new BaseResult();
		result = adminService.deleteCompanyAccount(id);
		return result;
	}
	@RequestMapping(value="/goJobManage")
	public ModelAndView goJobManage(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		AdminAccount adminAccount = adminService.queryDetail(id);
		modelAndView.addObject("adminAccount",adminAccount);
		ArrayList<Job> jobList = jobService.queryAllJobs();
		if(jobList!=null && jobList.size()!=0){
			modelAndView.addObject("jobList", jobList);
		}
		modelAndView.setViewName("admin/jobsManage");
		return modelAndView;
	}
	
	@RequestMapping(value="/deleteJobAndSendRecord")
	@ResponseBody
	public BaseResult deleteJobAndSendRecord(int id){
		BaseResult result = new BaseResult();
		result = adminService.deleteJobAndSendRecord(id);
		return result;
	}
	
}
