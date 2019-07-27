<%@ page language="java" import="java.util.*,com.xiaomi.dao.vo.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>搜索结果列表</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>
	<body>
<%
	List<Goods> phone=(List<Goods>)request.getAttribute("selectGoodsByName");
	System.out.println("phone"+phone);
	Iterator itp = null;
	if(phone!=null){
		itp=phone.iterator();
	}
%>
		<div class="danpin center">
			<div class="biaoti center">搜索结果</div>
			<div class="main center">
			<table>
			<%while(itp.hasNext()){
				Goods g=(Goods)itp.next();%>
			<tr>
				<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<div class="sub_mingxing"><a href="GoodServlet?operate=xiangqing&goodId=<%=g.getId()%>" target="_blank"><img src="<%=g.getImage() %>" alt=""></a></div>
					<div class="pinpai"><a href="GoodServlet?operate=xiangqing&goodId=<%=g.getId()%>" target="_blank"><%=g.getName() %></a></div>
				</div>
				</tr>
				<%} %>
			</table>
				<div class="clear"></div>
			</div>
			</div>
			

	</body>
</html>