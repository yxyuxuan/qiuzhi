package com.qiuzhi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qiuzhi.dao.CompanyDetailDao;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CompanyDetail;
import com.qiuzhi.util.HelperUtil;

@Service
public class CompanyDetailService {
	@Autowired
	private CompanyDetailDao companyDetailDao;
	
	/**
	 * 查看基本信息
	 * @return
	 */
	public CompanyDetail queryDetail(int id){
		CompanyDetail companyDetail = null ;
		companyDetail= companyDetailDao.selectByPrimaryKey(id);
		return companyDetail;
	}
	
	/**
	 * 添加个人信息
	 * @param applicantDetail
	 * @return
	 */
	public BaseResult addDetail(CompanyDetail companyDetail){
		BaseResult result =new BaseResult();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		companyDetail.setId(id);
		int affectedRecord = companyDetailDao.insert(companyDetail);
		if(affectedRecord>0){
			result.setMessage("添加企业信息成功!");
			result.setStatus(1);
			return result;
		}
		result.setMessage("添加企业信息失败!");
		result.setStatus(-1);
		return result;
	}
	

	public BaseResult updateCompanyDetail(CompanyDetail newCompanyDetail){
		BaseResult result = new BaseResult();
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		newCompanyDetail.setId(id);
		int affectedRecord=companyDetailDao.updateByPrimaryKey(newCompanyDetail);
		if(affectedRecord>0){
			result.setMessage("修改企业信息成功！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("修改企业信息失败！");
		result.setStatus(-1);
		return result;
	}
}
