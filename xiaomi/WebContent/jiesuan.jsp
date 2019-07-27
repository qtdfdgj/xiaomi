<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,com.xiaomi.dao.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>下单</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
 <style>
    .a{
        background-color: antiquewhite;
        height: 60px;
    }
    .img{
        margin-top: 15px;
        margin-left: 80px;
        }
        .ziti{
            padding-left: 10px;
            margin-bottom: 5px;
            margin-top: 5px;
            margin-left:20px;
            font-size: 20px;
            line-height: 40px;
        }
        .a2{
            height:100px;
            background-color: #CCCCCC;
        }

     .jrgwc {
        height: 50px;
        width: 200px;
        border: none;
        background: #ff6700;
        color: #fff;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        margin-right: 40px;
         margin-top: 30px;
    }
    .jiesuandan .jiesuan {
    float:left;
    margin-left:600px;
    width: 500px;
    height: 50px;
    line-height: 50px;
    font-size: 14px;
    color: #ff6700;
}

    </style>
    <script type="text/javascript">
    function confirmAddress(){
    	var a=document.getElementById("url");
    	var name=document.getElementById("name").innerText;
    	if(name==""){
    		a.href="";
    	}
    }
    
    
    </script>

</head>

<body>
<%
List<String> version=(List<String>)session.getAttribute("version");
List<String> price=(List<String>)session.getAttribute("price");
List<String> g_id=(List<String>)session.getAttribute("Good_id");
List<String> image=(List<String>)session.getAttribute("image");
String sumPrice=(String)session.getAttribute("sumPrice");
System.out.println("sum"+sumPrice);
String u_id=(String)session.getAttribute("uid");
List<String> num=(List<String>)session.getAttribute("num");
Iterator itV=version.iterator();
Iterator itP=price.iterator();
Iterator itN=num.iterator();
Iterator itI=image.iterator();



Address address=(Address)session.getAttribute("defaultAddr");
String name="";
String phone="";
String myAddress="";
if(address!=null){
	String mphone=address.getPhone();
	if(mphone==null){
		mphone="";
	}
	String tel=address.getTel();
	if(tel==null){
		tel="";
	}
	name=address.getName();
	myAddress=address.getAddress(); 
	phone=mphone + tel;
}


List<Order> list=new ArrayList<Order>();
for(int i=0;i<version.size();i++){
	int num1=Integer.parseInt(num.get(i));
	float price1 = Float.parseFloat(price.get(i));
	Order o=new Order(u_id,g_id.get(i),price1,num1,name,phone,myAddress);
	list.add(o);
}


request.getSession().setAttribute("allOrderList", list);

%>
<div class="banner_x center">
			<a href="./index.html" target="_self"><div class="logo fl"></div></a>
			
			<div class="wdgwc fl ml40"></div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
				
			</div>
			<div class="clear"></div>
		</div>
<div class="xiantiao"></div>
<div class="a">
    <img src="./image/area.jpg" height="30" width="30" class="img"/>
    <span class="ziti" id="name"><%=name %></span>
    <span class="ziti" id=phone><%=phone %></span>
    <span style="margin-left: 200px;"></span>
    <span class="ziti" id="address"><%=myAddress %></span>
    <a href="AddressServlet?operate=findAddressByUserId&flag=genghuan"><span class="ziti" style="margin-left: 300px;">更换地址</span></a>
</div>

<table>
<div style="text-align: center"><span class="ziti">商品</span> <span style="margin-left: 200px;"></span><span class="ziti">商品信息</span><span style="margin-left: 200px;"></span><span class="ziti">价格</span><span style="margin-left: 200px;"></span><span class="ziti">数量</span></div>

<%while(itV.hasNext()&&itP.hasNext()&&itV.hasNext()&&itI.hasNext()){ %>
<tr>
<div class="a2">
    <div style="padding-top: 20px;margin-left: 200px; width: 250px; float:left;">
        <img style="padding-left:30px;" src="<%=itI.next() %>" width="50" height="50"/>
    </div>
    <div style="padding-top: 20px;width: 310px; float:left;">
        <span class="ziti" style="padding-left:0px;"><%=itV.next() %></span>
    </div>
    <div style="padding-top: 20px;width: 250px; float:left;">
        <span class="ziti" style="padding-left:0px;"><%=itP.next() %></span>
    </div>
    <div style="padding-top: 20px;width: 250px; float:left;">
        <span class="ziti" style="padding-left:40px;"><%=itN.next() %></span>
    </div>
  </div>
</tr>
<%} %>
</table>
<div class="jiesuan fr">
					<div class="jiesuanjiage fl" id="total">合计（不含运费）：<span id="sumprice"><%=sumPrice %></span>元</div>
					<div class="clear"></div>
				</div>
			

<div class="jrgwc" style="margin-left: 1100px;"><span style=" line-height: 40px;   padding-left: 80px"><a id="url" href="OrderServlet?operate=create_order" onclick="confirmAddress()">下单</a></span></div>
<div class="clear"></div>
</body>
</html>