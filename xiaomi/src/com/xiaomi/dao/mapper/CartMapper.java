package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Cart;

public interface CartMapper {
	public List<Cart> selectByUserId(String id);
	public int updateCart(Cart cart);
	public int deleteCart(String id);
	public int insertCart(Cart cart);
	public Cart findCart(String cid);
}
