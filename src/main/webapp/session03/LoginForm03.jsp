<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> Session </title>
</head>
<body>

<table border="1" width = "90%">
	<tr>
		<td align = "center">
		<!-- �α��� ���ο� ���� �޴� ��ȭ -->
		<% if (session.getAttribute("userId")== null) {	%>
			<a href = "../session03/LoginForm03.jsp"> �α��� </a>
		<% }else { %>
			<a href = "../session03/Logout03.jsp"> �α׾ƿ� </a>
		<% } %>
		</td>
	</tr>
</table>

<h2> �α��� ������ </h2>

<span style = "color:red ; font-size:1.2em ;">
	<!-- �α��� ���� �޼��� ��� -->
	<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")
	
	%>
</span>

<%
	if (session.getAttribute("userId")== null) {	// �α׾ƿ� �����϶�
%>
	<!-- �α׾ƿ� �����϶� HTML ó�� �κ� -->
	
	<script>		
		function validateForm (form) {
			if (!form.user_id.value){
				alert ("���̵� �Է� ���ּ���. ");
				return false;
			}
			if (form.user_pw.value == ""){
				alert ("�н����带 �Է� ���ּ���. ");
				return false;
			}
		}
	</script>
	<form action ="LoginProcess03.jsp" method = "post" name = "LoginFrm"
		 onsubmit = "return validateForm(this);">
		 <p> ���̵� : <input type = "text" name = "user_id">
		 <p> �н����� : <input type = "password" name = "user_pw">
		 <p><input type = "submit" value = "�α����ϱ�">
	</form>
	
	
	
<% }else { // �α��� �����϶� %>
	<!-- �α��� �����϶� HTML ó�� �κ� -->	
	
	<% if (session.getAttribute("userGrade").equals("vip")) {	%>
			<hr align="left" style="border: solid 10px red; width: 30%;">
		<% }else if (session.getAttribute("userGrade").equals("gold")){ %>
			<hr align="left" style="border: solid 10px yellow; width: 30%;">
		<% }else if(session.getAttribute("userGrade").equals("silver")){ %>
			<hr align="left" style="border: solid 10px blue; width: 30%;">
		<% } %>
	<%= session.getAttribute("userName") %> ȸ����, �α��� �ϼ̽��ϴ�. <br>
	<a href = "Logout03.jsp"> [�α׾ƿ�] </a>
	

<% } %>
</body>
</html>