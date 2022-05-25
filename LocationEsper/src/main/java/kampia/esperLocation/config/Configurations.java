package kampia.esperLocation.config;

public class Configurations {


    public static boolean Local=true;

    public static String RabbitMQHost ="localhost";
    public static String Reading_Queue_RabbitMQ ="input";
    public static String Output_Queue_RabbitMQ="Notification_queue";

    public static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
    public static final String DB_URL_Prox = "jdbc:mariadb://127.0.0.1/ProximiotDB";
    public static final String DB_URL_CMS="jdbc:mariadb://127.0.0.1/CMS";
    public static final String USER = "root";
    public static final String PASS = "";

    public static final String APIUsername="cms_test";
    public static final String APIPassword="LdZW75%Txh@v+@q$";

    public static String EPLQueries_path="/queries/queries.epl";
    
    //Number of events for a client in order to be sent to Esper
    public static int No_Batch_Events = 10;



}
