<%@page import="com.xiaomi.dao.vo.Goods"%>
<%@page import="com.xiaomi.dao.vo.Good_version"%>
<%@page import="com.xiaomi.dao.vo.Cart"%>
<%@page import="com.xiaomi.service.CartService"%>
<%@page import="com.xiaomi.service.impl.CartServiceImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%%>
<DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>我的购物车-小米商城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<script type="text/javascript" src="./js/trolley.js"></script>
	</head>
	<body onload="calculate()">

	<!-- start header -->
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.html" target="_self"><div class="logo fl"></div></a>
			
			<div class="wdgwc fl ml40">我的购物车</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
				<ul>
					<%
								String username = (String)session.getAttribute("username");
								if (username == null)
								{
									out.println("<li><a href='./login.jsp' target='_blank'>登录</a></li>");
									out.println("<li>|</li>");
									out.println("<li><a href='./register.jsp' target='_blank' >注册</a></li>");
								}
								else
								{
									out.println("<li>欢迎您</li>");
									out.println("<li>，</li>");
									out.println("<li>" + username + "</li>");
								}
							%>
				</ul>
				
			</div>
			<div class="clear"></div>
		</div>
		<div class="xiantiao"></div>
	
	
		<div class="gwcxqbj" style="overflow:auto;">
			<div class="gwcxd center">
				<div class="top2 center">
					<div class="sub_top fl">
						<input type="checkbox" value="quanxuan" class="quanxuan" id="sAll" onclick="selectAll()"/>全选
					</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
			<form action="CartServlet" method="post">
			<input type="hidden" id="operate" name = "operate" value= "chuandaohoutai"/>
			<%
			List<Cart> listcart=(List<Cart>)request.getAttribute("carts");
			List<Good_version> listGv =(List<Good_version>)request.getAttribute("goodversion");
	  	    List<Goods> listG =(List<Goods>)request.getAttribute("good");
	  	    
		  	List<String> Good_id=new ArrayList<String>();
		  	List<Integer> num=new ArrayList<Integer>();
			List<String> C_id=new ArrayList<String>();
			for(int i=0;i<listGv.size();i++)
			{
				Good_id.add(listG.get(i).getId());
				C_id.add(listcart.get(i).getCid());
			%>
				<div class="content2 center" style="overflow:auto;">
					<div class="sub_content fl ">
						<input type="checkbox" name="checkId" value=<%=listcart.get(i).getCid()%> class="quanxuan" onclick="changeState()"/>
					</div>
					<div class="sub_content fl"><img src=<%=listG.get(i).getImage()%> width=80px height=80px></div>
					<div class="sub_content fl ft20"><%=listGv.get(i).getVersion()%></div>
					<div class="sub_content fl "><p class="priceshow" ><%=listGv.get(i).getPrice()%></p></div>
					<div class="sub_content fl">
						<input class="shuliang" type="number" id="num" name="num" value="1" step="1" min="1" max="10" onchange="calculate(this.value)">
					</div>
					<div class="sub_content fl"><p class="tprice_show">1</p></div>
					<div class="sub_content fl"><a href="CartServlet?operate=cancelCart&cid=<%=listcart.get(i).getCid()%>">×</a></div>
					<div class="clear"></div>
				</div>
				 <%}

				 session.setAttribute("Good_id",Good_id);
				 session.setAttribute("C_id",C_id);
				 %>
			</div>
			
			
		</div>
		<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li><a href="GoodServlet?operate=showgood">继续购物</a></li>
						<li>|</li>
						<li>共<span id="count">0</span>件商品，已选择<span id="selected">0</span>件</li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl" id="total">合计（不含运费）：<span id="sumprice">0</span>元</div>
					<div class="jsanniu fr"><input class="jsan" type="submit" id="submit" name="jiesuan"  value="去结算" disabled="disabled"/></div>

					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
</form>	
	<!-- footer -->
	<footer class="center">
			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>

	</body>
</html>
