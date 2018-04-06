package com.echo.jcps.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.jcps.entity.Journal;

/**
 * 期刊实体同数据库操作的接口
 */
public interface JournalDao {

	/**
	 * 保存期刊信息
	 * @param journal
	 * @return
	 */
	int insertJournal(@Param("journal")Journal journal);

	/**
	 * 获取期刊列表
	 * @return
	 */
	List<Journal> queryAllJournalList();

	/**
	 * 检查期刊名是否重复
	 * @param fileName
	 * @return
	 */
	Journal checkFilename(@Param("fileName")String fileName);

	/**
	 * 删除对应ID的期刊
	 * @param id
	 * @return
	 */
	int deleteJournalById(@Param("id")Integer id);

	/**
	 * 更新已审核期刊为已发表
	 * @param id
	 * @return
	 */
	int updateStatus(@Param("id")Integer id);

	/**
	 * 通过id查询对应id
	 * @param jId
	 * @return
	 */
	Journal queryJournalById(@Param("id")Integer jId);

	/**
	 * 更新审核完成后的期刊信息
	 * @param journal
	 * @return
	 */
	int updateJournal(@Param("journal")Journal journal);

	/**
	 * 通过用户查询对应期刊列表
	 * @param uId
	 * @return
	 */
	List<Journal> queryJournalByUid(@Param("id")Integer uId);

	/**
	 * 通过文件名查询期刊文件
	 * @param filename
	 * @return
	 */
	Journal queryJournalByFileName(@Param("filename")String filename);
}
