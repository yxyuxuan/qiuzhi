package com.qiuzhi.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qiuzhi.dao.ResumeDao;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.Job;
import com.qiuzhi.entity.Resume;
import com.qiuzhi.util.HelperUtil;

@Service
public class ResumeService {
	@Autowired
	private ResumeDao resumeDao;
	
	
	/**
	 * 添加简历信息
	 * @param applicantDetail
	 * @return
	 */
	public BaseResult addResume(Resume resume){
		BaseResult result =new BaseResult();
		int applicantid = Integer.valueOf(HelperUtil.getValueByKey("id"));
		resume.setApplicantid(applicantid);
		int affectedRecord = resumeDao.insert(resume);
		if(affectedRecord>0){
			result.setMessage("添加简历成功！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("添加简历失败!");
		result.setStatus(-1);
		return result;
	}
	
	/**
	 * 查询简历信息
	 * @return
	 */
	public Resume queryDetail(){
		Resume resume = null;
		int applicantId = Integer.valueOf(HelperUtil.getValueByKey("id"));
		resume = resumeDao.selectByApplicantId(applicantId);
		return resume;
	}
	
	/**
	 * 修改简历信息
	 * @param newResume
	 * @return
	 */
	public BaseResult updateApplicantDetail(Resume newResume){
		BaseResult result = new BaseResult();
		int applicantid = Integer.valueOf(HelperUtil.getValueByKey("id"));
		newResume.setApplicantid(applicantid);
		int affectedRecord=resumeDao.updateByPrimaryKey(newResume);
		if(affectedRecord>0){
			result.setMessage("修改简历信息成功!");
			result.setStatus(1);
			return result;
		}
		result.setMessage("修改简历信息失败!");
		result.setStatus(-1);
		return result;
	}
	
	/**
	 * 查询简历信息
	 * @return
	 */
	public Resume queryDetailByResumeId(Integer id){
		Resume resume = null;
		resume = resumeDao.selectByPrimaryKey(id);
		return resume;
	}
	
	public ArrayList<Resume> queryAllResumes(){
		ArrayList<Resume> resumes = new ArrayList<Resume>();
		resumes = resumeDao.selectAllResumes();
		return resumes;
	}
	
	public ArrayList<Resume> searchResumesByName(String name){
		ArrayList<Resume> resumeList = resumeDao.queryResumeByName(name);
		System.out.println("size: "+resumeList.size());
		return resumeList;
	}
	
	/**
	 * 根据类别查询工作
	 * @param category
	 * @return
	 */
	public ArrayList<Resume> searchJobsByCategory(String category){
		ArrayList<Resume> resumeList = resumeDao.queryResumeByCategory(category);
		return resumeList;
	}
}
