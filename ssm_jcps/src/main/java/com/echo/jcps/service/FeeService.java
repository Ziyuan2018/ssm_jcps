package com.echo.jcps.service;

import java.util.List;

import com.echo.jcps.entity.Fee;

/**
 * Fee实体的Service层业务接口
 */
public interface FeeService {

	/**
	 * 查询所有费用信息
	 */
	List<Fee> queryAllFees();

	/**
	 * 添加费用信息
	 * @param fee
	 */
	int insertFees(Fee fee);

	/**
	 * 根据用户信息查询费用信息
	 * @param uid
	 * @return
	 */
	List<Fee> queryFeesByUserId(Integer uId);

	/**
	 * 删除对应ID的费用信息
	 * @param id
	 * @return
	 */
	int deleteFeesById(Integer id);

	/**
	 * 更新对应ID的费用信息
	 * @param id
	 * @return
	 */
	int updateFeesById(Integer id,Fee fee);

	/**
	 * 根据ID查询对应费用信息
	 * @param id
	 * @return
	 */
	Fee queryFeesById(Integer id);

	/**
	 * 根据期刊ID查询对应费用信息
	 * @param id
	 * @return
	 */
	Fee queryFeesByJournalId(Integer id);

	/**
	 * 作者更新费用支付状态支付
	 * @param fId
	 * @param state
	 * @return
	 */
	int updateFeesState(Integer fId, boolean state);

}
