<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, sistmngweb.*"%>
<%
	//session 내장 객체를 이용한 로그인 인증 확인
	Object sess = session.getAttribute("loginInfo");
	Object naverSess = session.getAttribute("naverInfo");
	if (sess == null && naverSess == null) {
		//로그인 하지 않은 사용자 접근 상태
		//->접근 차단(강제 페이지 전환)
		response.sendRedirect("accessdenied.jsp");
	}
%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	StringBuilder sb = new StringBuilder();
	String contextRoute = request.getContextPath();
	
	//로그인 사용자 개인정보 확인
	String id = "";
	String name_ = "";
	String admin = "";
	
	//GET방식 getParameter 오류 수정 필요.
	//String admin = request.getParameter("role");
	//System.out.println(admin);
	//if(admin == null){
	//	admin = "";
	//}else {
	//	if(admin.equals("1")){
	//		admin = "관리자로 로그인";	
	//	}
	//}
	
	String logoutAtag = ""; //로그아웃 a태그에 들어갈 경로
	if (sess != null && sess instanceof Login) {
		Login loginInfo = (Login) sess;
		id = loginInfo.getId();
		name_ = loginInfo.getUsers().getName_();
		logoutAtag = contextRoute+"/Login/Logout.jsp";
	}
	if (naverSess != null && naverSess instanceof NaverResponse){
		NaverResponse naverResponse = (NaverResponse) naverSess;
		id = naverResponse.getEmail();
		name_ = naverResponse.getNickname();
		uniqueAdmin = (String)naverResponse.getId();
		logoutAtag = "https://nid.naver.com/nidlogin.logout";
		if(uniqueAdmin.equals("/*admin unique value*/"){
		admin = "관리자로 로그인 중입니다."
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>


<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="adminbooklist.jsp"><img
					src="<%=contextRoute%>/resources/sist_logo.png" alt="sist_logo.png"></a>
				회원관리 <small>v1.0</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="<%=contextRoute%>/Login/success.jsp">회원 관리</a></li>
					<li><a href="<%=logoutAtag%>">[<%=name_%>/<%=id%>/<%=admin%>]로그
							아웃
					</a></li>
				</ul>
			</div>
		</nav>


		<div class="panel panel-default" id="output">
			<div class="panel-heading">방명록 글목록</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>글쓴이</th>
							<th>글내용</th>
							<th>작성일</th>
							<th>Client IP</th>
							<th>Blind</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>

				<form class="form-inline" method="post">
					<div class="form-group">
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge">0</span>
						</button>
						<button type="button" class="btn btn-default">
							Count <span class="badge">0</span>
						</button>
						<button type="button" class="btn btn-default">
							BlindCount <span class="badge">0</span>
						</button>
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-step-backward"></span> Previous
						</button>
						<button type="button" class="btn btn-default">
							Next <span class="glyphicon glyphicon-step-forward"></span>
						</button>

						<!-- 검색 기준 선택 항목 추가 -->
						<select class="form-control" id="key" name="key">
							<option value="name_">Name</option>
							<option value="content">Content</option>
							<option value="regDate">RegDate</option>
						</select>

					</div>
					<div class="input-group">
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search">

						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
