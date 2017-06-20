package com.qiuzhi.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qiuzhi.dao.AdminAccountDao;
import com.qiuzhi.dao.ApplicantAccountAndDetailDao;
import com.qiuzhi.dao.ApplicantAccountDao;
import com.qiuzhi.dao.ApplicantDetailDao;
import com.qiuzhi.dao.CollectionDao;
import com.qiuzhi.dao.CompanyAccountAndDetailDao;
import com.qiuzhi.dao.CompanyAccountDao;
import com.qiuzhi.dao.CompanyDetailDao;
import com.qiuzhi.dao.JobDao;
import com.qiuzhi.dao.ResumeDao;
import com.qiuzhi.dao.SendRecordDao;
import com.qiuzhi.entity.AdminAccount;
import com.qiuzhi.entity.ApplicationAccountAndDetailEntity;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CompanyAccountAndDetailEntity;
import com.qiuzhi.util.HelperUtil;

@Service
public class AdminService {
	@Autowired
	private AdminAccountDao adminAccountDao;

	@Autowired
	private CompanyAccountAndDetailDao companyAccountAndDetailDao;

	@Autowired
	private CompanyAccountDao companyAccountDao;

	@Autowired
	private CompanyDetailDao companyDetailDao;

	@Autowired
	private JobDao jobDao;

	@Autowired
	private ApplicantAccountAndDetailDao applicantAccountAndDetailDao;

	@Autowired
	private ApplicantAccountDao applicantAccountDao;

	@Autowired
	private ApplicantDetailDao applicantDetailDao;

	@Autowired
	private ResumeDao resumeDao;

	@Autowired
	private SendRecordDao sendRecordDao;
	
	@Autowired
	private CollectionDao collectionDao;

	/**
	 * 登录
	 * 
	 * @param loginAccount
	 * @return
	 */
	public BaseResult login(AdminAccount loginAccount) {
		BaseResult result = new BaseResult();
		AdminAccount queryAccount = null;
		queryAccount = adminAccountDao.selectOneByAccount(loginAccount.getAccount());
		if (queryAccount == null) {
			result.setMessage("该账号不存在!");
			result.setStatus(-1);
			return result;
		}
		if (loginAccount.getPassword().equals(queryAccount.getPassword())) {
			result.setMessage("登录成功！");
			result.setStatus(1);
			HelperUtil.setKeyAndValue("id", String.valueOf(queryAccount.getId()));
			return result;
		}
		result.setMessage("账号或密码错误！");
		result.setStatus(-1);
		return result;
	}

	/**
	 * 查询账号详情
	 * 
	 * @param id
	 * @return
	 */
	public AdminAccount queryDetail(int id) {
		AdminAccount adminAccount = adminAccountDao.selectByPrimaryKey(id);
		return adminAccount;
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
		AdminAccount queryAccount = null;
		int id = Integer.valueOf(HelperUtil.getValueByKey("id"));
		queryAccount = adminAccountDao.selectByPrimaryKey(id);
		if (!oldPassword.equals(queryAccount.getPassword())) {
			result.setMessage("旧密码错误！");
			result.setStatus(-1);
			return result;
		}

		int affectedRecord = adminAccountDao.updatePassword(newPassword, id);
		if (affectedRecord > 0) {
			result.setMessage("修改密码成功！");
			result.setStatus(1);
			// 清空 session
			HelperUtil.clearKeyAndValue();
			return result;
		}

		result.setMessage("修改密码失败！");
		result.setStatus(-1);
		return result;
	}

	public ArrayList<AdminAccount> selectAccount() {
		ArrayList<AdminAccount> accountList = adminAccountDao.selectAllAccounts();
		return accountList;
	}

	public BaseResult addAdminAccount(AdminAccount adminAccount) {
		BaseResult result = new BaseResult();
		AdminAccount queryAccount = adminAccountDao.selectOneByAccount(adminAccount.getAccount());
		if (queryAccount != null) {
			result.setMessage("该账号已经存在！");
			result.setStatus(-1);
			return result;
		}
		int affectedRecord = 0;
		try {
			affectedRecord = adminAccountDao.addAdminAccount(adminAccount);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		if (affectedRecord > 0) {
			result.setMessage("添加管理员账号成功！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("添加管理员账号失败！");
		result.setStatus(-1);
		return result;
	}

	public BaseResult deleteAdminAccount(int id) {
		BaseResult result = new BaseResult();
		int affectedRecord = adminAccountDao.deleteAdminAccount(id);
		if (affectedRecord > 0) {
			result.setMessage("删除管理员账号成功！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("删除管理员账号失败！");
		result.setStatus(-1);
		return result;
	}

	public ArrayList<ApplicationAccountAndDetailEntity> selectAllApplicant() {
		ArrayList<ApplicationAccountAndDetailEntity> applicationAccountAndDetailList = applicantAccountAndDetailDao
				.selectAll();
		return applicationAccountAndDetailList;
	}

	public BaseResult deleteApplicantAccount(int id) {
		BaseResult result = new BaseResult();
		// 删除账号
		applicantAccountDao.deleteByPrimaryKey(id);
		// 删除用户基本信息
		applicantDetailDao.deleteByPrimaryKey(id);
		// 删除简历
		resumeDao.deleteByApplicantid(id);
		// 删除投递记录
		sendRecordDao.deleteByApplicantid(id);
		result.setMessage("删除成功！");
		result.setStatus(1);
		return result;
	}

	public ArrayList<CompanyAccountAndDetailEntity> selectAllCompany() {
		ArrayList<CompanyAccountAndDetailEntity> companyAccountAndDetailList = companyAccountAndDetailDao.selectAll();
		return companyAccountAndDetailList;
	}

	public BaseResult deleteCompanyAccount(int id) {
		BaseResult result = new BaseResult();
		// 删除账号
		companyAccountDao.deleteByPrimaryKey(id);
		// 删除基本信息
		companyDetailDao.deleteByPrimaryKey(id);
		// 删除发布的工作
		jobDao.deleteByCompanyId(id);
		// 删除投递记录
		sendRecordDao.deleteByCompanyid(id);
		result.setMessage("删除成功！");
		result.setStatus(1);
		return result;
	}
	
	public BaseResult deleteJobAndSendRecord(int id){
		BaseResult result = new BaseResult();
		try {
			
		int a = jobDao.deleteByPrimaryKey(id);
		System.out.println("a"+a);
		int b =sendRecordDao.deleteByJobid(id);
		System.out.println("b"+b);
		int c =collectionDao.removeByJobId(id);
		System.out.println("c"+c);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		result.setMessage("删除成功！");
		result.setStatus(1);
		return result;
	}

}
