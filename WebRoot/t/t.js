    
    var x;
    function get()
    {
    	var username=login.username.value;
    	if(username=="")
    	{
    		alert("请输入用户名！");
    		return ;
    	}
    	if(window.XMLHttpRequest)
        {
    	    x=new XMLHttpRequest();
    	}
    	else
        {
    		x=new ActiveXObject("Microsoft.XMLHTTP");
        }
    	x.open("GET","FindPassword?username="+username,true);
    	x.onreadystatechange=update;
    	x.send();
    }
    function update()
    {
    	if(x.readyState==4 && x.status==200)
    	{
    		if(x.responseText=="1")   
    		{
    			alert("密码已发送至邮箱！");	
    		}
    		else if(x.responseText=="error")   
    		{
    			alert("用户名错误！");	
    		}
    	}
    }
    
	