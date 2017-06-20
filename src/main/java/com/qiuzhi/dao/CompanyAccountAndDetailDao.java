package com.qiuzhi.dao;

import java.util.ArrayList;
import org.springframework.stereotype.Repository;
import com.qiuzhi.entity.CompanyAccountAndDetailEntity;

@Repository
public interface CompanyAccountAndDetailDao {
	
	ArrayList<CompanyAccountAndDetailEntity> selectAll();
}