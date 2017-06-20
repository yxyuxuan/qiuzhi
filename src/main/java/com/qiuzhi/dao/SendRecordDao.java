package com.qiuzhi.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.qiuzhi.entity.SendRecord;

@Repository
public interface SendRecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(SendRecord record);

    int insertSelective(SendRecord record);

    SendRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SendRecord record);

    int updateByPrimaryKey(SendRecord record);
    /**
     * 用户的投递记录
     * @param applicantid
     * @return
     */
    ArrayList<SendRecord> selectSendRecords(int applicantid);
    
    /**
     * 公司收到的投递记录
     * @param applicantid
     * @return
     */
    ArrayList<SendRecord> receivedRecords(int companyid);
    
    /**
     * 更新投递记录的状态
     * 
     * @param status
     * @param id
     * @return
     */
    int updateStatusByPrimaryKey(@Param("status") String status, @Param("id") Integer id);
    
	int deleteByApplicantid(int applicantid);

	int deleteByCompanyid(int companyid);

	int deleteByJobid(int jobid);

}