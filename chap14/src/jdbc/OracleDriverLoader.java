package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class OracleDriverLoader {
	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {
			throw new ServletException(ex);
		}
	}
}
