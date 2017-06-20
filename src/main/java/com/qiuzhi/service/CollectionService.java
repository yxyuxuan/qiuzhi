package com.qiuzhi.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qiuzhi.dao.CollectionDao;
import com.qiuzhi.entity.BaseResult;
import com.qiuzhi.entity.CollectionEntity;

@Service
public class CollectionService {
	@Autowired
	private CollectionDao collectionDao;

	public BaseResult addToCollection(CollectionEntity collectionEntity) {
		BaseResult result = new BaseResult();
		int affectedRecord = 0;
		try{
			affectedRecord = collectionDao.add(collectionEntity);
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(affectedRecord > 0){
			result.setMessage("收藏成功！");
			result.setStatus(1);
			return result;
		}
		result.setMessage("收藏失败！");
		result.setStatus(-1);
		return result;
	}

	public BaseResult remove(int id) {
		BaseResult result = new BaseResult();
		int affectedRecord = 0;
		try{
			affectedRecord = collectionDao.remove(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(affectedRecord > 0){
			result.setMessage("取消收藏成功");
			result.setStatus(1);
			return result;
		}
		result.setMessage("取消收藏失败");
		result.setStatus(-1);
		return result;
	}

	public boolean hasCollected(int applicantId, int jobId) {
		if(collectionDao.hasCollected(applicantId,jobId)!=null){
			return true;
		}
		return false;
	}
	
	public ArrayList<CollectionEntity> queryCollectionsByApplicantId(int applicantId){
		 ArrayList<CollectionEntity> collectionList = collectionDao.selectCollectionsByApplicantId(applicantId);
		 return collectionList;
	}

}
