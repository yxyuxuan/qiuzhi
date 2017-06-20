package com.qiuzhi.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qiuzhi.dao.NewDao;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.NewEntity;

@Service
public class NewService{
	@Autowired
	private NewDao newDao;
	
	public BaseResult addNew(NewEntity record){
		BaseResult result = new BaseResult();
		int affectedRecord = 0;
		try{
			affectedRecord = newDao.insert(record);
		}catch(Exception e){
			e.printStackTrace();
		}
		if(affectedRecord > 0){
			result.setMessage("发布新闻成功！");
			result.setStatus(1);
			return result;
		}
		
		result.setMessage("发布新闻失败！");
		result.setStatus(-1);
		return result;
	}
	
	public NewEntity detial(int id){
		NewEntity newEntity = newDao.selectByPrimaryKey(id);
		return newEntity;
	}
	
	public ArrayList<NewEntity> queryAllNews(){
		ArrayList<NewEntity>  newsList= newDao.selectAllNews();
		return newsList;
	}
	
	public BaseResult deleteNew(int id){
		BaseResult result = new BaseResult();
		int affectedRecord = 0;
		affectedRecord = newDao.deleteByPrimaryKey(id);
		if(affectedRecord > 0){
			result.setMessage("删除新闻成功！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("删除新闻失败！");
		result.setStatus(-1);
		return result;
	}
	
}
