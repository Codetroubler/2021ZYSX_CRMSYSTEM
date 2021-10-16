package com.crm.dao;

import org.springframework.stereotype.Repository;

import com.crm.info.PublicChatRoom;
import com.haha.hibernate.HibernateDao;

/**
 * 公共聊天室表
 * @author 陈洪海
 *
 */
@Repository("publicChatRoomDao")
public class PublicChatRoomDao  extends HibernateDao<PublicChatRoom, Integer>{


}
