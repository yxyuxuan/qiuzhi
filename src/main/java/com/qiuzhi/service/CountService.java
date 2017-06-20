package com.qiuzhi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qiuzhi.dao.CountDao;
import com.qiuzhi.entity.CountEntity;
import com.qiuzhi.entity.TBaseResult;

@Service
public class CountService {
	@Autowired
	private CountDao countDao;
	
	public TBaseResult<Integer> updateNuber(int id){
		TBaseResult<Integer> result = new TBaseResult<Integer>();
		CountEntity countEntity = countDao.selectById(id);
		if(countEntity==null){
			countEntity = new CountEntity();
			countEntity.setId(id);
			countEntity.setNumber(1);
			countDao.addRecord(countEntity);
		}else{
			countEntity.setNumber(countEntity.getNumber()+1);
			countDao.updateNumber(countEntity.getNumber(), id);
		}
		result.setStatus(1);
		result.setData(countEntity.getNumber());
		return result;
	}
}
