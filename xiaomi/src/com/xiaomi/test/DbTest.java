package com.xiaomi.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.AddressMapper;
import com.xiaomi.dao.mapper.CartMapper;
import com.xiaomi.dao.mapper.GoodVersionMapper;
import com.xiaomi.dao.mapper.GoodsMapper;
import com.xiaomi.dao.mapper.OrderMapper;
import com.xiaomi.dao.mapper.UserMapper;
import com.xiaomi.dao.vo.Address;
import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Good_version;
import com.xiaomi.dao.vo.Goods;
import com.xiaomi.dao.vo.Order;
import com.xiaomi.dao.vo.User;
import com.xiaomi.util.DBUtil;


public class DbTest {

	public static void main(String[] args) {
		SqlSession session = DBUtil.getSession();
		System.out.println(session);
//		GoodVersionMapper gvm = session.getMapper(GoodVersionMapper.class);
//		List<Good_version> gvs =  gvm.selectByGoodId("3");
//		for (Good_version good_version : gvs) {
//			System.out.println(good_version.toString());
//		}
//		Good_version g = gvs.get(0);
//		g.setNum(99);
//		int n = gvm.updateGood(g);
//		System.out.println(n);
//		session.commit();
		
//		AddressMapper am = session.getMapper(AddressMapper.class);
//		List<Address> as = am.selectAddrByUserId("10");
//		for (Address address : as) {
//			System.out.println(address.toString());
//		}
//		Address a = as.get(0);
//		System.out.println(am.deleteAddr(a.getAid()));
		
//		OrderMapper om = session.getMapper(OrderMapper.class);
//		Order o = new Order();
//		o.setOid("1");
//		o.setUid("10");
//		o.setGid("1");
//		System.out.println(om.insertOrder(o));
//		List<Order> os = om.selectOrderByUserId("10");
////		for (Order order : os) {
////			System.out.println(order.toString());
////		}
//		System.out.println(om.deleteOrder(os.get(0).getOid()));
//		UserMapper um = session.getMapper(UserMapper.class);
////		System.out.println(um.selectByName("lt").toString());
//		User u = um.selectByName("tl");
//		u.setUid("19");
//		u.setUsername("tl");
//		u.setUsername("ltt");
//		u.setPassword("123");
//		System.out.println(um.updatePsd(u.getUid(), "123", "123"));
		
//		GoodsMapper gm = session.getMapper(GoodsMapper.class);
//		List<Goods> gs = gm.selectByType("小米手机");
//		for (Goods good : gs) {
//			System.out.println(good.toString());
//		}
//		CartMapper cm = session.getMapper(CartMapper.class);
//		Cart c = new Cart();
//		c.setCid("7");
//		c.setGid("1");
//		c.setUid("10");
//		System.out.println(cm.insertCart(c));
//		List<Cart> cs = cm.selectByUserId("10");
//		for (Cart cart : cs) {
//			System.out.println(cart.toString());
////		}
//		Cart c = cs.get(0);
////		c.setUid("12");
//		System.out.println(cm.deleteCart("1"));
//		session.commit();
	}

}
