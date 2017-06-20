package com.qiuzhi.dao;

import org.springframework.stereotype.Repository;

import com.qiuzhi.entity.CompanyDetail;
@Repository
public interface CompanyDetailDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyDetail record);

    int insertSelective(CompanyDetail record);

    CompanyDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyDetail record);

    int updateByPrimaryKey(CompanyDetail record);
}