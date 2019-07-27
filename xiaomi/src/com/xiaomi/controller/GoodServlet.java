package com.xiaomi.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xiaomi.dao.vo.Good_version;
import com.xiaomi.dao.vo.Goods;
import com.xiaomi.service.GoodService;
import com.xiaomi.service.impl.GoodServiceImpl;

/**
 * Servlet implementation class GoodServlet
 */
@WebServlet("/GoodServlet")
public class GoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String operate = request.getParameter("operate");
		if(operate.equals("findGoodsByID")) {
			String id = request.getParameter("id");
			GoodService goodsServiceImpl = new GoodServiceImpl();
			Goods goods =goodsServiceImpl.showGoodsByID(id);	
			request.setAttribute("selectGoodsByID", goods);
			System.out.println(id);
			request.getRequestDispatcher("查找货物").forward(request, response);
		}
		else if("findGoodsByName".equals(operate)) {
			String name = request.getParameter("susu");
			System.out.println(name);
			GoodService goodsServiceImpl = new GoodServiceImpl() ;
			List<Goods> goods =goodsServiceImpl.showGoodsByName(name);
			System.out.println("goods"+goods);
			request.setAttribute("selectGoodsByName", goods);
			request.getRequestDispatcher("showSearch.jsp").forward(request, response);
		}
		else if(operate.equals("findGoodsByLabel")) {
			String name = request.getParameter("label");
			GoodService goodsServiceImpl = new GoodServiceImpl() ;
			List<Goods> goods =goodsServiceImpl.showGoodsByLabel(name);
			request.setAttribute("selectedGoodsByName", goods);
			request.getRequestDispatcher("查找货物，功能分块").forward(request, response);
		}
		else if(operate.equals("xiangqing")) {
			if(request.getSession().getAttribute("uid")==null) {
		    	  response.sendRedirect("login.jsp");
		    	  return;
		      }
			String id = request.getParameter("goodId");
			System.out.println(id);
			GoodService goodsServiceImpl = new GoodServiceImpl();

			List<Good_version> goodversion = goodsServiceImpl.showVersion(id);
			for (Good_version good_version : goodversion) {
				System.out.println(good_version);
			}
			Goods good = goodsServiceImpl.showGoodsByID(id);
			request.setAttribute("good", good);
			request.setAttribute("versionslist", goodversion);
			request.getRequestDispatcher("xiangqing.jsp").forward(request, response);
		}else if("showgood".equals(operate)) {
			Map<String, List<Goods>> goodmap = new GoodServiceImpl().showGoods();
			Set<String> set = goodmap.keySet();
			List<Goods> shouji = null;
			List<Goods> bijiben = null;
			List<Goods> dianshi = null;
			for (String string : set) {
				if("手机".equals(string)) {
					shouji = goodmap.get(string);
				}
				if("笔记本".equals(string)) {
					bijiben = goodmap.get(string);
				}
				if("电视".equals(string)) {
					dianshi = goodmap.get(string);
				}
			}
			System.out.println(shouji.size());
			System.out.println(bijiben.size());
			System.out.println(dianshi.size());
			request.setAttribute("shouji", shouji);
			request.setAttribute("bijiben", bijiben);
			request.setAttribute("dianshi", dianshi);
			request.getRequestDispatcher("home.jsp").forward(request, response);
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
