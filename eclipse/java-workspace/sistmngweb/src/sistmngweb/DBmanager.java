package sistmngweb;

import java.sql.SQLException;
import java.util.*;

public class DBmanager<T>{
	
	private OnDBListener<T> onDBlistner;
	
	public void setDBlistner(OnDBListener<T> onDBlistner) {
		this.onDBlistner = onDBlistner;
	}
	
	interface OnDBListener<T>{
		List<T> select(T t) throws ClassNotFoundException, SQLException;
		int delte(String id) throws ClassNotFoundException, SQLException;
		int update(T t) throws ClassNotFoundException, SQLException;
		int insert(T t) throws ClassNotFoundException, SQLException;
	}
}
