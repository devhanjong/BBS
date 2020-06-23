<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>웹사이트</title>
</head>
<body>

	<%
		//세션종료
		session.invalidate();
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그아웃하였습니다.')");
		script.println("location.href = \"main.jsp\"");
		script.println("</script>");
		
	%>


</body>
</html>
