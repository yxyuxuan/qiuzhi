package com.qiuzhi.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.qiuzhi.entity.CompanyAccount;

@Repository
public interface CompanyAccountDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyAccount record);

    int insertSelective(CompanyAccount record);

    CompanyAccount selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyAccount record);

    int updateByPrimaryKey(CompanyAccount record);
    
    CompanyAccount selectOneByAccount(String account);

    int updatePassword(@Param("newPassword") String newPassword, @Param("id") Integer id);
}