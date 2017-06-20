package com.qiuzhi.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qiuzhi.entity.CollectionEntity;

@Repository
public interface CollectionDao {
	
    ArrayList<CollectionEntity> selectCollectionsByApplicantId(int applicantId);
	
	int add(CollectionEntity collectionEntity);
	
	int remove(int id);
	
	int removeByJobId(int jobId);

	CollectionEntity hasCollected(@Param("applicantId")int applicantId,@Param("jobId") int jobId);
}