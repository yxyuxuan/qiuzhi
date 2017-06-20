package com.qiuzhi.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qiuzhi.entity.ApplicantAccount;
@Repository
public interface ApplicantAccountDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ApplicantAccount record);

    int insertSelective(ApplicantAccount record);

    ApplicantAccount selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ApplicantAccount record);

    int updateByPrimaryKey(ApplicantAccount record);
    
    ApplicantAccount selectOneByAccount(String account);
    
    int updatePassword(@Param("newPassword") String newPassword, @Param("id") Integer id);
}