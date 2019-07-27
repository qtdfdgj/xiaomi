package com.xiaomi.controller;

import java.io.IOException;
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
import javax.websocket.Session;

import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Good_version;
import com.xiaomi.dao.vo.Goods;
import com.xiaomi.dao.vo.User;
import com.xiaomi.service.CartService;
import com.xiaomi.service.GoodService;
import com.xiaomi.service.impl.CartServiceImpl;
import com.xiaomi.service.impl.GoodServiceImpl;



/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService c = new CartServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		String operate = request.getParameter("operate");
	    try{
	    if ("showCarts".equals(operate)) {	      
	      if(request.getSession().getAttribute("uid")==null) {
	    	  response.sendRedirect("login.jsp");
	      }
	      String uid = request.getSession().getAttribute("uid").toString();
	      List<Map<Cart, Map<Good_version, Goods>>> list= c.showCarts(uid);
	      System.out.println(list.size());
	      List<Cart> listcart = new ArrayList<Cart>();
	      List<Good_version> listGv = new ArrayList<Good_version>();
	      List<Goods> listG = new ArrayList<Goods>();
	      for (Map<Cart, Map<Good_version, Goods>> map1 : list) {
				Set<Cart> set = map1.keySet();
				for (Cart cart : set) {
					listcart.add(cart);
					System.out.print(cart.toString());
					Map<Good_version, Goods> map2 = map1.get(cart);
					Set<Good_version> set2 = map2.keySet();
					for (Good_version good_version : set2) {
						listGv.add(good_version);
						System.out.print("&&&&"+ good_version.toString());
						Goods good = map2.get(good_version);
						listG.add(good);
						System.out.println("&&&&"+ good.toString());
					}
				}
			}
	      for(int i = 0; i < listcart.size(); i++) {
	    	  System.out.println(listcart.get(i).toString());
	    	  System.out.println(listGv.get(i).toString());
	    	  System.out.println(listG.get(i).toString());
	      }
	      request.setAttribute("carts", listcart);
	      request.setAttribute("goodversion", listGv);
	      request.setAttribute("good", listG);
	      request.getRequestDispatcher("trolley.jsp").forward(request,response); 
	    } else if ("addCart".equals(operate)) {
	    		String version = request.getParameter("aa");
				String Good_id=version.split("  ")[3];
				String GoodVersion_id=version.split("  ")[2];
				System.out.println("goodid"+Good_id);
				System.out.println("doogversion"+GoodVersion_id);				
	    	  String uId = request.getSession().getAttribute("uid").toString();
	    	  if(uId==null) {
	    		  response.sendRedirect("login.jsp");
	    	  }
	    	  CartService cs = new CartServiceImpl();
	    	  if(cs.addCart(uId, GoodVersion_id)) {
	    		  System.out.println("chenggongle");
	    		  String freason = "n";
	    		  request.setAttribute("freason", freason);
	    	  }
	    	  GoodService gs = new GoodServiceImpl();
	    	  List<Good_version> goodversion = gs.showVersion(Good_id);
	    	  Goods good = gs.showGoodsByID(Good_id);
	    	  request.setAttribute("good", good);
			  request.setAttribute("versionslist", goodversion);
			  request.getRequestDispatcher("xiangqing.jsp").forward(request, response);
	    } else if ("cancelCart".equals(operate)) {
	    	String cid = request.getParameter("cid");
	    	boolean h = c.cancelCart(cid);
	    	if(h) {
	    		  System.out.println("quxiao成功");  
	    	  }else {
	    		  System.out.println("quxiao失败");  
	    	  }
		    request.getRequestDispatcher("CartServlet?operate=showCarts").forward(request,response); 
	    } else if ("modifyCart".equals(operate)) {
	    	String cid = request.getParameter("cid");
	    	String uid = request.getParameter("uid");
	    	String gid = request.getParameter("gid");
	        int num = Integer.valueOf(request.getParameter("num")).intValue();
	        Date created_time=new Date(System.currentTimeMillis());
	        Cart cart=new Cart(cid, uid, gid, num, created_time);
	        boolean h = c.modifyCart(cart);
	        if(h) {
		       System.out.println("xiu成功");  
	        }else {
		          System.out.println("xiu失败");  
	        }
	        request.setAttribute("operate", "showcCarts");
		    request.getRequestDispatcher("CartServlet?operate=showCarts").forward(request,response); 
	    }else if("chuandaohoutai".equals(operate)) {
	    	System.out.println("============================");
	    	String[] checkId = request.getParameterValues("checkId");
	    	System.out.println(checkId.length);
	    	String[] number = request.getParameterValues("num");
	    	System.out.println(number.length);
	    	List<String> version=new ArrayList<String>();
		  	List<String> price=new ArrayList<String>();
		  	List<String> Good_id=new ArrayList<String>();
		  	List<String> num=new ArrayList<String>();
			List<String> C_id=new ArrayList<String>();
			List<String> image=new ArrayList<String>();
			float sumPrice = 0f;
			for(int i=0;i<checkId.length;i++) {
				String gid = new CartServiceImpl().findCart(checkId[i]).getGid();
				Good_version goodversion = new GoodServiceImpl().findGV(gid);
				Goods good = new GoodServiceImpl().showGoodsByID(goodversion.getGood_id());
				System.out.println(goodversion.getVersion());
				version.add(goodversion.getVersion());
				System.out.println(goodversion.getPrice());
				
				price.add(String.valueOf(goodversion.getPrice()));
				System.out.println(number[i]);
				num.add(number[i]);
				sumPrice += goodversion.getPrice()*Integer.parseInt(number[i]);
				System.out.println(goodversion.getId());
				Good_id.add(goodversion.getId());
				C_id.add(checkId[i]);
				image.add(good.getImage());
			}
			request.getSession().setAttribute("sumPrice",String.valueOf(sumPrice));
			request.getSession().setAttribute("version",version);
			request.getSession().setAttribute("price",price);
			request.getSession().setAttribute("num",num);
			request.getSession().setAttribute("Good_id",Good_id);
			request.getSession().setAttribute("C_id",C_id);
			request.getSession().setAttribute("image",image);
			request.getRequestDispatcher("jiesuan.jsp").forward(request,response);
	    }else if("deleteAll".equals(operate)) {
	    	String[] checkId = request.getParameterValues("checkId");
	    	System.out.println("checkId"+checkId);
	    	List<String> cid = (List<String>)request.getSession().getAttribute("C_id");
	    	System.out.println("cid"+cid);
	    	CartService cart = new CartServiceImpl();
	    	for(int i=0;i<checkId.length;i++) {
				cart.cancelCart(checkId[i]);
			}
	    	request.getRequestDispatcher("CartServlet?operate=showCarts").forward(request, response);
	    }
		  } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		  }
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
