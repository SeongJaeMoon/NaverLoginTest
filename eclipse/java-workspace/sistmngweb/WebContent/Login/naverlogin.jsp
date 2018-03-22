<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.util.*, java.time.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.*"%>
<%@ page import="sistmngweb.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String contextRoute = request.getContextPath();
	//DB에 값이 저장되어 있는지 확인 필요
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://localhost:8090/sistmngweb/Login/naverlogin.jsp", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL += "client_id=클라이언트아이디"; //애플리케이션 클라이언트 아이디값";
	apiURL += "&client_secret=클라이언트시크릿값"; //애플리케이션 클라이언트 시크릿값";
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&code=" + code;
	apiURL += "&state=" + state;
	String access_token = "";
	String refresh_token = "";
	
	StringBuffer res = new StringBuffer();
	
	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		
		System.out.println("responseCode=" + responseCode);
		
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		int temp = 0;
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
			if (temp == 1) {
				access_token = inputLine;
				break;
			}
			++temp;
		}
		br.close();
		if (responseCode == 200) {
			//System.out.println(res.toString());
		} else {
			response.sendRedirect(contextRoute + "/Login/loginfailform.jsp");
		}
	} catch (Exception e) {
		System.out.println(e);
	}

	String str = access_token.replace("access_token", "");
	access_token = str.replace(":", "");
	str = access_token.replace("\"", "");
	access_token = str.replace(",", "");
	String token = access_token;// 네이버 로그인 접근 토큰
	String header = "Bearer " + token; // Bearer 다음에 공백 추가
	System.out.println("final header : " + header);
	try {
		apiURL = "https://openapi.naver.com/v1/nid/me";
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", header);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		String ret = ""; //json 포멧으로 만들기 위한 임시 변수 선언.

		while ((inputLine = br.readLine()) != null) {
			ret += inputLine; //json 타입 받아오기.
		}

		JSONParser jsonParser = new JSONParser();
		Map json = (Map) jsonParser.parse(ret);
		JSONObject jsonObj = (JSONObject) json.get("response");

		String birthday = (String) jsonObj.get("birthday") == null ? "" : (String) jsonObj.get("birthday");
		String profile_image = (String) jsonObj.get("profile_image") == null ? "" : (String) jsonObj.get("profile_image");
		String gender = (String) jsonObj.get("gender") == null ? "" : (String) jsonObj.get("gender");
		String nickname = (String) jsonObj.get("nickname") == null ? "" : (String) jsonObj.get("nickname");
		String id = (String) jsonObj.get("id") == null ? "" : (String) jsonObj.get("id");
		String age = (String) jsonObj.get("age") == null ? "" : (String) jsonObj.get("age");
		String email = (String) jsonObj.get("email") == null ? "" : (String) jsonObj.get("email");
		System.out.println("여기까진 된다.1");
		NaverResponse naver = new NaverResponse.NaverProfileBuilder()
				.birthday(birthday)
				.profile_image(profile_image)
				.gender(gender).nickname(nickname)
				.id(id)
				.age(age)
				.email(email)
				.build();
		System.out.println("여기까진 된다.2");
		LoginDAO dao = new LoginDAO();
		String selectRet = dao.select(id);
		int naverRet = 0;
		if (selectRet == null) {
			//DB에 데이터가 존재하지 않음.
			Login l = new Login.LoginBuilder().setNaver(naver).build();
			System.out.println("여기까진 된다.3");
			naverRet = dao.insert(l);
		}
		//DB에 데이터가 존재함.
		session.setAttribute("naverInfo", naver);
		String admin = "";
		if (selectRet.equals("51363689")) {
			admin = "1";
		}
		response.sendRedirect(contextRoute + "/success.jsp?naver=" + naverRet + "&role?=" + admin);

	} catch (Exception e) {
		System.out.println(e);
	}
%>