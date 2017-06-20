package com.qiuzhi.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qiuzhi.dao.JobDao;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.Job;
import com.qiuzhi.util.HelperUtil;

@Service
public class JobService {
	@Autowired
	private JobDao jobDao;
	
	/**
	 * 添加工作
	 * @param job
	 * @return
	 */
	public BaseResult addJob(Job job){
		BaseResult result = new BaseResult();
		
		int affectedRecord = jobDao.insert(job);
		if(affectedRecord>0){
			result.setMessage("发布职位成功！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("发布职位失败！");
		result.setStatus(-1);
		return result;
	}
	
	public ArrayList<Job> queryJobs(){
		int companyid = Integer.valueOf(HelperUtil.getValueByKey("id"));
		ArrayList<Job>  jobList= jobDao.selectJobs(companyid);
		return jobList;
	}
	/**
	 * 查询所有的工作
	 * @return [description]
	 */
	public ArrayList<Job> queryAllJobs(){
		ArrayList<Job>  jobList= jobDao.selectAllJobs();
		return jobList;
	}
	/**
	 * 查询职位详情
	 * @param id
	 * @return
	 */
	public Job query(int id ){
		Job job = jobDao.selectByPrimaryKey(id);
		return job;
	}
	
	public BaseResult updateStatus(Integer isenable ,Integer id){
		BaseResult result = new BaseResult();
		int affectedRecord = jobDao.updateStatus(isenable, id);
		if(affectedRecord>0){
			result.setMessage("操作成功！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("操作失败！");
		result.setStatus(-1);
		return result;
	}
	
	/**
	 * 根据名称查询工作
	 * @param name
	 * @return
	 */
	public ArrayList<Job> searchJobsByName(String name){
		ArrayList<Job>  jobList= jobDao.queryJobByName(name);
		return jobList;
	}

	/**
	 * 根据类别查询工作
	 * @param category
	 * @return
	 */
	public ArrayList<Job> searchJobsByCategory(String category){
		ArrayList<Job> jobList = jobDao.queryJobByCategory(category);
		return jobList;
	}

}
