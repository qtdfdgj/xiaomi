package com.xiaomi.service;

import java.util.List;
import java.util.Map;

import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Order;

public interface OrderService {

	public List<Order> showOrders(String uid);//展示所有订单
	public boolean cancelOrder(String id);//取消订单	
	public boolean createOrder(Order order); //插入订单
	public boolean updateOrder(String oid,int i); //修改订单的state状态，1-已支付，2-已取消，3-已完成
	public Order showOrderByOid(String oid);//展示指定订单
	public Map<String,String> selectByVersionId(String gid); //通过商品版本id查询商品名、图片、价格
	public boolean payOrder(String oid); //支付订单
}
