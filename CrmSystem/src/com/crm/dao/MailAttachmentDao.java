package com.crm.dao;

import org.springframework.stereotype.Repository;

import com.crm.info.MailAttachment;
import com.haha.hibernate.HibernateDao;

/**
 * 员工内部邮件附件表
 * @author 陈洪海
 *
 */
@Repository("mailAttachmentDao")
public class MailAttachmentDao extends HibernateDao<MailAttachment,Integer>{
	

}
