package com.echo.jcps.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.jcps.entity.Fee;

/**
 * 对应用户的Fee实体的DAO层接口
 */
public interface FeeDao {

	/**
	 * 查询所有费用信息
	 * @return
	 */
	List<Fee> queryAllFees();

	/**
	 * 添加费用信息
	 * @param fee
	 * @return
	 */
	int insertFees(@Param("fee")Fee fee);

	/**
	 * 根据用户ID查询费用信息
	 * @param uId
	 * @return
	 */
	List<Fee> queryFeesByUserId(@Param("uId")Integer uId);

	/**
	 * 删除对应ID的费用信息
	 * @param id
	 * @return
	 */
	int deleteFeesById(@Param("id")Integer id);

	/**
	 * 更新对应ID的费用信息
	 * @param id
	 * @return
	 */
	int updateFeesById(@Param("id")Integer id,@Param("fee")Fee fee);

	/**
	 * 跟据ID查询对应费用信息
	 * @param id
	 * @return
	 */
	Fee queryFeesById(@Param("id")Integer id);

	/**
	 * 根据期刊ID查询对应费用信息
	 * @param id
	 * @return
	 */
	Fee queryFeesByJournalId(@Param("jId")Integer id);

	/**
	 * 用户更新费用支付状态
	 * @param fId
	 * @param state
	 * @return
	 */
	int updateFeesState(@Param("fId")Integer fId,@Param("state") boolean state);

}
