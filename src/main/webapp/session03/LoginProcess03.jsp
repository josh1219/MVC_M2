<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "membership03.MemberDTO03" %>
<%@ page import = "membership03.MemberDAO03" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// form에서 넘겨주는 변수의 값 받기
	String userID = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	// DAO 객체 호출 회원정보에 대한 값을 DTO로 넘겨 받는다.
	MemberDAO03 dao = new MemberDAO03();
	MemberDTO03 dto = dao.getMemberDTO(userID, userPwd);
	dao.close();
	
	// 로그인 성공 여부에 따른 처리
	if (dto.getName() == null || dto.equals("")) {
		out.println("로그인 실패");
		request.setAttribute("LoginErrMsg", "로그인 오류 입니다. ");
		request.getRequestDispatcher("LoginForm03.jsp").forward(request, response);
		
	}else {
		out.println("로그인 성공");
		session.setAttribute("userId", dto.getId());
		session.setAttribute("userName", dto.getName());
		session.setAttribute("userGrade", dto.getGrade());
		response.sendRedirect("LoginForm03.jsp");
	}
%>





</body>
</html>