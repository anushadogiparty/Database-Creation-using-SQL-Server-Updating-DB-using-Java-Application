//STEP 1. Import required packages
import java.sql.*;

public class Paper_Reviews {
	
	
	//JDBC Driver Name and Database URL
		
   static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/Paper_Reviews?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "root";
   
   public Connection conn;
   
   public void connect() {
		try {
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			System.out.println("Connected to the database...");
		 }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }
	}
   
   public void disconnect() {
	   try {
			conn.close();
			System.out.println("Database Connection Closed.");
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
   
   
   public void getPapersSubmitted_AuthorID() {
		Statement stmt = null;
		
		try {
			System.out.println("\n----------------Query 1-------------------------");
			System.out.println("QUERY 1: Below are the results of the Submitted paper's details by author's primary key");
			
			stmt = conn.createStatement();
			String sql1 = "SELECT Author_id, Paper_id, Title, Abstract, Author.Email, Author.FirstName, Author.LastName FROM PAPER INNER JOIN AUTHOR ON Author_id = id ORDER BY Paper_id ASC";
		      ResultSet rs = stmt.executeQuery(sql1);
		      
				while (rs.next()) {
					 int Author_id = rs.getInt("Author_id");
					 int Paper_id  = rs.getInt("Paper_id");
			         String Title = rs.getString("Title");
			         String Abstract = rs.getString("Abstract");
			         String firstname = rs.getString("Author.FirstName");
			         String lastname = rs.getString("Author.LastName");
			         String email = rs.getString("Author.Email");
			         
			         //Display values for query1
			         System.out.print("\n Author_ID: "+ Author_id + ", Paper_ID: " + Paper_id + ", Paper_Title:"+Title+", Paper_Abstract: " + Abstract + ", Author_Firstname: " + firstname + ", Author_Lastname: " + lastname + ", Author_emailID: " + email + "\n");
					 
				}
				System.out.println("\n----------------Query 1-------------------------");
				 rs.close();
			      //rs1.close();
			      stmt.close();
			      
			      
			   }catch(SQLException se){
			      //Handle errors for JDBC
			      se.printStackTrace();
			   }catch(Exception e){
			      //Handle errors for Class.forName
			      e.printStackTrace();
			   }finally{
			      //finally block used to close resources
			      try{
			         if(stmt!=null)
			            stmt.close();
			      }catch(SQLException se2){
			      }// nothing we can do
			      
			   }//end try
   
   			}
   
   
   public void getAllReviewsForPapersSubmitted() {
		Statement stmt = null;
		
		try {
			System.out.println("\n----------------Query 2-------------------------");
			System.out.println("QUERY 2: Below are the results for the Reviews of the recommended papers that are been Submitted. ");
			
			stmt = conn.createStatement();
			
			String sql2 = "SELECT Review_id, Recommendation, MeritScore, PAPERID, ReadabilityScore, Reviewer_id, OriginalityScore, RelevanceScore "
					+ "FROM REVIEW "
					+ "INNER JOIN PAPER ON PAPER.Paper_id = REVIEW.PAPERID "
					+ "WHERE Recommendation IN ('Highly Recommended', 'Recommended')"
					+ "ORDER BY Review_id ASC ";
		      ResultSet rs = stmt.executeQuery(sql2);

				while (rs.next()) {

					 int Review_id  = rs.getInt("Review_id");
			         String Recommendation = rs.getString("Recommendation");
			         int MeritScore  = rs.getInt("MeritScore");
			         int Paper_id  = rs.getInt("PAPERID");
			         int ReadabilityScore  = rs.getInt("ReadabilityScore");
			         int Reviewer_id = rs.getInt("Reviewer_id");
			         int OriginalityScore  = rs.getInt("OriginalityScore");
			         int RelevanceScore  = rs.getInt("RelevanceScore");
			         
			         //Display values for query2
			         System.out.print("\n Review ID: " + Review_id + ", Recommendation: "+Recommendation+", Merit Score: " + MeritScore + ", Paper ID: " + Paper_id + ", Readability Score: " + ReadabilityScore + ", Reviewer ID: " + Reviewer_id + ", Originality Score: "+ OriginalityScore +", Relevance Score: "+ RelevanceScore +" \n");

				}
				System.out.println("\n----------------Query 2-------------------------");
				 rs.close();
			      //rs1.close();
			      stmt.close();
			      
			      
			   }catch(SQLException se){
			      //Handle errors for JDBC
			      se.printStackTrace();
			   }catch(Exception e){
			      //Handle errors for Class.forName
			      e.printStackTrace();
			   }finally{
			      //finally block used to close resources
			      try{
			         if(stmt!=null)
			            stmt.close();
			      }catch(SQLException se2){
			      }// nothing we can do
			      
			   }//end try
  
  			}

   
   public void getCountOfPapersSubmitted() {
		Statement stmt = null;
		
		try {
			System.out.println("\n----------------Query 3-------------------------");
			System.out.println("QUERY 3: Below are the results of the total number of Papers that are Submitted. ");
			
			stmt = conn.createStatement();
			
			String sql3 = "SELECT COUNT(*) FROM Paper";
			ResultSet rs = stmt.executeQuery(sql3);

				while (rs.next()) {

			         //Display values for query3
			         System.out.print("\nTotal Number of Papers Submitted : " + rs.getString(1));
				}
				System.out.println("\n----------------Query 3-------------------------");
				 rs.close();
			      //rs1.close();
			      stmt.close();
			      
			      
			   }catch(SQLException se){
			      //Handle errors for JDBC
			      se.printStackTrace();
			   }catch(Exception e){
			      //Handle errors for Class.forName
			      e.printStackTrace();
			   }finally{
			      //finally block used to close resources
			      try{
			         if(stmt!=null)
			            stmt.close();
			      }catch(SQLException se2){
			      }// nothing we can do
			      
			   }//end try
 
 			}
   
   public void CreateNew_Author_Paper(String ID,String Title, String Abstract, String FileName, String Author_id, String FirstName, String LastName, String Email) {
		Statement stmt = null;
		Statement stmt1 = null;
		PreparedStatement Paper_Statement = null;
		PreparedStatement Author_Statement = null;
		
		try {
			System.out.println("\n----------------Query 4-------------------------");
			
			stmt = conn.createStatement();
			
			//Inserting New Author record
			String NewAuthor = "INSERT INTO author(ID, FirstName, LastName, Email) VALUES (?, ?, ?, ?)";
			
			Author_Statement = conn.prepareStatement(NewAuthor, Statement.RETURN_GENERATED_KEYS);
			Author_Statement.setString(1, ID);
			Author_Statement.setString(2, FirstName);
			Author_Statement.setString(3, LastName);
			Author_Statement.setString(4, Email);
			
			int rowsInserted1 = Author_Statement.executeUpdate();
			
			
			if(rowsInserted1 > 0) {
				System.out.println("\nA new Author record in Author table created successfully.");
				
			} else {
				System.out.println("\nA new Author record is not created successfully.");
			}
			
			
			//Display number of Author records after new author record is inserted
			
			
			String After = "SELECT COUNT(*) FROM Author";
		    ResultSet result_After = stmt.executeQuery(After);
		     
		    while (result_After.next()) {
		    System.out.print("\nTotal Number of Author records after insertion : " + result_After.getString(1)); }
		

			//Inserting New Paper record
				int count =0;
			
				String NewPaper = "INSERT INTO Paper (Author_id, Title, Abstract, FileName) VALUES (?,?, ?,?)";
				
				Paper_Statement = conn.prepareStatement(NewPaper, Statement.RETURN_GENERATED_KEYS);
				Paper_Statement.setString(1, Author_id);
				Paper_Statement.setString(2, Title);
				Paper_Statement.setString(3, Abstract);
				Paper_Statement.setString(4, FileName);
			
				int rowsInserted = Paper_Statement.executeUpdate();
				
				if(rowsInserted > 0) {
					System.out.println("\nA new Paper record in PAPER table created successfully.");
					
				} else {
					System.out.println("\nA new Paper record is not created successfully.");
				}
				
				try (ResultSet rs = Paper_Statement.getGeneratedKeys()){
					if(rs.next()) {
						count = rs.getInt(1);
					} else {
						throw new SQLException("Paper not created.");
					}
				}
				
				//Display number of Author records after new author record is inserted
				
				
				String After1 = "SELECT COUNT(*) FROM Paper";
			    ResultSet result_After1 = stmt.executeQuery(After1);
			     
			    while (result_After1.next()) {
			    System.out.print("\nTotal Number of Paper records after insertion : " + result_After1.getString(1)); }

				System.out.println("\n----------------Query 4-------------------------");
			   
				stmt.close();
			      
			      
			   }catch(SQLException se){
			      //Handle errors for JDBC
			      se.printStackTrace();
			   }catch(Exception e){
			      //Handle errors for Class.forName
			      e.printStackTrace();
			   }finally{
			      //finally block used to close resources
			      try{
			         if(stmt!=null)
			            stmt.close();
			      }catch(SQLException se2){
			      }// nothing we can do
			      
			   }//end try

			}
   
   public void DeleteAuthorRecord() {
		PreparedStatement stmt = null;
		
		try {
			
			System.out.println("\n----------------Query 5-------------------------");
			System.out.println("QUERY 5: Deleting the author rescord with Author_ID as 1. ");
			
			String sql5 = "DELETE FROM AUTHOR"
					+ " WHERE ID = 1";
			
			stmt = conn.prepareStatement(sql5);
			int rows_deleted = stmt.executeUpdate();
			
			if (rows_deleted  == 1) {
				System.out.println("Author deleted successfully.");
			} else { 
				System.out.println("Author cannot be deleted.");
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error Message: " +e.getMessage()+"\n");
			System.out.println("We have defined Author_id as an foreign key in Paper table. The Author_ID we are trying to delete in Author table has a record existing in the Paper table.");
			System.out.println("\nOnce we delete child record from Paper table only then the parent record can be deleted in the Author Table");
			System.out.println("\n----------------Query 5-------------------------");
			
		}
		
		 finally{
			      //finally block used to close resources
			      try{
			         if(stmt!=null)
			            stmt.close();
			      }catch(SQLException se2){
			      }// nothing we can do
			      
			   }//end try

			}
   
   
   
	public static void main(String[] args) {

		Paper_Reviews result = new Paper_Reviews();
		
		
		result.connect();
		
		//Queries
		//Query 1
		result.getPapersSubmitted_AuthorID();
		
		//Query 2
		result.getAllReviewsForPapersSubmitted();
		
		//Query 3
		result.getCountOfPapersSubmitted();
		
		//Query 4
		result.CreateNew_Author_Paper("6","Paper1", "Paper1_Abstract", "Paper1_File name", "6", "Anu", "SHA", "gchg@hgvjh.com");
		
		//Query 5
		result.DeleteAuthorRecord();
		
		result.disconnect();
	}
	
}
 