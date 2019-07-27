package com.xiaomi.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.AddressMapper;
import com.xiaomi.dao.mapper.GoodsMapper;
import com.xiaomi.dao.vo.Address;
import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Good_version;
import com.xiaomi.dao.vo.Goods;
import com.xiaomi.dao.vo.Order;
import com.xiaomi.dao.vo.User;
import com.xiaomi.service.AddressService;
import com.xiaomi.service.CartService;
import com.xiaomi.service.GoodService;
import com.xiaomi.service.OrderService;
import com.xiaomi.service.UserService;
import com.xiaomi.service.impl.AddressServiceImpl;
import com.xiaomi.service.impl.CartServiceImpl;
import com.xiaomi.service.impl.GoodServiceImpl;
import com.xiaomi.service.impl.OrderServiceImpl;
import com.xiaomi.service.impl.UserServiceImpl;
import com.xiaomi.util.DBUtil;

public class ServiceTest {

	public static void main(String[] args) {
//		Address a = new Address();
//		a.setUid("10");
//		a.setAddress("jjj");
//		AddressService as = new AddressServiceImpl();
//		System.out.println(as.addAddress(a));
//		List<Address> las =  as.findAddressByUserId("10");
//		for (Address address : las) {
//			System.out.println(address.toString());
//		}
//		a = las.get(0);
//		a.setAddress("ggg");
//		System.out.println(as.modifyAddress(a));
//		System.out.println(as.deleteAddress("32"));
		
//		CartService c = new CartServiceImpl();
		//加购
//				User u = new User();
//				Good_version a = new Good_version();
//				a.setId("3");
//				u.setUid("10");
//				c.addCart(u, a);
						
		//根据用户id查询
//				List<Cart> as = c.showCarts("10");
//				for (Cart h : as) {
//					System.out.println(h.toString());
//				}
		//取消购物车
//				c.cancelCart("7");
				
		//修改购物车
//				Cart z=new Cart();
//				z.setCid("1");
//				z.setUid("10");
//				z.setGid("2");
//				z.setNum(5);
//				z.setCreated_time(null);
//				c.modifyCart(z);
//				Cart ct = as.get(0);
//				ct.setNum(2);
//				c.modifyCart(ct);
//		OrderService os=new OrderServiceImpl();
			//测试1
//				List<Order> l=new ArrayList<Order>(); 
//				l=os.showOrders("10");
//				for (Order order : l) {
//					System.out.println(order.getOid()+order.getTitle());
//				}
//		System.out.println(os.cancelOrder("52f26580899d4c4da20a496b042873ec"));
		
			//测试3
//				Order order=new Order();
//				order.setUid("10");
//				order.setGid("2");
//				System.out.println(os.createOrder(order));
//				os.updateOrder("87f82868772c4e299bd0c2cac884bf96",2);
		UserService us = new UserServiceImpl();
//		User u = new User();
//		u.setUsername("tianjiabo");
//		u.setPassword("456");
		System.out.println(us.changePassword("tianjiabo","fffff"));
//		GoodService aa = new GoodServiceImpl() ;
//			System.out.println(aa.showGoods());
//	       System.out.println(aa.showVersion("1"));
//	       System.out.println(aa.showGoodsByLabel("2"));
//	        System.out.println(aa.showGoodsByID("1"));
//	        System.out.println(aa.deleteGoods("1",5));
//		CartService aa = new CartServiceImpl();
//		List<Map<Cart, Map<Good_version, Goods>>> list = aa.showCarts("10");
//		System.out.println(list.size());
//		for (Map<Cart, Map<Good_version, Goods>> map1 : list) {
//			Set<Cart> set = map1.keySet();
//			System.out.println(set.size());
//			for (Cart cart : set) {
//				System.out.print(cart.toString());
//				Map<Good_version, Goods> map2 = map1.get(cart);
//				Set<Good_version> set2 = map2.keySet();
//				for (Good_version good_version : set2) {
//					System.out.print("&&&&"+ good_version.toString());
//					Goods goods = map2.get(good_version);
//					System.out.println("&&&&"+ goods.toString());
//				}
//			}
//		}
//		SqlSession session = DBUtil.getSession();
//		GoodsMapper goodsmapper = session.getMapper(GoodsMapper.class);
//		List<Goods> list = goodsmapper.selectByCategory();
//		System.out.println(list);
////		
//		SqlSession session = DBUtil.getSession();
//		UserService 
//		AddressMapper addressMapper = session.getMapper(AddressMapper.class);
//		System.out.println(addressMapper.finddefaultAddress("8fc2c4a6bd2a4e8db4630fc3fc9bc052"));
//		User u = new User();
//		u.setPassword("123");
//		u.setUsername("123");
//		new UserServiceImpl().register(u);
		
	}

}
