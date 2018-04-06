package com.echo.jcps.service;

import java.util.List;

import com.echo.jcps.entity.Journal;


/**
 * 期刊信息的业务操作接口
 */
public interface JournalService {

	/**
	 * 将期刊信息写入DB的业务接口
	 * @param file
	 */
	void insertJournal(Journal journal);
	
	/**
	 * 获得期刊文件列表
	 * @return
	 */
	List<Journal> queryAllJournalList();

	/**
	 * 检查期刊文件名是否重复
	 * @param fileName
	 * @return
	 */
	Journal checkFilename(String fileName);

	/**
	 * 删除对应ID的期刊
	 * @param id
	 * @return
	 */
	int deleteJournalById(Integer id);

	/**
	 * 更新已审核期刊为已发表
	 * @param id
	 * @return
	 */
	int updateStatus(Integer id);

	/**
	 * 通过id查询对应期刊
	 * @param jId
	 * @return
	 */
	Journal queryJournalById(Integer jId);

	/**
	 * 更新审核完成期刊的信息
	 * @param journal
	 * @return
	 */
	int updateJournal(Journal journal);

	/**
	 * 通过用户查询对应期刊列表
	 * @param uId
	 * @return
	 */
	List<Journal> queryJournalByUid(Integer uId);

	/**
	 * 通过文件名查询对应期刊
	 * @param filename
	 * @return
	 */
	Journal queryJournalByFileName(String filename);
}
