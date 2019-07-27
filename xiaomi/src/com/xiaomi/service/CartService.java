package com.xiaomi.service;

import java.util.List;
import java.util.Map;

import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Good_version;
import com.xiaomi.dao.vo.Goods;
import com.xiaomi.dao.vo.User;

public interface CartService {

	public List<Map<Cart, Map<Good_version,Goods>>> showCarts(String uid);//展示购物车
	public boolean addCart(String userId, String goodversionId);//加购
	public boolean cancelCart(String cid);//取消购物车
	public boolean modifyCart(Cart cart);//修改购物车
	public Cart findCart(String cid);
}
