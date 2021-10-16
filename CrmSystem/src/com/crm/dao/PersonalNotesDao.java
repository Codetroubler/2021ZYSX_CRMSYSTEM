package com.crm.dao;

import org.springframework.stereotype.Repository;

import com.crm.info.PersonalNotes;
import com.haha.hibernate.HibernateDao;

/**
 * ���˱�ǩ��
 * @author �º麣
 *
 */
@Repository("personalNotesDao")
public class PersonalNotesDao extends HibernateDao<PersonalNotes, Integer>{
	
}
