// Assignment 8
// Database Connectivity
// Commands to run on terminal
// javac assignment8.java
// java assignment8 -classpath mysql-connector-java-8.0.26.jar
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class assignment8{
    public static void main(String[] args) {
        Connection conn1 = null;
        try {
            String url = "jdbc:mysql://localhost:3306/Assignment7";
            String user = "root";
            String password = "password";
            conn1 = DriverManager.getConnection(url, user, password);
            if(conn1 != null){
                System.out.println("Connected..");
            }
            Scanner reader = new Scanner(System.in);
            
            while(true){
                System.out.println("1>Read Table");
                System.out.println("2>Insert Entry");
                System.out.println("3>Update Entry");
                System.out.println("4>Delete Entry");
                System.out.println("5>Exit");
                System.out.println("Enter choice: ");
                int input = reader.nextInt();
                if(input == 5){
                    reader.close();
                    break;
                }
                else if(input == 1){
                    String query = "SELECT * FROM library";
                    Statement statement = conn1.createStatement();
                    ResultSet result = statement.executeQuery(query);
                    while(result.next()){
                        int roll = result.getInt(1);
                        String name = result.getString(2);
                        String date = result.getString(3);
                        String bookname = result.getString(4);
                        String output = "%d: %s - %s - %s";
                        System.out.println(String.format(output, roll,name,date,bookname));
                    } 
                }
                else if(input == 2){
                    String sql = "INSERT INTO library VALUES(?, ?, ?, ?)";
                    PreparedStatement statement = conn1.prepareStatement(sql);
                    java.util.Date date=new java.util.Date();
                    java.sql.Date sqlDate=new java.sql.Date(date.getTime());
                    System.out.println("Enter Roll Number, Name and Bookname:");
                    int roll = reader.nextInt();
                    reader.nextLine();
                    String person = reader.nextLine();
                    String bookname = reader.nextLine();
                    statement.setInt(1,roll);
                    statement.setString(2, person);
                    statement.setDate(3, sqlDate);
                    statement.setString(4, bookname);
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        System.out.println("A new record was inserted successfully!");
                    }

                }
                else if(input == 3){
                    String sql = "UPDATE library set bookname=?,issuedate=? where rollnum=?";
                    PreparedStatement statement = conn1.prepareStatement(sql);
                    System.out.println("Enter roll number:");
                    statement.setInt(3, reader.nextInt());
                    reader.nextLine();
                    System.out.println("Enter new bookname:");
                    statement.setString(1, reader.nextLine());
                    java.util.Date date=new java.util.Date();
                    java.sql.Date sqlDate=new java.sql.Date(date.getTime());
                    statement.setDate(2, sqlDate);
                    int rowsUpdated = statement.executeUpdate();
                    if(rowsUpdated > 0){
                        System.out.println("A record has been updated successfully.");
                    }


                }
                else if(input == 4){
                    String sql = "DELETE FROM library where rollnum=?";
                    PreparedStatement statement = conn1.prepareStatement(sql);
                    System.out.println("Enter roll number:");
                    statement.setInt(1, reader.nextInt());
                    int rowsDeleted = statement.executeUpdate();
                    if(rowsDeleted > 0){
                        System.out.println("Record Deleted");
                    }
                }
                
            }
        } catch (SQLException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        try {
            conn1.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}