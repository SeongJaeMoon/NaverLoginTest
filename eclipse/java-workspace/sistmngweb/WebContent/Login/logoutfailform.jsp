<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	StringBuilder sb = new StringBuilder();
 	String contextRoute = request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
	<div class="container">

		<div class="modal-dialog">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="<%=contextRoute%>/index.jsp"><img src="<%=contextRoute%>/resources/sist_logo.png"
					alt="sist_logo.png"></a> 회원관리 <small>v1.0</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> 로그인
					</h4>
					<label>로그인에 성공하지 못했습니다.</label>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<div class="form-group"></div>
					<a href="<%=contextRoute%>/index.jsp" class="btn btn-default btn-block">Main</a>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>

	</div>
</body>
</html>