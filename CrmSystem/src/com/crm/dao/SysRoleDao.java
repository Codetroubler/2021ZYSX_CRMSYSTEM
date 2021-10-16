package com.crm.dao;

import org.springframework.stereotype.Repository;

import com.crm.info.SysRole;
import com.haha.hibernate.HibernateDao;
/**
 * 系统角色表
 * @author 陈洪海
 *
 */
@Repository("sysRoleDao")
public class SysRoleDao  extends HibernateDao<SysRole, Integer> {

	
	
}
