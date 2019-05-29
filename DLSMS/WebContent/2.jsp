<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
Hello,${user.id }<br/>
Hello,${user.name }<br/>
Hello,${user.password }<br/>

<form action="login" method="post" >
	name:<input type="text" name="name" size="15"/><br/>
	pasw:<input type="password" name="password" size="15"/><br/>
	<input type="submit" value="提交">
	
</form>

</body>
</html>