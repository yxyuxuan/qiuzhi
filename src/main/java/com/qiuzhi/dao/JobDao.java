package com.qiuzhi.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qiuzhi.entity.Job;
@Repository
public interface JobDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Job record);

    Job selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Job record);

    ArrayList<Job> selectJobs(int companyid);

    ArrayList<Job> selectAllJobs();

    int updateStatus(@Param("isenable")Integer isenable,@Param("id")Integer id);

    ArrayList<Job> queryJobByName(String name);

	/**
	 * 根据类别查询工作
	 * @param category
	 * @return
	 */
	ArrayList<Job> queryJobByCategory(String category);
	
	int deleteByCompanyId(int companyid);

}
