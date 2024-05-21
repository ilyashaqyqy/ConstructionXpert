package model.dao;



import java.sql.Connection;
import java.sql.DriverManager;

public class SingletonConnection {

	 private static Connection connection;





	    static {
	        String url="jdbc:postgresql://localhost:5432/ConstructionXpert";
	        String username="postgres";
	        String password="azer1234";

	        try {
	            Class.forName("org.postgresql.Driver");

	            connection =DriverManager.getConnection(url,username,password);
               

	        } catch (Exception e) {
	            
	            e.printStackTrace();


	    }

	       
	

	    }


		public static Connection getConnection() {
			
			return connection;
		}
}

