function calculate(x) {
    var prices=document.getElementsByClassName("shuliang");
    var counts=document.getElementsByClassName("priceshow");
    var tprice=document.getElementsByClassName("tprice_show");
    var count=prices.length;
    for(var i=0;i<prices.length;i++)
    {
        tprice[i].innerHTML=prices[i].value*counts[i].innerHTML;
    }
    document.getElementById("count").innerHTML=count;
    changeState();
}

function changeState() {
    var things=document.getElementsByClassName("quanxuan");
    var tprice=document.getElementsByClassName("tprice_show");
    var total=0;
    var selected=0;
    for(var i=1;i<things.length;i++)
    {
        if(things[i].checked==true)
        {
            total=total+parseInt(tprice[i-1].innerHTML);
            selected=selected+1;
        }
    }
    if(selected>1)
    {
        document.getElementById("submit").disabled = "";
    }
    else
    {
        if(selected==0)
        {
            document.getElementById("submit").disabled = "disabled";
     
        }
        else {
            document.getElementById("submit").disabled = "";
        }
    }
    var count=things.length-1;
    if(count==selected)
    {
        document.getElementById("sAll").checked=true;
    }
    else
    {
        document.getElementById("sAll").checked=false;
    }
    document.getElementById("count").innerHTML=count;
    document.getElementById("selected").innerHTML=selected;
    document.getElementById("sumprice").innerHTML="";
    document.getElementById("sumprice").innerHTML=total;
}
function  selectAll() {
    var boxs=document.getElementsByClassName("quanxuan");
    var tprice=document.getElementsByClassName("tprice_show");
    var total=0;
    var selected=0;
    if(document.getElementById("sAll").checked)
    {
        for(var i=1;i<boxs.length;i++)
        {
            boxs[i].checked=true;
            total=total+parseInt(tprice[i-1].innerHTML);
            selected=selected+1;
        }
        document.getElementById("submit").disabled = "";
    }
    else
    {
        for(var i=1;i<boxs.length;i++)
        {
            boxs[i].checked=false;
        }
        total=0;
        selected=0;
    }
    document.getElementById("count").innerHTML=boxs.length-1;
    document.getElementById("selected").innerHTML=selected;
    document.getElementById("sumprice").innerHTML="";
    document.getElementById("sumprice").innerHTML=total;
}