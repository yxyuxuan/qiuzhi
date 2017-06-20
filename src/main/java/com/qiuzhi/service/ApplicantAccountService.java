package com.qiuzhi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qiuzhi.dao.ApplicantAccountDao;
import com.qiuzhi.entity.ApplicantAccount;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.util.HelperUtil;

@Service
public class ApplicantAccountService {
	@Autowired
	private ApplicantAccountDao applicantAccountDao;

	/**
	 * 登录
	 * 
	 * @param loginAccount
	 * @return
	 */
	public BaseResult login(ApplicantAccount loginAccount) {
		BaseResult result = new BaseResult();
		ApplicantAccount queryAccount = null;
		queryAccount = applicantAccountDao.selectOneByAccount(loginAccount.getAccount());
		if (queryAccount == null) {
			result.setMessage("该账号不存在!");
			result.setStatus(-1);
			return result;
		}
		if (loginAccount.getPassword().equals(queryAccount.getPassword())) {
			result.setMessage("登录成功!");
			result.setStatus(1);
			HelperUtil.setKeyAndValue("id", String.valueOf(queryAccount.getId()));
			return result;
		}
		result.setMessage("账号或密码错误!");
		result.setStatus(-1);
		return result;
	}

	/**
	 * 修改密码
	 * 
	 * @param oldPassword
	 * @param newPassword
	 * @return
	 */
	public BaseResult changePassword(String oldPassword, String newPassword) {
		BaseResult result = new BaseResult();
		ApplicantAccount queryAccount = null;
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		queryAccount = applicantAccountDao.selectByPrimaryKey(id);
		if (!oldPassword.equals(queryAccount.getPassword())) {
			result.setMessage("旧密码错误!");
			result.setStatus(-1);
			return result;
		}

		int affectedRecord = applicantAccountDao.updatePassword(newPassword, id);
		if (affectedRecord > 0) {
			result.setMessage("修改密码成功!");
			result.setStatus(1);
			// 清空 session
			HelperUtil.clearKeyAndValue();
			return result;
		}

		result.setMessage("修改密码失败!");
		result.setStatus(-1);
		return result;
	}
	
	/**
	 * 注册
	 * @param newApplicantAccount
	 * @return
	 */
	public BaseResult register(ApplicantAccount newApplicantAccount){
		BaseResult result = new BaseResult();
		// 判断该账号是否存在
		ApplicantAccount queryAccount = null;
		queryAccount = applicantAccountDao.selectOneByAccount(newApplicantAccount.getAccount());
		if(queryAccount!=null){
			result.setMessage("该账号已经存在!");
			result.setStatus(-1);
			return result;
		}
		int affectedRecord = applicantAccountDao.insert(newApplicantAccount);
		if(affectedRecord>0){
			result.setMessage("注册成功,请返回登录！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("注册失败！");
		result.setStatus(-1);
		return result;
	}
	
	
}
