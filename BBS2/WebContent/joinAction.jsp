<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.JoinDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="newuser" scope="page" class="user.User" />
<jsp:setProperty property="*" name="newuser" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>웹사이트</title>
</head>
<body>

	<%
		//  	request.setCharacterEncoding("UTF-8");  //POST시 데이터베이스에서 한글이 깨질때 
	if (newuser.getUserID() == null || newuser.getUserPassword() == null || newuser.getUserGender() == null
			|| newuser.getUserName() == null || newuser.getUserEmail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('모든 항목을 입력하세요.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		JoinDAO joinDAO = new JoinDAO();
		int result = joinDAO.join(newuser.getUserID(), newuser.getUserPassword(), newuser.getUserPassword2(),
		newuser.getUserName(), newuser.getUserGender(), newuser.getUserEmail());
		if (result > 0) {
			session.setAttribute( "userID" , newuser.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			
		} else if (result < 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 다릅니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복된 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
	%>


</body>
</html>
