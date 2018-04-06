package com.echo.jcps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.echo.jcps.dao.JournalDao;
import com.echo.jcps.entity.Journal;
import com.echo.jcps.service.JournalService;
import com.echo.jcps.web.JournalController;

@Service
public class JournalServiceImpl implements JournalService {
	
	// 注入DAO层数据
	@Autowired
	private JournalDao journalDao;
	
	// 注入Controller
	@Autowired
	private JournalController fileController;

	// 上传期刊文件信息
	@Override
	public void insertJournal(Journal journal) {
		journalDao.insertJournal(journal);
	}

	@Override
	public List<Journal> queryAllJournalList() {
		List<Journal> list = journalDao.queryAllJournalList();
		return list;
	}

	/**
	 * 检查期刊名是否重复
	 */
	@Override
	public Journal checkFilename(String fileName) {
		return journalDao.checkFilename(fileName);
	}

	/**
	 * 删除对应ID的期刊
	 */
	@Override
	public int deleteJournalById(Integer id) {
		return journalDao.deleteJournalById(id);
	}

	/**
	 * 更新已审核期刊为已更新
	 */
	@Override
	public int updateStatus(Integer id) {
		return journalDao.updateStatus(id);
	}

	/**
	 * 通过id查询对应期刊
	 */
	@Override
	public Journal queryJournalById(Integer jId) {
		return journalDao.queryJournalById(jId);
	}

	/**
	 * 更新审核完成的期刊的信息
	 */
	@Override
	public int updateJournal(Journal journal) {
		return journalDao.updateJournal(journal);
	}

	/**
	 * 通过用户查询对应期刊列表
	 */
	@Override
	public List<Journal> queryJournalByUid(Integer uId) {
		return journalDao.queryJournalByUid(uId);
	}

	/**
	 * 通过文件名查询对应期刊文件
	 */
	@Override
	public Journal queryJournalByFileName(String filename) {
		return journalDao.queryJournalByFileName(filename);
	}
	


}
