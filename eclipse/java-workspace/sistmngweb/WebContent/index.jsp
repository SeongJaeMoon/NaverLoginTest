<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, sistmngweb.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>

<%
	request.setCharacterEncoding("UTF-8");
	StringBuilder sb = new StringBuilder();
	String contextRoute = request.getContextPath();
%>
<%
	String clientId = "";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8090/sistmngweb/Login/naverlogin.jsp", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div class="container">

		<div class="modal-content">
			<div style="text-align: center;">
				<h2 style="margin: 15px">
					회원관리<a href="index.jsp"><img
						src="<%=contextRoute%>/resources/sist_logo.png"
						alt="sist_logo.png"></a>
				</h2>
			</div>
			<div class="modal-header">
				<h2 class="modal-title">로그인</h2>
				<p>정상적인 서비스 이용을 위해서 로그인이 필요합니다.</p>
			</div>
			<div class="modal-body">
				<form action="<%=contextRoute%>/Login/login.jsp" method="post">
					<div class="form-group">
						<label for="email">아이디:</label> <input type="text"
							class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요."
							required>
					</div>
					<div class="form-group">
						<label for="pwd">비밀번호:</label> <input type="password"
							class="form-control" id="pw" name="pw"
							placeholder="비밀번호를 입력해주세요." required>
					</div>
					<div class="checkbox">
						<label><input type="checkbox">로그인 정보 기억하기</label>
					</div>

					<button type="submit" class="btn btn-default">로그인</button>
					<button class="btn btn-default">회원가입</button>
					<!-- (1) 버튼 event 처리를 위하여 id를 지정 id=loginButton -->
					<div id="naver_id_login" style="display: inline-block;">
						<a href="<%=apiURL%>"><img height="35"
							src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
					</div>
				</form>
			</div>
		</div>
		<div class="modal-footer">
			<a href=#><span style="margin: 50px">회원 정보를 잊어버리셨습니까?</span></a>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>