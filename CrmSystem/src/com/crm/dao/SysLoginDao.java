package com.crm.dao;

import org.springframework.stereotype.Repository;

import com.crm.info.SysLogin;
import com.haha.hibernate.HibernateDao;
/**
 * 员工历史登录表
 * @author 陈洪海
 *
 */
@Repository("sysLoginDao")
public class SysLoginDao extends HibernateDao<SysLogin, Integer> {


}
