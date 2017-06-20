package com.qiuzhi.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.qiuzhi.entity.AdminAccount;

@Repository
public interface AdminAccountDao {
    /**
     * 根据 id 查询管理员账号
     * @param id
     * @return
     */
    AdminAccount selectByPrimaryKey(Integer id);
    
    /**
     * 根据 账号 查询管理员账号
     * @param account
     * @return
     */
	AdminAccount selectOneByAccount(String account);
	/**
	 * 更新密码
	 * @param newPassword
	 * @param id
	 * @return
	 */
    int updatePassword(@Param("newPassword") String newPassword, @Param("id") Integer id);
    
    ArrayList<AdminAccount> selectAllAccounts();
    
    /**
     * 添加普通管理员账号
     * @param adminAccount
     * @return
     */
    int addAdminAccount(AdminAccount adminAccount);
    
    int deleteAdminAccount(int id);
}