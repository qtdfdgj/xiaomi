package com.xiaomi.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.OrderMapper;
import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Order;
import com.xiaomi.service.CartService;
import com.xiaomi.service.GoodService;
import com.xiaomi.service.OrderService;
import com.xiaomi.service.impl.CartServiceImpl;
import com.xiaomi.service.impl.GoodServiceImpl;
import com.xiaomi.service.impl.OrderServiceImpl;
import com.xiaomi.util.DBUtil;
/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	public OrderService os=new OrderServiceImpl();
	public CartService cs=new CartServiceImpl();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operate=request.getParameter("operate");
		String userId=request.getSession().getAttribute("uid").toString();//用户id
		String orderId=request.getParameter("orderId"); //订单id
		
		if("showorder_byuserid".equals(operate)) { //订单中心,返回订单对象列表
			List<Order> orderList=os.showOrders(userId);
			request.setAttribute("orderList",orderList);
			request.getRequestDispatcher("dingdanzhongxin.jsp").forward(request, response);
		}else if("showorder_byorderid".equals(operate)) { //订单详情，返回订单对象
			Order order=os.showOrderByOid(orderId);
			request.setAttribute("order", order);
			request.getRequestDispatcher("dingdanxiangqing.jsp").forward(request, response);
		}else if("create_order".equals(operate)) { //生成订单
			List<Order> allOrderList=(List<Order>) request.getSession().getAttribute("allOrderList");
			System.out.println("空空孔"+allOrderList);
			Date date=new Date();
			Timestamp timestamp=new Timestamp(date.getTime());
			float zj = 0;
			List<String> orderIds = new ArrayList<String>();
			for (Order order : allOrderList) {
				GoodService gs=new GoodServiceImpl();
				order.setTitle(os.selectByVersionId(order.getGid()).get("name"));
				order.setImage(os.selectByVersionId(order.getGid()).get("image"));
//				order.setPrice(order.getPrice());
//				order.setPrice(Float.parseFloat(os.selectByVersionId(order.getGid()).get("price")));
				order.setTotal_price(order.getPrice()*order.getNum());
				zj+=order.getTotal_price();
				order.setState(0);
				order.setOrder_time(timestamp);
				boolean b=os.createOrder(order);
				orderIds.add(order.getOid());
				gs.deleteGoods(order.getGid(), order.getNum()); //减少订单对应商品的数量
				request.setAttribute("is_success", b); 
			}
			request.getSession().setAttribute("orderIds",orderIds);
			List<String> cidList=(List<String>) request.getSession().getAttribute("C_id");
			request.getSession().removeAttribute("C_id");
			if(cidList!=null) {
				for (String cid : cidList) {
					System.out.println(cid);
					cs.cancelCart(cid); //删去对应的购物车记录
				}
			}
//			request.getSession().setAttribute("total_amount", zj);
			request.getRequestDispatcher("AlipayServlet?total_amount="+zj).forward(request, response);
		}else if("pay_order".equals(operate)) {// 支付订单
			List<String> orderIds= (List<String>)request.getSession().getAttribute("orderIds");
			System.out.println(orderIds);
			for (String string : orderIds) {
				 os.payOrder(string);
			}
			request.getRequestDispatcher("GoodServlet?operate=showgood").forward(request, response);
		}
	}
}
