package com.xiaomi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xiaomi.dao.mapper.UserMapper;
import com.xiaomi.dao.vo.Address;
import com.xiaomi.dao.vo.User;
import com.xiaomi.service.UserService;
import com.xiaomi.service.impl.AddressServiceImpl;
import com.xiaomi.service.impl.UserServiceImpl;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("UTF-8"); 
         String operate=request.getParameter("operate");  
         UserService userop = new  UserServiceImpl();
         if("login".equals(operate)) 
         {    
        	     String username=request.getParameter("username");
        	     String pwd=request.getParameter("password"); 
        	  try {
				User user=userop.login(username, pwd);
				System.out.println("loh");
			    if(user!=null) 
			    { 
			    	System.out.println("denglu");
			    	String phone=user.getPhone(); 
			        int gender=user.getGender(); 
			        String uid=user.getUid(); 
			        Address defaultAddr = new AddressServiceImpl().finddefaultAddress(uid);
			        request.getSession().setAttribute("defaultAddr", defaultAddr);
			        request.getSession().setAttribute("uid", uid);
				    request.getSession().setAttribute("username",username); 
				    request.getSession().setAttribute("phone",phone);
			     	request.getSession().setAttribute("gender",gender);
				    request.getRequestDispatcher("GoodServlet?operate=showgood").forward(request,response); 
			    } 
			    else 
			    {   
			    	String freason="n";
			    	System.out.println("nn");
			    	request.setAttribute("freason",freason); 
			    	request.getRequestDispatcher("login.jsp").forward(request,response); 
			    }
			} catch (Exception e) {		
				e.printStackTrace();
			} 
         } 
         else if("register".equals(operate)) 
         {               
        	
        	 String username=request.getParameter("username");
        	 String pwd=request.getParameter("password"); 
        	 String phone = request.getParameter("phone");
        	 System.out.println("ddsa");
        	  try {  
        		   User user=new User(); 
        		   user.setUsername(username); 
        		   user.setPassword(pwd); 
        		   user.setPhone(phone);
        		   if(userop.register(user)) { 
        			   System.out.println("ddd");
        			   request.getRequestDispatcher("login.jsp").forward(request,response); 
        		   }else {
        			   String freason="n";
        			   System.out.println("nn");
   			    	request.setAttribute("freason",freason); 
        			   request.getRequestDispatcher("register.jsp").forward(request,response);
        		   }
			} catch (Exception e) {
				e.printStackTrace();
			} 
         } 
         else if("changeMessage".equals(operate))  
        	 
         {	 System.out.println("进入该");  
        	 String uid=request.getSession().getAttribute("uid").toString();
		         if(uid==null) {
		   		  response.sendRedirect("login.jsp");
		   	  }
               String username=request.getSession().getAttribute("username").toString();   	    
 	           String phone=request.getParameter("contact");   
 	           int gender = Integer.parseInt(request.getParameter("sex"));
 	           System.out.println("tttttttttttttttttttttt" + gender);
 	        User user= new UserServiceImpl().findUser(username);
 	        user.setGender(gender); user.setPhone(phone);
             try {
                   boolean re= userop.changeMessage(user); 
                    if(re) {
    				    request.getSession().setAttribute("phone",phone);
    				    request.getSession().setAttribute("gender",gender);
                    request.getRequestDispatcher("self_info.jsp").forward(request,response); } 
                    else { String freason="n";
                	request.setAttribute("freason",freason); 
			    	 request.getRequestDispatcher("self_info.jsp").forward(request,response); 
                    }
	     	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		                      }  
          }    
         else if("changepassword".equals(operate))  
         {	   
               String username=request.getSession().getAttribute("username").toString();
               System.out.println("username"+username);
 	           String oldpwd=request.getParameter("oldpass");   
 	           System.out.println("oldpass" + oldpwd);
 	          if(userop.login(username, oldpwd)==null) {
 	        	  System.out.println("old错");
 	        	 String freason="oldpasswordiswrong";
              	 request.setAttribute("freason",freason); 
		    	 request.getRequestDispatcher("modifyPwd.jsp").forward(request,response); 
 	          }else {
 	        	 String newpwd=request.getParameter("contact");  
 	        	System.out.println("ddddddddddddddddddddd" + newpwd);
 	        	 boolean re= userop.changePassword(username,newpwd);
 	        	if(re) { 
 	        		System.out.println("成功");
 	        		 String freason="true";
 	        		 response.sendRedirect("login.jsp");
 	        	}
 	        	else {    
 	        		System.out.println("失败");
             	    String freason="changefailed";
                 	request.setAttribute("freason",freason); 
		    	    request.getRequestDispatcher("modifyPwd.jsp").forward(request,response); 
 	        		}
 	          }
         }
	}
	public void init() throws ServletException {
		// Put your code here
	}
	}


