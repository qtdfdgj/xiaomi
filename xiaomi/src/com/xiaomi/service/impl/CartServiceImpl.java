package com.xiaomi.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.xiaomi.dao.mapper.CartMapper;
import com.xiaomi.dao.mapper.GoodVersionMapper;
import com.xiaomi.dao.mapper.GoodsMapper;
import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Good_version;
import com.xiaomi.dao.vo.Goods;
import com.xiaomi.dao.vo.User;
import com.xiaomi.service.CartService;
import com.xiaomi.util.DBUtil;

public class CartServiceImpl implements CartService {

	//生成ID
	private String createId() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	//展示
	@Override
	public List<Map<Cart, Map<Good_version, Goods>>> showCarts(String uid) {
		SqlSession session = DBUtil.getSession();
		List<Map<Cart, Map<Good_version, Goods>>> list = new ArrayList<>();
		
		
		try 
		{
			CartMapper g = session.getMapper(CartMapper.class);
			GoodsMapper gMapper = session.getMapper(GoodsMapper.class);
			GoodVersionMapper versionMapper = session.getMapper(GoodVersionMapper.class);
			List<Cart> gs = g.selectByUserId(uid);
			for (Cart cart : gs) {
//				System.out.println(cart.toString());
				Good_version good_version = versionMapper.selectByGoodVersionId(cart.getGid());
				//System.out.println(good_version.toString());
				Goods goods = gMapper.selectGoodsByID(good_version.getGood_id());
//				System.out.println(goods.toString());
				Map<Good_version, Goods> map2 = new HashMap<>();
				map2.put(good_version, goods);
				Map<Cart, Map<Good_version, Goods>> map1 = new HashMap<>();
				map1.put(cart, map2);
				list.add(map1);
//				System.out.println(list.size());
			}
			session.commit();
			
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}


	@Override
	public boolean addCart(String userid, String goodversionId) {
		SqlSession session = DBUtil.getSession();
		try
		{
			CartMapper cartmapper = session.getMapper(CartMapper.class);
			// 加入购物车
			Cart cart = new Cart();
			cart.setCid(createId());
			cart.setUid(userid);
			cart.setGid(goodversionId);
			cart.setNum(1);
			cart.setCreated_time(new Date(System.currentTimeMillis()));
			int n = cartmapper.insertCart(cart);
			session.commit();
			if (n > 0) 
			{
				return true;
			}
			else 
			{
				return false;
			}
			
		} 
		finally
		{
			if(session!=null) {
				session.close();
			}
		}
	}

	public boolean cancelCart(String cid) {
		SqlSession session = DBUtil.getSession();
		try 
		{
			CartMapper g = session.getMapper(CartMapper.class);
			int a= g.deleteCart(cid);
			session.commit();
			if(a>0)
			{
				return true;
			}else {
				return false;
			}	
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		
	}

	
	@Override
	public boolean modifyCart(Cart cart) {
		SqlSession session = DBUtil.getSession();
		try 
		{
			CartMapper g = session.getMapper(CartMapper.class);
			int a= g.updateCart(cart);
			session.commit();
			if(a>0)
			{
				return true;
			}else {
				return false;
			}
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		
	}

	@Override
	public Cart findCart(String cid) {
		SqlSession session = DBUtil.getSession();
		try 
		{
			CartMapper g = session.getMapper(CartMapper.class);
			Cart c= g.findCart(cid);
			session.commit();
			return c;
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}

}
