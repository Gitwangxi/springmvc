package com.kingnod.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.kingnod.entity.Chat;

/**
 * @author zhenghongwei
 */

public interface ChatDao extends PagingAndSortingRepository<Chat,Long>, JpaSpecificationExecutor<Chat> {
	
	@Query("select a from Chat a where a.sendId<>:sendId and a.readFlag=:readFlag order by a.sendDate asc")
	List<Chat> findNotReadChat(@Param("readFlag")String readFlag,@Param("sendId")Long sendId);
	
	@Query("select a from Chat a where a.sendId=:sendId and a.readFlag=:readFlag order by a.sendDate asc")
	List<Chat> findCurrendSendAndNotRead(@Param("readFlag")String readFlag,@Param("sendId")Long sendId);
}
