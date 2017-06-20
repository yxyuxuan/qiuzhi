package com.qiuzhi.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.Job;
import com.qiuzhi.entity.TBaseResult;
import com.qiuzhi.service.CollectionService;
import com.qiuzhi.service.JobService;
import com.qiuzhi.util.HelperUtil;

@Controller
@RequestMapping(value="/job")
public class JobController {
	@Autowired
	private JobService jobService;
	@Autowired
	private CollectionService collectionService;

	/**
	 * 添加工作
	 * @param  job [description]
	 * @return     [description]
	 */
	@RequestMapping(value="/add")
	@ResponseBody
	public BaseResult addJob(Job job){
		BaseResult result = new BaseResult();
		int companyid = Integer.valueOf(HelperUtil.getValueByKey("id"));
		job.setCompanyname(HelperUtil.getValueByKey("name"));
		job.setCompanyid(companyid);
		job.setCreatetime(new Date());
		job.setIsenable(1);
		job.setLastupdatetime(new Date());
		result = jobService.addJob(job);
		return result;
	}

	/**
	 * 根据职位的 id 查询职位详情
	 * @param  id [description]
	 * @return    [description]
	 */
	@RequestMapping(value="/detail")
	public ModelAndView detail(int id,String from){
		ModelAndView modelAndView = new ModelAndView();
		Job job = jobService.query(id);
		if(job==null){
			modelAndView.setViewName("nojob");
			return modelAndView;
		}
		// 返回 工作详情 视图
		String name = HelperUtil.getValueByKey("name");
		if(name!=null){
			modelAndView.addObject("name",name);
		}
		String applicantId = HelperUtil.getValueByKey("id");
		if (applicantId!=null) {
			boolean flag = collectionService.hasCollected(Integer.valueOf(applicantId),id );
			modelAndView.addObject("flag",flag);			
		}else{
			modelAndView.addObject("flag",false);			

		}
		modelAndView.addObject("job",job);
		modelAndView.addObject("from",from);	
		modelAndView.setViewName("job/detail");
		return modelAndView;
	}

	/**
	 * 关闭职位
	 * @param  isenable [description]
	 * @param  id       [description]
	 * @return          [description]
	 */
	@RequestMapping(value="/operate")
	@ResponseBody
	public BaseResult operate(int isenable ,int id ){
		BaseResult result = new BaseResult();
		result = jobService.updateStatus(isenable, id);
		return result;
	}

	@RequestMapping(value="/search")
	public ModelAndView search(String name,String from){
		ModelAndView modelAndView = new ModelAndView();
		ArrayList<Job> jobList = jobService.searchJobsByName(name);
		if(jobList!=null){
			modelAndView.addObject("jobList",jobList);
		}
		modelAndView.addObject("from",from);
		modelAndView.setViewName("job/searchResult");
		return modelAndView;
	}
	
	@RequestMapping(value="/searchJobsByCategory")
	@ResponseBody
	public TBaseResult<ArrayList<Job>> searchJobsByCategory(String category){
		TBaseResult<ArrayList<Job>> result = new TBaseResult<ArrayList<Job>>();
		ArrayList<Job> jobList = jobService.searchJobsByCategory(category);
		if(jobList!=null && jobList.size()!=0){
			result.setData(jobList);
			result.setStatus(1);
			return result;
		}
		result.setStatus(-1);
		return result;
	}
}
