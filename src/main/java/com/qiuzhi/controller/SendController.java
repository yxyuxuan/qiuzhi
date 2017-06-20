package com.qiuzhi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.Resume;
import com.qiuzhi.service.ResumeService;
import com.qiuzhi.service.SendRecordService;

@Controller
@RequestMapping(value="/send")
public class SendController {
	@Autowired
	private SendRecordService sendRecordService ;
	
	@Autowired
	private ResumeService resumeService;
	
	/**
	 * 
	 * 投递简历
	 * @param jobId
	 * @param jobName
	 * @param companyId
	 * @param companyName
	 * @return
	 */
	@RequestMapping(value="/sendResume")
	@ResponseBody
	public BaseResult sendResume(int jobId,String jobName,int companyId,String companyName){
		BaseResult result = new BaseResult();
		// 判断简历是否存在
		Resume resume = resumeService.queryDetail();
		if(resume==null){
			result.setMessage("您还没有简历！");
			result.setStatus(-1);
			return result;
		}
		result = sendRecordService.sendRecord(jobId, companyId, companyName, jobName, resume.getId());
		return result;
	}
	
	/**
	 * 更新投递的简历的状态
	 * @param status
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/updateStatus")
	@ResponseBody
	public BaseResult updateStatus(String status,Integer id){
		BaseResult result = new BaseResult();
		result = sendRecordService.updateReceivedRecordStatus(status, id);
		return result;
	}

}
