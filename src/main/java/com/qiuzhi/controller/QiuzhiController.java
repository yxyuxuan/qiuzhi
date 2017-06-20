package com.qiuzhi.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.Job;
import com.qiuzhi.entity.NewEntity;
import com.qiuzhi.service.JobService;
import com.qiuzhi.service.NewService;
import com.qiuzhi.util.HelperUtil;

@Controller
@RequestMapping(value="/qiuzhi")
public class QiuzhiController {
	
	@Autowired
	private JobService jobService ;

	@Autowired
	private NewService newService;

	@RequestMapping(value="/index")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView();
		
		//查询所有的工作
		 ArrayList<Job> jobList = jobService.queryAllJobs();
		 if(jobList!=null){
			 modelAndView.addObject("jobList", jobList);
		 }

		// 获取新闻
		ArrayList<NewEntity> newsList =newService.queryAllNews();
		if(newsList!=null){
			modelAndView.addObject("newsList",newsList);
		}
		modelAndView.setViewName("home");
		
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
	
	/**
	 * 判断是否登录
	 * @return [description]
	 */
	@RequestMapping(value="/hasLogin")
	@ResponseBody
	public BaseResult hasLogin(){
		BaseResult result = new BaseResult();
		String id = HelperUtil.getValueByKey("id");
		if(id==null || id.isEmpty()){
			result.setMessage("您还没有登录，请登录您的账号！");
			result.setStatus(-1);
			return result;
		}
		result.setMessage("OK");
		result.setStatus(1);
		return result;
	}

}
