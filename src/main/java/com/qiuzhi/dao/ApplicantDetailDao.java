package com.qiuzhi.dao;

import org.springframework.stereotype.Repository;

import com.qiuzhi.entity.ApplicantDetail;
@Repository

public interface ApplicantDetailDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ApplicantDetail record);

    int insertSelective(ApplicantDetail record);

    ApplicantDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ApplicantDetail record);

    int updateByPrimaryKey(ApplicantDetail record);
}