<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sistmngweb.* ,java.util.*"%>

<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoute = request.getContextPath();
	StringBuilder sb = new StringBuilder();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	Login l = new Login.LoginBuilder().
			setId(id).
			setPw(pw).
			build();

	//로그인 인증 여부 액션 추가

	LoginDAO dao = new LoginDAO();
	try {
		List<Login> ret = dao.select(l);

		if (ret == null || ret.size() == 0) {
			//로그인 실패
			response.sendRedirect(contextRoute + "/Login/loginfailform.jsp");
		} else {
			//로그인 성공
			//->로그인 사용자의 개인정보(Login 자료형의 객체)를 session객체에 저장
			session.setAttribute("loginInfo", ret.get(0));
			response.sendRedirect(contextRoute + "/success.jsp");
		}
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>
