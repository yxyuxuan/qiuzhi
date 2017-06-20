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
import com.qiuzhi.entity.Resume;
import com.qiuzhi.entity.TBaseResult;
import com.qiuzhi.service.ResumeService;
import com.qiuzhi.util.HelperUtil;

@Controller
@RequestMapping(value="/resume")
public class ResumeController {
	@Autowired
	private ResumeService resumeService;
	
	@ResponseBody
	@RequestMapping(value="/edit")
	public BaseResult edit(Resume resume){
		BaseResult result = new BaseResult();
		Resume queryResume = resumeService.queryDetail();
		resume.setLastupdatetime(new Date());
		if(queryResume== null){
			result= resumeService.addResume(resume);
		}else {
			System.out.println(resume.toString());
			resume.setId(queryResume.getId());
			result = resumeService.updateApplicantDetail(resume);
		}
		return result;
	}
	
	/**
	 * 根据简历的 id 获取简历详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView detail(Integer id,String from){
		ModelAndView modelAndView = new ModelAndView();
		Resume resume = resumeService.queryDetailByResumeId(id);
		if(resume!=null){
			modelAndView.addObject("resume", resume);
		}
		String name = HelperUtil.getValueByKey("name");
		if(name!=null){
			modelAndView.addObject("name",name);
		}
		modelAndView.addObject("from",from);
		modelAndView.setViewName("resume/detail");
		return modelAndView;
	}
	
	@RequestMapping(value="/search")
	public ModelAndView search(String name,String from){
		ModelAndView modelAndView = new ModelAndView();
		ArrayList<Resume> resumeList = resumeService.searchResumesByName(name);
		if(resumeList!=null){
			modelAndView.addObject("resumeList",resumeList);
		}
		String companyName = HelperUtil.getValueByKey("name");
		if (companyName!=null && !companyName.isEmpty()) {
			modelAndView.addObject("companyName",companyName);
		}
		modelAndView.addObject("from",from);
		modelAndView.setViewName("resume/searchResult");
		return modelAndView;
	}
	
	@RequestMapping(value="/searchResumesByCategory")
	@ResponseBody
	public TBaseResult<ArrayList<Resume>> searchJobsByCategory(String category){
		TBaseResult<ArrayList<Resume>> result = new TBaseResult<ArrayList<Resume>>();
		ArrayList<Resume> resumeList = resumeService.searchJobsByCategory(category);
		if(resumeList!=null && resumeList.size()!=0){
			result.setData(resumeList);
			result.setStatus(1);
			return result;
		}
		result.setStatus(-1);
		return result;
	}

}
