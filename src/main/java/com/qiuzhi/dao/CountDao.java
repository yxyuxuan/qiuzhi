package com.qiuzhi.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qiuzhi.entity.CountEntity;

@Repository
public interface CountDao{

	int addRecord(CountEntity countEntity);

	CountEntity selectById(int id);
	
	int updateNumber(@Param("number") Integer number,@Param("id")Integer id);

}