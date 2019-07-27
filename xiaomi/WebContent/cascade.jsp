<%@ page pageEncoding="UTF-8" %>
<html>
<head>
<title></title>
<meta charset="utf-8">
<script type="text/javascript" src="./js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="./js/allregion.js"></script>
<link rel="stylesheet" type="text/css" href="./css/green.css">
<script type="text/javascript">

        $(document).ready(function(){
//              操作DOM，加载数据到下拉列表 foreach
//            $(selector).each(data,function(index,element){});

            $.each(data,function(index,element){
                $("#province").append("<option value="+index+">"+element.name+"</option>");
            });

//              点击不同的省，加载市
            $("#province").bind("change",function(){
//                      得到被点击的值
                var province = $(this).val();
                var add=$(this).find("option:selected").text();
//                  加载被点击的省的数据
                var city = data[province].childlist;
//              重新选择的时候，需要清空加载出来的市、区列表
                $("#city").empty();
                $("#distinct").empty();
                $("#countryside").empty();
                $("#city").append("<option>请选择</option>");
                $.each(city,function(index,element){
                    $("#city").append("<option value="+index+">"+element.name+"</option>");
                });
            });
//              点击不同的市，加载区
            $("#city").bind("change",function(){
                var province = $("#province").val();
                var city = $(this).val();

                var distinct = data[province].childlist[city].childlist;
                $("#distinct").empty();
                $("#countryside").empty();
                $("#distinct").append("<option>请选择</option>");
                $.each(distinct,function (index,element) {
                    $("#distinct").append("<option value="+index+">"+element.name+"</option>");
                });
            });
            $("#distinct").bind("change",function(){
                var province = $("#province").val();
                var city=$("#city").val();
                var distinct = $(this).val();
                var countryside=data[province].childlist[city].childlist[distinct].childlist;
                $("#countryside").empty();

                $("#countryside").append("<option>请选择</option>");
                $.each(countryside,function (index,element) {
                    $("#countryside").append("<option value="+index+">"+element.name+"</option>");
                });
            });
        });
        function tijiao() {
            var prolist=document.getElementById("province");
            var index = prolist.selectedIndex; // 选中索引
            var pro=prolist.options[index].text;
            var citylist=document.getElementById("city");
            var index = citylist.selectedIndex; // 选中索引
            var city=citylist.options[index].text;
            var dislist=document.getElementById("distinct");
            var index = dislist.selectedIndex; // 选中索引
            var distinct=dislist.options[index].text;
            var countrysidelist=document.getElementById("countryside");
            var index = countrysidelist.selectedIndex; // 选中索引
            var countryside=countrysidelist.options[index].text;
            $.ajax(
                {
                    url:"AddressServlet",
                    type:"post",
                    dataType:"json",
                    data:{
                    	"operate":"addAddress",
                        "province":pro,
                        "city":city,
                        "distinct":distinct,
                        "countryside":countryside,
                        "name":document.getElementById("name").value,
                        "contact":document.getElementById("phone").value,
                        "default":document.getElementById("state").checked,
                        "add_type":$("input[name='add']:checked").val()
                    },
                    success:function () {
                        alert("操作成功！");
                        window.close();
                    },
                    error:function () {
                        alert("操作成功！");
                        window.close();
                        window.location.href="AddressServlet?operate=findAddressByUserId";
                    }
                }
            );
        }
    </script>
</head>
<body>
	<form action="AddressServlet" method="post" class="smart-green">
		<h1>添加收货信息</h1>
			<input type="hidden" name="operate" value="addAddress" />
            <input id="name" type="text" name="name" placeholder="请输入收货人姓名"/>
            <input id="phone" type="text" name="contact" placeholder="请输入收货人电话"/> 
    
        	<label><span>省</span><select id="province" name="province" required="required"><option required=>请选择</option></select></label>
        	<label><span>市</span><select id="city"  name="city" required="required"></select></label>
        	<label><span>区</span><select id="distinct" name="distinct" required="required"></select> </label>
			<label><span>街道/乡镇</span><select id="countryside"  name="street"></select> </label>

        	<label><span>默认地址&nbsp;&nbsp;<input id="state" type="checkbox" name="default"></span></label><br><br>
        	
     		<label><span>地址类型</span></label>
			<label><span>&nbsp;&nbsp;
				<input type="radio" name="add" value="家" checked>家
    			<input type="radio" name="add" value="学校">学校
    			<input type="radio" name="add" value="单位">单位
    		</span></label>
			
    		<br><br><br><br>
       		<input type="button" class="button" value="确认添加" onclick="tijiao()"/>
	</form>
</body>
</html>