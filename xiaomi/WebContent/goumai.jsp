<%@ page language="java" import="java.util.*,com.xiaomi.dao.vo.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>确认选购</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>
	<body>
	<%
	String version=request.getParameter("aa");
	System.out.println("薛硕");
	System.out.println(version);
	String price="";
	String ve="";
	String url="";
	System.out.println(version);
	if(version!=null){
		price=version.split("  ")[1];
		ve=version.split("  ")[0];
		String Good_id=version.split("  ")[2];
		url=version.split("  ")[4];
		List listimage=new ArrayList();
		listimage.add(url);
		List listVersion=new ArrayList();
		listVersion.add(ve);
		List listPrice=new ArrayList();
		listPrice.add(price);
		List listGood_id=new ArrayList();
		listGood_id.add(Good_id);
		List listNum=new ArrayList();
		listNum.add("1");
		session.setAttribute("version", listVersion);
		session.setAttribute("price", listPrice);
		session.setAttribute("Good_id", listGood_id);
		session.setAttribute("num", listNum);
		session.setAttribute("image",listimage);
		
	}else{
		version="";
		price="";
	}
	
	
	 %>
	<!-- start header -->
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
			
			<div class="wdgwc fl ml40">确认选购</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
				
			</div>
			<div class="clear"></div>
		</div>
		<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center" style="margin-left:300px;">
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl" style="padding-left:150px;">单价</div>
					<div class="sub_top fl">小计</div>
					<div class="clear"></div>
				</div>
				<table>
				<tr>
				<div class="content2 center">
					<div class="sub_content fl ">
						
					</div>
					<div class="sub_content fl" style="padding-left:30px; padding-top:20px;"><img width="80" height="80" src=<%=url %>></div>
					<div class="sub_content fl ft20" style="padding-left:30px;"><%=ve %></div>
					<div class="sub_content fl " style="padding-right:10px;"><%=price %></div>
					<div class="sub_content fl" style="padding-left:240px;"><%=price %></div>
					
				</div>
				</tr>
				</table>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="jiesuan fr">
				<form action="jiesuan.jsp" method="get">
					<%session.setAttribute("sumPrice", price); %>/>
					<div class="jiesuanjiage fl">合计（不含运费）：<span><%=price %>元 </span></div>
					<div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="去结算" /></div>
					<div class="clear"></div>
				</form>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>

  

	
	<!-- footer -->
	<footer class="center">
			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>

	</body>
</html>
