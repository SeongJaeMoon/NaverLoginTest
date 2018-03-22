package sistmngweb;

public class Login {
	private String id, pw;
	private Users users;
	private NaverResponse naver;
	
	private Login(LoginBuilder build) {
		this.id = build.id;
		this.pw = build.pw;
		this.users = build.users;
		this.naver = build.naver;
	}

	public static class LoginBuilder {
		private String id, pw;
		private Users users;
		private NaverResponse naver;
		
		public LoginBuilder setId(String id) {
			this.id = id;
			return this;
		}
		public LoginBuilder setPw(String pw) {
			this.pw = pw;
			return this;
		}
		
		public LoginBuilder setNaver(NaverResponse naver) {
			this.naver = naver;
			return this;
		}
		
		public LoginBuilder setUsers(Users users) {
			this.users = users;
			return this;
		}

		public Login build() {
			return new Login(this);
		}
	}

	public Users getUsers() {
		return users;
	}

	public NaverResponse getNaver() {
		return naver;
	}
	
	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}
}
