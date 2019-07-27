package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Order;

public interface OrderMapper 
{
	public int insertOrder(Order order);
	public List<Order> selectOrderByUserId(String id);
	public int deleteOrder(String id ); //删除订单，修改state=2
	public int updateOrder(Order order); //修改订单
	public Order selectOrderByOid(String oid); //通过oid查询Order对象
	
	public String selectNameByVersionId(String vid);
	public String selectImageByVersionId(String vid);
	public float selectPriceByVersionId(String vid);
}
