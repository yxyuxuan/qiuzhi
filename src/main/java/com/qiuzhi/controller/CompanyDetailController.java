package com.qiuzhi.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CompanyDetail;
import com.qiuzhi.entity.Job;
import com.qiuzhi.entity.NewEntity;
import com.qiuzhi.entity.Resume;
import com.qiuzhi.entity.SendRecord;
import com.qiuzhi.service.CompanyDetailService;
import com.qiuzhi.service.JobService;
import com.qiuzhi.service.NewService;
import com.qiuzhi.service.ResumeService;
import com.qiuzhi.service.SendRecordService;
import com.qiuzhi.util.HelperUtil;

@Controller
@RequestMapping(value="/companydetail")
public class CompanyDetailController {
	@Autowired
	private CompanyDetailService companyDetailService;
	
	@Autowired
	private JobService jobService;

	@Autowired
	private NewService newService;
	
	@Autowired
	private SendRecordService sendRecordService;
	
	@Autowired
	private ResumeService resumeService;
	
	
	/**
	 * 公司主页
	 * @return
	 */
	@RequestMapping(value="/home")
	public ModelAndView home(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CompanyDetail companyDetail = companyDetailService.queryDetail(id);
		if(companyDetail!=null){
			modelAndView.addObject("companyDetail", companyDetail);
			HelperUtil.setKeyAndValue("name", companyDetail.getName());
		}
		
		ArrayList<Resume> resumeList = resumeService.queryAllResumes();
		System.out.println(resumeList.size());
		if(resumeList!=null){
			modelAndView.addObject("resumeList",resumeList);
		}

		// 获取新闻
		ArrayList<NewEntity> newsList =newService.queryAllNews();
		if(newsList!=null){
			modelAndView.addObject("newsList",newsList);
		}

		modelAndView.setViewName("company/home");
		return modelAndView;
	}
	
	/**
	 * 信息中心
	 * @return
	 */
	@RequestMapping(value="/center")
	public ModelAndView center(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CompanyDetail companyDetail = companyDetailService.queryDetail(id);
		if(companyDetail!=null){
			modelAndView.addObject("companyDetail", companyDetail);
		}
		
		// 获得企业发布的工作
		ArrayList<Job> jobList = jobService.queryJobs();
		if(jobList!=null){
			modelAndView.addObject("jobList", jobList);
		}
		
		// 获得投递记录
		ArrayList<SendRecord>  receiveRecords = sendRecordService.receivedRecords();
		if(receiveRecords!=null){
			modelAndView.addObject("receiveRecords", receiveRecords);
		}
		modelAndView.setViewName("company/center");
		return modelAndView;
	}
	
	/**
	 * 编辑企业信息
	 * @param editCompanyDetail
	 * @return
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public BaseResult editDetail(CompanyDetail editCompanyDetail){
		System.out.println(editCompanyDetail.toString());
		BaseResult result = new BaseResult();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CompanyDetail companyDetail =  companyDetailService.queryDetail(id);
		if(companyDetail==null){
			result = companyDetailService.addDetail(editCompanyDetail);
			// 公司名称存入 session
			HelperUtil.setKeyAndValue("name", editCompanyDetail.getName());
			return result;
		}
		result = companyDetailService.updateCompanyDetail(editCompanyDetail);
		// 公司名称存入 session
		HelperUtil.setKeyAndValue("name", editCompanyDetail.getName());

		return result;
	}
	
	/**
	 * 查询企业信息
	 * @param
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView queryDetail(int id,String from){
		ModelAndView modelAndView = new ModelAndView();
		CompanyDetail detail =  companyDetailService.queryDetail(id);
		if(detail!=null){
			modelAndView.addObject("detail",detail);
		}
		modelAndView.addObject("from",from);
		modelAndView.setViewName("company/detail");
		return modelAndView;
	}


	/**
	 * 修改密码
	 * @return [description]
	 */
	@RequestMapping(value="/goModifyPassword")
	public ModelAndView goModifyPassword(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CompanyDetail companyDetail = companyDetailService.queryDetail(id);
		if(companyDetail!=null){
			modelAndView.addObject("companyDetail", companyDetail);
		}
		modelAndView.setViewName("company/modifyPassword");
		return modelAndView;
	}

	/**
	 * 修改资料
	 * @return [description]
	 */
	@RequestMapping(value="/goModifyInformation")
	public ModelAndView goModifyInformation(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CompanyDetail companyDetail = companyDetailService.queryDetail(id);
		if(companyDetail!=null){
			modelAndView.addObject("companyDetail", companyDetail);
		}
		modelAndView.setViewName("company/modifyInformation");
		return modelAndView;
	}

	/**
	 * 招聘信息列表
	 * @return [description]
	 */
	@RequestMapping(value="/goZhaoPinList")
	public ModelAndView goZhaoPinList(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CompanyDetail companyDetail = companyDetailService.queryDetail(id);
		if(companyDetail!=null){
			modelAndView.addObject("companyDetail", companyDetail);
		}
		// 获得企业发布的工作
		ArrayList<Job> jobList = jobService.queryJobs();
		if(jobList!=null){
			modelAndView.addObject("jobList", jobList);
		}
		modelAndView.setViewName("company/zhaoPinList");
		return modelAndView;
	}

	/**
	 * 发布招聘信息
	 * @return [description]
	 */
	@RequestMapping(value="/goPublishWork")
	public ModelAndView goPublishWork(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CompanyDetail companyDetail = companyDetailService.queryDetail(id);
		if(companyDetail!=null){
			modelAndView.addObject("companyDetail", companyDetail);
		}
		modelAndView.setViewName("company/publishWork");
		return modelAndView;
	}

	/**
	 * 应聘信息列表
	 * @return [description]
	 */
	@RequestMapping(value="/goYinPinList")
	public ModelAndView goYinPinList(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CompanyDetail companyDetail = companyDetailService.queryDetail(id);
		if(companyDetail!=null){
			modelAndView.addObject("companyDetail", companyDetail);
		}
		// 获得投递记录
		ArrayList<SendRecord>  receiveRecords = sendRecordService.receivedRecords();
		if(receiveRecords!=null){
			modelAndView.addObject("receiveRecords", receiveRecords);
		}
		modelAndView.setViewName("company/yingPinList");
		return modelAndView;
	}


}
