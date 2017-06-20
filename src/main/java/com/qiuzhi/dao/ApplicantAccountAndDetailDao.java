package com.qiuzhi.dao;

import java.util.ArrayList;
import org.springframework.stereotype.Repository;
import com.qiuzhi.entity.ApplicationAccountAndDetailEntity;

@Repository
public interface ApplicantAccountAndDetailDao {
	
	ArrayList<ApplicationAccountAndDetailEntity> selectAll();
}