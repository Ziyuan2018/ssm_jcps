package com.echo.jcps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.echo.jcps.dao.FeeDao;
import com.echo.jcps.entity.Fee;
import com.echo.jcps.service.FeeService;

/**
 * Fee实体的Service层接口实现类
 */
@Service
public class FeeServiceImpl implements FeeService {

	// 注入DAO层
	@Autowired
	private FeeDao feeDao;

	/**
	 * 查询所有费用信息
	 */
	@Override
	public List<Fee> queryAllFees() {
		return feeDao.queryAllFees();
	}

	/**
	 * 添加费用信息
	 */
	@Override
	public int insertFees(Fee fee) {
		return feeDao.insertFees(fee);
	}

	/**
	 * 根据用户ID查询费用信息
	 */
	@Override
	public List<Fee> queryFeesByUserId(Integer uId) {
		return feeDao.queryFeesByUserId(uId);
	}

	/**
	 * 删除对应ID的费用信息
	 */
	@Override
	public int deleteFeesById(Integer id) {
		return feeDao.deleteFeesById(id);
	}

	/**
	 * 更新对应ID的费用信息
	 */
	@Override
	public int updateFeesById(Integer id,Fee fee) {
		return feeDao.updateFeesById(id,fee);
	}

	/**
	 * 根据ID查询对应费用信息
	 */
	@Override
	public Fee queryFeesById(Integer id) {
		return feeDao.queryFeesById(id);
	}

	/**
	 * 根据期刊ID查询费用信息
	 */
	@Override
	public Fee queryFeesByJournalId(Integer id) {
		return feeDao.queryFeesByJournalId(id);
	}

	/**
	 * 作者更新费用支付状态
	 */
	@Override
	public int updateFeesState(Integer fId, boolean state) {
		return feeDao.updateFeesState(fId,state);
	}	
	
}
