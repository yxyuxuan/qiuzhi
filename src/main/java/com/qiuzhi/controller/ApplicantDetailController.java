package com.qiuzhi.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.qiuzhi.entity.ApplicantDetail;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CollectionEntity;
import com.qiuzhi.entity.Job;
import com.qiuzhi.entity.NewEntity;
import com.qiuzhi.entity.Resume;
import com.qiuzhi.entity.SendRecord;
import com.qiuzhi.service.ApplicantDetailService;
import com.qiuzhi.service.CollectionService;
import com.qiuzhi.service.JobService;
import com.qiuzhi.service.NewService;
import com.qiuzhi.service.ResumeService;
import com.qiuzhi.service.SendRecordService;
import com.qiuzhi.util.HelperUtil;

@Controller
@RequestMapping(value="/applicantdetail")
public class ApplicantDetailController {
	@Autowired
	private ApplicantDetailService applicantDetailService;
	
	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private SendRecordService sendRecordService;
	
	@Autowired
	private NewService newService;
	
	@Autowired
	private CollectionService collectionService;

	/**
	 * 个人主页
	 * @return
	 */
	@RequestMapping(value="/home")
	public ModelAndView home(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ApplicantDetail applicantDetail = applicantDetailService.queryDetail(id);
		if(applicantDetail!=null){
			// 个人信息存在
			modelAndView.addObject("applicantDetail", applicantDetail);
			// 个人姓名存入 session
			HelperUtil.setKeyAndValue("name", applicantDetail.getName());
		}
		ArrayList<Job> jobList=  jobService.queryAllJobs();
		if(jobList!=null){
			modelAndView.addObject("jobList",jobList);
		}

		// 获取新闻
		ArrayList<NewEntity> newsList =newService.queryAllNews();
		if(newsList!=null){
			modelAndView.addObject("newsList",newsList);
		}

		modelAndView.setViewName("applicant/home");
		return modelAndView;
	}
	
	/**
	 * 个人中心
	 * @return
	 */
	@RequestMapping(value="/center")
	public ModelAndView center(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ApplicantDetail applicantDetail = applicantDetailService.queryDetail(id);
		// 获取个人信息
		if(applicantDetail!=null){
			modelAndView.addObject("applicantDetail", applicantDetail);
			System.out.println(applicantDetail.toString());
		}

		modelAndView.setViewName("applicant/center");
		return modelAndView;
	}
	/**
	 * 添加或修改 个人信息
	 * @param editApplicantDetail
	 * @return
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public BaseResult editDetail(ApplicantDetail editApplicantDetail){
		System.out.println(editApplicantDetail.toString());
		BaseResult result = new BaseResult();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ApplicantDetail applicantDetail =  applicantDetailService.queryDetail(id);
		if(applicantDetail==null){
			result = applicantDetailService.addDetail(editApplicantDetail);
			// 个人姓名存入 session
			HelperUtil.setKeyAndValue("name", editApplicantDetail.getName());
			return result;
		}
		result = applicantDetailService.updateApplicantDetail(editApplicantDetail);
		// 个人姓名存入 session
		HelperUtil.setKeyAndValue("name", editApplicantDetail.getName());
		return result;
	}
	
	@RequestMapping(value="/detail")
	@ResponseBody
	public ModelAndView detail(int id,String from){
		ModelAndView modelAndView = new ModelAndView();
		ApplicantDetail applicantDetail = applicantDetailService.queryDetail(id);
		if(applicantDetail!=null){
			modelAndView.addObject("applicantDetail",applicantDetail);
		}
		String companyName = HelperUtil.getValueByKey("name");
		if (companyName!=null && !companyName.isEmpty()) {
			modelAndView.addObject("companyName",companyName);
		}
		modelAndView.addObject("from",from);
		modelAndView.setViewName("applicant/detail");
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
		ApplicantDetail applicantDetail = applicantDetailService.queryDetail(id);
		// 获取个人信息
		if(applicantDetail!=null){
			modelAndView.addObject("applicantDetail", applicantDetail);
			System.out.println(applicantDetail.toString());
		}
		modelAndView.setViewName("applicant/modifyPassword");
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
		ApplicantDetail applicantDetail = applicantDetailService.queryDetail(id);
		// 获取个人信息
		if(applicantDetail!=null){
			modelAndView.addObject("applicantDetail", applicantDetail);
			System.out.println(applicantDetail.toString());
		}
		modelAndView.setViewName("applicant/modifyInformation");
		return modelAndView;
	}

	/**
	 * 简历
	 * @return [description]
	 */
	@RequestMapping(value="/goMyResume")
	public ModelAndView goMyResume(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ApplicantDetail applicantDetail = applicantDetailService.queryDetail(id);
		// 获取个人信息
		if(applicantDetail!=null){
			modelAndView.addObject("applicantDetail", applicantDetail);
			System.out.println(applicantDetail.toString());
		}

		// 获取简历信息
		Resume resume = resumeService.queryDetail();
		if(resume!=null){
			modelAndView.addObject("resume", resume);
		}

		modelAndView.setViewName("applicant/myResume");
		return modelAndView;
	}

	/**
	 * 投递记录
	 * @return [description]
	 */
	@RequestMapping(value="/goTouDiList")
	public ModelAndView goTouDiList(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ApplicantDetail applicantDetail = applicantDetailService.queryDetail(id);
		// 获取个人信息
		if(applicantDetail!=null){
			modelAndView.addObject("applicantDetail", applicantDetail);
			System.out.println(applicantDetail.toString());
		}

		// 获取投递记录
		ArrayList<SendRecord> sendRecordList=sendRecordService.querySendRecords();  
		if(sendRecordList!=null){
			modelAndView.addObject("sendRecordList",sendRecordList);
		}
		modelAndView.setViewName("applicant/touDiList");
		return modelAndView;
	}

	/**
	 * 我的收藏
	 * @return [description]
	 */
	@RequestMapping(value="/goMyCollection")
	public ModelAndView goMyCollection(){
		ModelAndView modelAndView = new ModelAndView();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ApplicantDetail applicantDetail = applicantDetailService.queryDetail(id);
		// 获取个人信息
		if(applicantDetail!=null){
			modelAndView.addObject("applicantDetail", applicantDetail);
			System.out.println(applicantDetail.toString());
		}
		ArrayList<CollectionEntity> collectionList = collectionService.queryCollectionsByApplicantId(id);
		if(collectionList!=null){
			modelAndView.addObject("collectionList",collectionList);
		}


		modelAndView.setViewName("applicant/myCollection");
		return modelAndView;
	}
}
