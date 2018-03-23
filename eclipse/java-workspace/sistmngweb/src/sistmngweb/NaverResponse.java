package sistmngweb;

public class NaverResponse {
	
	private String birthday, profile_image, gender, nickname, id, age, email;
	
	private NaverResponse(NaverProfileBuilder builder) {
		this.birthday = builder.birthday;
		this.profile_image = builder.profile_image;
		this.gender = builder.gender;
		this.nickname = builder.nickname;
		this.id = builder.id;
		this.age = builder.age;
		this.email = builder.email;
	}
	
	public static class NaverProfileBuilder{
		private String birthday, profile_image, gender, nickname, id, age, email;
		
		public NaverProfileBuilder birthday(String birthday) {
			this.birthday = birthday;
			return this;
		}
		
		public NaverProfileBuilder profile_image(String profile_image) {
			this.profile_image = profile_image;
			return this;
		}
		
		public NaverProfileBuilder gender(String gender) {
			this.gender = gender;
			return this;
		}
		
		public NaverProfileBuilder nickname(String nickname) {
			this.nickname = nickname;
			return this;
		}
		
		public NaverProfileBuilder id(String id) {
			this.id = id;
			return this;
		}
		
		public NaverProfileBuilder age(String age) {
			this.age = age;
			return this;
		}
		
		public NaverProfileBuilder email(String email) {
			this.email = email;
			return this;
		}
		
		public NaverResponse build() {
			return new NaverResponse(this);
		}
	}

	public String getBirthday() {
		return birthday;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public String getGender() {
		return gender;
	}

	public String getNickname() {
		return nickname;
	}

	public String getId() {
		return id;
	}

	public String getAge() {
		return age;
	}

	public String getEmail() {
		return email;
	}

	
}
