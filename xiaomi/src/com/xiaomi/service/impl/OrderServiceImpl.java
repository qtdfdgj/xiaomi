package com.xiaomi.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.CartMapper;
import com.xiaomi.dao.mapper.OrderMapper;
import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Order;
import com.xiaomi.util.DBUtil;

public class OrderServiceImpl implements com.xiaomi.service.OrderService {

	//生成ID
	private String createId() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	//展示所有订单
	@Override
	public List<Order> showOrders(String uid) {
		List<Order> list =new ArrayList<Order>();
		SqlSession session=DBUtil.getSession();
		OrderMapper om=session.getMapper(OrderMapper.class);
		list=om.selectOrderByUserId(uid);
		session.commit();
		if(session!=null) {
			session.close();
		}
		return list;
	}
	
	//插入订单
	public boolean createOrder(Order order) {
		boolean b=false;
		order.setOid(createId()); //生成uuid并作为order的id
		SqlSession session=DBUtil.getSession();
		OrderMapper om=session.getMapper(OrderMapper.class);
		int i=om.insertOrder(order);
		session.commit();
		if(i==0) {
			b=false;
		}else {
			b=true;
		}
		if(session!=null) {
			session.close();
		}
		return b;
	}
	
	//取消订单
	public boolean cancelOrder(String id) {
		boolean b=false;
		SqlSession session=DBUtil.getSession();
		OrderMapper cm=session.getMapper(OrderMapper.class);
		int i=cm.deleteOrder(id);
		session.commit();
		if(i==0) {
			b=false;
		}else {
			b=true;
		}
		if(session!=null) {
			session.close();
		}
		return b;
	}
	
	//修改订单的state状态，1-已支付，2-已取消，3-已完成
	public boolean updateOrder(String oid,int no) {
		boolean b=false;
		SqlSession session =DBUtil.getSession();
		OrderMapper om=session.getMapper(OrderMapper.class);
		Order order=om.selectOrderByOid(oid);
		order.setState(no);
		int i=om.updateOrder(order);
		session.commit();
		if(i>0) {
			b=true;
		}
		if(session!=null) {
			session.close();
		}
		return b;
	}
	
	//展示指定订单
	public Order showOrderByOid(String oid) {
		SqlSession session=DBUtil.getSession();
		OrderMapper om=session.getMapper(OrderMapper.class);
		Order order=om.selectOrderByOid(oid);
		session.commit();
		if(session!=null) {
			session.close();
		}
		return order;
	}
	
	//通过商品版本id查询商品名、图片、价格
	public Map<String,String> selectByVersionId(String gid){
		SqlSession session=DBUtil.getSession();
		OrderMapper om=session.getMapper(OrderMapper.class);
		Map<String,String> map=new HashMap<String,String>();
		map.put("name", om.selectNameByVersionId(gid));
		map.put("image", om.selectImageByVersionId(gid));
		map.put("price", String.valueOf(om.selectPriceByVersionId(gid)));
		session.commit();
		if(session!=null) {
			session.close();
		}
		return map;
	}
	
	//支付订单
	public boolean payOrder(String oid){
		boolean b=false;
		SqlSession session=DBUtil.getSession();
		OrderMapper om=session.getMapper(OrderMapper.class);
		Date date=new Date();
		Timestamp timestamp=new Timestamp(date.getTime());
		Order order =om.selectOrderByOid(oid);
		order.setPay_time(timestamp);
		order.setState(1);
		int i=om.updateOrder(order);
		if(i==0) {
			b=false;
		}else{
			b=true;
		}
		session.commit();
		if(session!=null) {
			session.close();
		}
		return b;
	}
}
