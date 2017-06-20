package com.qiuzhi.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.qiuzhi.entity.Job;
import com.qiuzhi.entity.Resume;
@Repository
public interface ResumeDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Resume record);

    int insertSelective(Resume record);

    Resume selectByPrimaryKey(Integer id);
    
    Resume selectByApplicantId(Integer applicantId);


    int updateByPrimaryKeySelective(Resume record);

    int updateByPrimaryKey(Resume record);
    /**
     * 获得所有的简历
     * @return
     */
    ArrayList<Resume> selectAllResumes();
    /**
     * 根据名称查找简历
     * @param name
     * @return
     */
    ArrayList<Resume> queryResumeByName(String name);
    
	ArrayList<Resume> queryResumeByCategory(String category);
	int deleteByApplicantid(int applicantid);
    
}