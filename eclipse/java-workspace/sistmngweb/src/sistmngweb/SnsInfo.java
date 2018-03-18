package sistmngweb;

import java.time.*;

public class SnsInfo {
	private String sns_id, sns_type, sns_name, sns_profiie;
	private LocalDate sns_connect_date;
	
	public String getSns_id() {
		return sns_id;
	}
	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}
	public String getSns_type() {
		return sns_type;
	}
	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}
	public String getSns_name() {
		return sns_name;
	}
	public void setSns_name(String sns_name) {
		this.sns_name = sns_name;
	}
	public String getSns_profiie() {
		return sns_profiie;
	}
	public void setSns_profiie(String sns_profiie) {
		this.sns_profiie = sns_profiie;
	}
	public LocalDate getSns_connect_date() {
		return sns_connect_date;
	}
	public void setSns_connect_date(LocalDate sns_connect_date) {
		this.sns_connect_date = sns_connect_date;
	}
}
