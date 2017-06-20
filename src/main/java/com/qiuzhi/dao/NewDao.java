package com.qiuzhi.dao;

import com.qiuzhi.entity.NewEntity;
import java.util.ArrayList;
import org.springframework.stereotype.Repository;

@Repository
public interface NewDao {
    int deleteByPrimaryKey(Integer id);

    int insert(NewEntity record);

    int insertSelective(NewEntity record);

    NewEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NewEntity record);

    int updateByPrimaryKey(NewEntity record);
    
    ArrayList<NewEntity> selectAllNews();
}