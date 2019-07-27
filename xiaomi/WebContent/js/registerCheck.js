function validatemobile(mobile)
{
    if(mobile.length!=11)
    {
        document.getElementById("mobile").innerHTML="长度需为11位";
        document.getElementById("mobile").style.color = "red";
        document.getElementById("tel").value="";
    }
    var re= /^(1[356789][0-9]{9})$/
    if(!re.test(mobile))
    {
        document.getElementById("tel").value="";
        document.getElementById("mobile").style.color = "red";
        document.getElementById("mobile").innerHTML="非法的手机号码！";
    }
    else
    {
        document.getElementById("tel").innerHTML=mobile;
        document.getElementById("mobile").innerHTML="√";
        document.getElementById("mobile").style.color = "green";
    }
}
function check(){
    var pw=document.getElementById("pwd").value;
    var repw=document.getElementById("rpwd").value;
    if(pw!=repw)
    {
        document.getElementById("pwd").value="";
        document.getElementById("rpwd").value="";
        document.getElementById("repass").style.color = "red";
        document.getElementById("repass").innerHTML="两次密码不一致";
    }
    else {
        document.getElementById("repass").innerHTML="√";
        document.getElementById("repass").style.color = "green";
    }
}
function checklen(pass) {
    var re =  /[a-zA-Z](?=.*?[1-9].*?)[a-zA-Z1-9]+|[1-9](?=.*?[a-zA-Z].*?)[a-zA-Z1-9]+/g;
    if(pass.length<6)
    {
        document.getElementById("pass").innerHTML="长度至少为6位";
        document.getElementById("pass").style.color = "red";
        document.getElementById("pwd").value="";
    }
    else if(!re.test(pass))
    {
        document.getElementById("pass").innerHTML="需包含数字和字母";
        document.getElementById("pass").style.color = "red";
        document.getElementById("pwd").value="";
    }
    else{
        document.getElementById("pass").innerHTML="√";
        document.getElementById("pass").style.color = "green";
    }
}
//验证只能是字母和数字
function checkname(name){
    var re=/^[a-zA-Z0-9_-]{4,16}$/;
    if(!re.test(name))
    {
        document.getElementById("name").innerHTML="只能由数字、字母、下划线组成，长度为4-16位";
        document.getElementById("name").style.color = "red";
        document.getElementById("username").value="";
    }
    else
    {
        document.getElementById("name").innerHTML="√";
        document.getElementById("name").style.color = "green";
    }
}
