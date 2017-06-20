package com.qiuzhi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qiuzhi.dao.CompanyAccountDao;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CompanyAccount;
import com.qiuzhi.util.HelperUtil;

@Service
public class CompanyAccountService {
	@Autowired
	private CompanyAccountDao companyAccountDao;
	
	/**
	 * 登录
	 * 
	 * @param loginAccount
	 * @return
	 */
	public BaseResult login(CompanyAccount loginAccount) {
		BaseResult result = new BaseResult();
		CompanyAccount queryAccount = null;
		queryAccount = companyAccountDao.selectOneByAccount(loginAccount.getAccount());
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
			// TODO:
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
		CompanyAccount queryAccount = null;
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		queryAccount = companyAccountDao.selectByPrimaryKey(id);
		if (!oldPassword.equals(queryAccount.getPassword())) {
			result.setMessage("旧密码错误!");
			result.setStatus(-1);
			return result;
		}
		System.out.println(newPassword);
		int affectedRecord = companyAccountDao.updatePassword(newPassword, id);
		if (affectedRecord > 0) {
			result.setMessage("修改密码成功!");
			result.setStatus(1);
			// 清空 session
			HelperUtil.clearKeyAndValue();
			return result;
		}

		result.setMessage("修改密码失败！");
		result.setStatus(-1);
		return result;
	}
	
	/**
	 * 注册
	 * @param newApplicantAccount
	 * @return
	 */
	public BaseResult register(CompanyAccount newCompanyAccount){
		BaseResult result = new BaseResult();
		// 判断该账号是否存在
		CompanyAccount queryAccount = null;
		queryAccount = companyAccountDao.selectOneByAccount(newCompanyAccount.getAccount());
		if(queryAccount!=null){
			result.setMessage("该账号已经存在！");
			result.setStatus(-1);
			return result;
		}
		int affectedRecord = companyAccountDao.insert(newCompanyAccount);
		if(affectedRecord>0){
			result.setMessage("注册成功，请登录！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("注册失败！");
		result.setStatus(-1);
		return result;
	}
}
