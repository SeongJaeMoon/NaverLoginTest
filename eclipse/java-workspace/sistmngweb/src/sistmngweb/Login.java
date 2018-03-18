package sistmngweb;

public class Login {
	private final String id, pw;
	private Users users;

	private Login(LoginBuild build) {
		this.id = build.id;
		this.pw = build.pw;
		this.users = build.users;
	}

	public static class LoginBuild {
		private final String id, pw;
		private Users users;

		public LoginBuild(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}

		public LoginBuild setUsers(Users users) {
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

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}
}
