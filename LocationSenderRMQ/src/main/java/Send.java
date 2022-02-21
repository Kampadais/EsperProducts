
import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import org.apache.commons.lang3.SerializationUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.Serializable;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import static java.lang.Thread.sleep;

public class Send {

    public static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
    public static final String DB_URL = "jdbc:mariadb://127.0.0.1/ProximiotDB";

    public static HashMap<Integer,Integer> clientIds= new HashMap<>();

    private final static String QUEUE_NAME = "input";
    public static final String USER = "root";
    public static final String PASS = "";

    public static void main(String[] argv) throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");

        clientIds.put(8,5);
        clientIds.put(9,7);
        clientIds.put(10,8);
        clientIds.put(11,9);

        try (Connection connection = factory.newConnection();
             Channel channel = connection.createChannel()) {
            channel.queueDeclare(QUEUE_NAME, false, false, false, null);


            java.sql.Connection conn = null;
            Statement stmt = null;
            try {
                Class.forName("org.mariadb.jdbc.Driver");

                System.out.println("Connecting to a selected database...");
                conn = DriverManager.getConnection(
                        DB_URL, USER, PASS);
                System.out.println("Connected database successfully...");
                stmt = conn.createStatement();


                Timestamp currentTimestamp= new Timestamp(Calendar.getInstance().getTime().getTime());
                String sql="";


                    sql = "SELECT * FROM ProximiotDB.ClientLocation ; ";//WHERE Timestamp > '"+currentTimestamp+"';";
                    System.out.println(sql);
                    ResultSet result = stmt.executeQuery(sql);
                    System.out.println(result.next());

                    ArrayList<Location> locations = new ArrayList<>();
                    while(result.next()){
                        Location tmpLoc = new Location(result.getInt("ClientLocationID"),result.getInt("SessionID"),result.getTimestamp("Timestamp"),result.getInt("Lat"),result.getInt("Lon"),result.getInt("Floor"),clientIds.get(result.getInt("SessionID")));
                        locations.add(tmpLoc);
                        AMQP.BasicProperties messageProperties = new AMQP.BasicProperties.Builder()
                                .contentType("Location")
                                .build();
                        channel.basicPublish("", QUEUE_NAME, messageProperties, tmpLoc.serialize(tmpLoc));
                        System.out.println(" [x] Sent '" + tmpLoc + "'");
                      //  sleep(200);

                    currentTimestamp= new Timestamp(Calendar.getInstance().getTime().getTime());

                }


            } catch (SQLException se) {
                //Handle errors for JDBC
                se.printStackTrace();
            } catch (Exception e) {
                //Handle errors for Class.forName
                e.printStackTrace();
            } finally {
                //finally block used to close resources
                try {
                    if (stmt != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                }// do nothing
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                    se.printStackTrace();
                }//end finally try
            }//end try




        }
    }
}