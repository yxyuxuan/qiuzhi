package com.qiuzhi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qiuzhi.dao.ApplicantDetailDao;
import com.qiuzhi.entity.ApplicantDetail;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.util.HelperUtil;

@Service
public class ApplicantDetailService {
	@Autowired
	private ApplicantDetailDao applicantDetailDao;
	
	/**
	 * 添加个人信息
	 * @param applicantDetail
	 * @return
	 */
	public BaseResult addDetail(ApplicantDetail applicantDetail){
		BaseResult result =new BaseResult();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		applicantDetail.setId(id);
		int affectedRecord = applicantDetailDao.insert(applicantDetail);
		if(affectedRecord>0){
			result.setMessage("添加个人信息成功!");
			result.setStatus(1);
			return result;
		}
		result.setMessage("添加个人信息失败!");
		result.setStatus(-1);
		return result;
	}
	
	/**
	 * 查询个人详细信息
	 * @return
	 */
	public ApplicantDetail queryDetail(int id ){
		ApplicantDetail applicantDetail = null;
		applicantDetail =  applicantDetailDao.selectByPrimaryKey(id);
		return applicantDetail;
	}
	
	/**
	 * 修改个人信息
	 * @param newApplicantDetail
	 * @return
	 */
	public BaseResult updateApplicantDetail(ApplicantDetail newApplicantDetail){
		BaseResult result = new BaseResult();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		newApplicantDetail.setId(id);
		int affectedRecord=applicantDetailDao.updateByPrimaryKey(newApplicantDetail);
		if(affectedRecord>0){
			result.setMessage("修改个人信息成功!");
			result.setStatus(1);
			return result;
		}
		result.setMessage("修改个人信息失败!");
		result.setStatus(-1);
		return result;
	}
}
