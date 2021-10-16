package com.crm.dao;

import org.springframework.stereotype.Repository;

import com.crm.info.PersonalCalendar;
import com.haha.hibernate.HibernateDao;

/**
 * �����ճ̱�
 * @author �º麣
 *
 */
@Repository("PersonalCalendarDao")
public class PersonalCalendarDao extends HibernateDao<PersonalCalendar, Integer>{
	
}