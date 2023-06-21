import java.util.Scanner;
import com.mongodb.*;

public class assignment12{
    public static void main(String[] args) {
        try {
            MongoClient mongo = new MongoClient("localhost",27017);
            DB db = mongo.getDB("assignment11");
            DBCollection collection = db.getCollection("order");
            Scanner reader = new Scanner(System.in);
            while(true){
                System.out.println("1>Read Values from Collection");
                System.out.println("2>Insert Document");
                System.out.println("3>Update Document");
                System.out.println("4>Delete Document");
                System.out.println("5>Exit");
                System.out.println("Enter choice: ");
                int input = reader.nextInt();
                if(input == 5){
                    reader.close();
                    break;
                }
                else if(input == 1){
                    DBCursor cursor = collection.find();
                    while (cursor.hasNext()){
                        System.out.println(cursor.next());
                    }
                }
                else if(input == 2){
                    String Customer_id,Status;
                    int Amount;
                    System.out.println("Enter customerID:");
                    Customer_id = reader.next();
                    System.out.println("Enter amount:");
                    Amount = reader.nextInt();
                    System.out.println("Enter status(P/F/D):");
                    Status = reader.next();
                    BasicDBObject doc = new BasicDBObject();
                    doc.put("Customer_id",Customer_id);
                    doc.put("Amount",Amount);
                    doc.put("Status",Status);
                    collection.insert(doc);
                    System.out.println("1 document inserted.");
                }
                else if(input == 3){
                    String Customer_id,Status;
                    int Amount;
                    System.out.println("Enter customerID:");
                    Customer_id = reader.next();
                    System.out.println("Enter amount:");
                    Amount = reader.nextInt();
                    System.out.println("Enter new status:");
                    Status = reader.next();
                    BasicDBObject whereQuery = new BasicDBObject();
                    whereQuery.put("Customer_id",Customer_id);
                    whereQuery.put("Amount",Amount);
                    BasicDBObject doc = new BasicDBObject();
                    doc.put("Customer_id",Customer_id);
                    doc.put("Amount",Amount);
                    doc.put("Status",Status);
                    BasicDBObject updateObj = new BasicDBObject();
                    updateObj.put("$set",doc);
                    try{
                        collection.update(whereQuery,updateObj);
                    }
                    catch(Exception e){
                        System.out.println("Query not found");
                    }
                }
                else if(input == 4){
                    String Customer_id;
                    int Amount;
                    System.out.println("Enter customerID:");
                    Customer_id = reader.next();
                    System.out.println("Enter amount:");
                    Amount = reader.nextInt();
                    BasicDBObject query = new BasicDBObject();
                    query.put("Customer_id",Customer_id);
                    query.put("Amount",Amount);
                    try{
                        collection.remove(query);
                    }
                    catch(Exception e){
                        System.out.println("Query not found");
                    }
                }
            }
            mongo.close();
        } catch (Exception e) {
            System.out.println("Error in connecting...");
        }

    }
}
