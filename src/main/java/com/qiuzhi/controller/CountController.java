package com.qiuzhi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.qiuzhi.entity.TBaseResult;
import com.qiuzhi.service.CountService;

@Controller
@RequestMapping(value="/count")
public class CountController {
	@Autowired
	private CountService countService;

	@RequestMapping(value="/getNumber")
	@ResponseBody
	public TBaseResult<Integer> getNumber(int id){
		TBaseResult<Integer> result = new TBaseResult<Integer>();
		result = countService.updateNuber(id);
		return result;
	}
}