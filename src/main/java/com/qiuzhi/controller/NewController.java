package com.qiuzhi.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.NewEntity;
import com.qiuzhi.service.NewService;

@Controller
@RequestMapping(value="/new")
public class NewController{
	@Autowired
	private NewService newService;
	
	@RequestMapping(value="/add")
	@ResponseBody
	public BaseResult addNew(NewEntity record){
		BaseResult result = new BaseResult();
		record.setCreatetime(new Date());
		result = newService.addNew(record);
		return result;
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView detial(int id,String from){
		ModelAndView modelAndView = new ModelAndView();
		NewEntity detail = newService.detial(id);
		if(detail !=null){
			modelAndView.addObject("detail",detail);
		}
		
		modelAndView.addObject("from",from);
		modelAndView.setViewName("new/detail");
		return modelAndView;
	}
	
	@RequestMapping(value="/deleteNew")
	@ResponseBody
	public BaseResult deleteNew(int id ){
		BaseResult result = new BaseResult();
		result =  newService.deleteNew(id);
		return result;
	}
}