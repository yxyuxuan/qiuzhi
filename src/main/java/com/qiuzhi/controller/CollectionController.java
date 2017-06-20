package com.qiuzhi.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CollectionEntity;
import com.qiuzhi.service.CollectionService;
import com.qiuzhi.util.HelperUtil;


@Controller
@RequestMapping(value="/collection")
public class CollectionController {
	@Autowired
	private CollectionService collectionService;

	/**
	 * 将职位添加至收藏夹
	 * @param  jobId 
	 * @return       [description]
	 */
	@RequestMapping(value="/add")
	@ResponseBody
	public BaseResult addToCollection(int companyId,int jobId,String companyName,String jobName){
		BaseResult result = new BaseResult();
		int applicantId = Integer.valueOf(HelperUtil.getValueByKey("id"));
		CollectionEntity collectionEntity = new CollectionEntity();
		collectionEntity.setCompanyId(companyId);
		collectionEntity.setApplicantId(applicantId);
		collectionEntity.setJobId(jobId);
		collectionEntity.setCompanyName(companyName);
		collectionEntity.setJobName(jobName);
		collectionEntity.setCollectionTime(new Date());
		result = collectionService.addToCollection(collectionEntity);
		return result;
	}

	/**
	 * 取消收藏
	 * @param  id [description]
	 * @return    [description]
	 */
	@RequestMapping(value="/remove")
	@ResponseBody
	public BaseResult remove(int id){
		BaseResult result = new BaseResult();
		result = collectionService.remove(id);
		return result;
	}

}