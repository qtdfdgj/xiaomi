package com.xiaomi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xiaomi.dao.mapper.UserMapper;
import com.xiaomi.dao.vo.Address;
import com.xiaomi.dao.vo.User;
import com.xiaomi.service.AddressService;
import com.xiaomi.service.impl.AddressServiceImpl;
import com.xiaomi.util.DBUtil;

@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	private AddressService addressServiceImpl;
	
	public void init () throws ServletException
	{
		addressServiceImpl = new AddressServiceImpl();
		System.out.println("-----------初始化AddressServlet-----------");
	}
       
    public AddressServlet() {
        super();
    }
    
    public void destroy() {
		super.destroy();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		String operate = request.getParameter("operate");
		System.out.println("----------------AddressServlet-doPost------------------");
		System.out.println("operate: " + operate);
		
		// 查找地址ַ
		if ("findAddressByUserId".equals(operate))
		{
			// 获取用户id
			String uid = (String)request.getSession().getAttribute("uid");
			System.out.println("findAddressByUserId---");
			System.out.println("获取到用户uid：" + uid);
			
			// 从数据库查找ַ
			List<Address> addressList = addressServiceImpl.findAddressByUserId(uid);
			System.out.println("查找到用户地址：");
			for (Address address : addressList)
			{
				System.out.println(address.toString());
				if (address.getIs_default() == 1)
					request.getSession().setAttribute("defaultAddr", address);
			}
			request.getSession().setAttribute("addressList", addressList);
			request.getRequestDispatcher("self_addr.jsp").forward(request, response);
		}
		else if("selectAddress".equals(operate))
		{
			List<Address> addressList = (List<Address>)request.getSession().getAttribute("addressList");
			String aid = request.getParameter("aid");
			String flag = request.getParameter("flag");
			for (Address address : addressList)
			{
				System.out.println(address.toString());
				if (aid.equals(address.getAid()))
				{
					request.getSession().setAttribute("defaultAddr", address);
					break;
				}
			}
			if ("genghuan".equals(flag)) request.setAttribute("flag", flag);
			request.getRequestDispatcher("jiesuan.jsp").forward(request, response);
		}
		// 添加地址ַ
		else if ("addAddress".equals(operate))
		{
			System.out.println("addAddress---");
			
			// 获取姓名
			String username = (String)request.getSession().getAttribute("username");  // 登录用户的姓名
			System.out.println("获取到登录用户姓名：" + username);
			String uid = null; // 收货人的id，即登录用户的id
			String name = request.getParameter("name"); // 收货人姓名
			User user = DBUtil.getSession().getMapper(UserMapper.class).selectByName(username);  // 根据登录用户的name获得user对象
			uid = user.getUid();   // 得到user的id
			System.out.println("根据登录用户的name获得其user对象：" + user.toString());
			
			// 获取地址
			String province = request.getParameter("province");
			String city = request.getParameter("city");
			String district = request.getParameter("distinct");
			String street = request.getParameter("countryside");
			if (street.equals("请选择")) street = "";
			String address = province + city + district + street;
			
			// 获取联系方式
			String contact = request.getParameter("contact");
			String phone = null, tel = null;
			if (contact.length() == 11) phone = contact;
			else tel = contact;
			
			String tag = request.getParameter("add_type"); // 地址类型
			
			// 获取地址默认状态
			int is_default = 0;
			String is_default_checked = request.getParameter("default");
			System.out.println(is_default_checked);
			if ("true".equals(is_default_checked)) {is_default = 1;
				Address defaultAddr = addressServiceImpl.finddefaultAddress(uid);
				System.out.println(defaultAddr);
				if(defaultAddr != null) {
					defaultAddr.setIs_default(0);
					addressServiceImpl.modifyAddress(defaultAddr);
				}
			}
			Address addr = new Address(uid, name, address, phone, tel, tag, is_default);
			
			// 加入数据库
			boolean isDone = addressServiceImpl.addAddress(addr); // 同时生成aid
			
			if (isDone) System.out.println("添加成功: " + addr.toString());
			else System.out.println("添加失败！");
			response.sendRedirect("AddressServlet?operate=findAddressByUserId");
		}
		// 修改地址ַ
		else if ("modifyAddress".equals(operate))
		{
			// 获取id和name
			String aid = request.getParameter("aid");
			String uid = request.getParameter("uid");
			String name = request.getParameter("name");
			
			// 获取地址
			String province = request.getParameter("province");
			String city = request.getParameter("city");
			String district = request.getParameter("distinct");
			String street = request.getParameter("countryside");
			if (street.equals("请选择")) street = "";
			String address = province + city + district + street;
			
			// 获取联系方式
			String contact = request.getParameter("contact");
			String phone = null, tel = null;
			if (contact.length() == 11) phone = contact;
			else tel = contact;
						
			String tag = request.getParameter("add_type"); // 地址类型
			
			// 获取地址默认状态
			int is_default = 0;
			String is_default_checked = request.getParameter("default");
			System.out.println(is_default_checked);
			if ("true".equals(is_default_checked)) {
				is_default = 1;
				Address defaultAddr = addressServiceImpl.finddefaultAddress(uid);
				if(defaultAddr != null) {
					defaultAddr.setIs_default(0);
					addressServiceImpl.modifyAddress(defaultAddr);
				}
			}
			Address addr = new Address(aid, uid, name, address, phone, tel, tag, is_default);
			
			// 在数据库中修改
			boolean isDone = addressServiceImpl.modifyAddress(addr);

			if (isDone) System.out.println("修改成功: " + addr.toString());
			else System.out.println("修改失败！");
			response.sendRedirect("AddressServlet?operate=findAddressByUserId");
		}
		// 删除地址ַ
		else if ("deleteAddress".equals(operate))
		{
			// 获取地址id
			String aid = request.getParameter("aid");
			
			// 在数据库中删除ַ
			boolean isDone = addressServiceImpl.deleteAddress(aid);
			
			if (isDone) System.out.println("删除成功: " + aid);
			else System.out.println("删除失败！");
			response.sendRedirect("AddressServlet?operate=findAddressByUserId");
		}
		else
		{
			System.out.println("AddressServlet没有执行任何控制操作！");
		}
	}
}