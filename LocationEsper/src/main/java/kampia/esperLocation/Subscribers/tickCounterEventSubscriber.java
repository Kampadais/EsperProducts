package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.RabbitMQ.RabbitMQconnector;
import kampia.esperLocation.EventTypes.Associate;
import kampia.esperLocation.EventTypes.ClientCloseEvent;
import kampia.esperLocation.Data.Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import static kampia.esperLocation.EsperMain.*;

public class tickCounterEventSubscriber  implements   StatementSubscriber{
    @Override
    public String output(EventBean event)  {

        ClientCloseEvent tmploc= (ClientCloseEvent) event.get("loc");


        Product prod = (Product) event.get("product");
        StringBuilder sb = new StringBuilder();
        Associate tmp = new Associate(prod.getProductID(),prod.getProductCategoryID(),tmploc.getSessionID(),tmploc.getTicks(),tmploc.getSessionID(),tmploc.getClientID());

        sb.append("------------****------------      ");
        sb.append("Client with sessionID:"+ tmploc.getSessionID()+" and id "+tmploc.getClientID()+" stays close to  product: "+ prod.getProductID());//tmploc.getTicks());
        sb.append("        ------------****------------");

      //  SendToDB(tmploc,prod,sb.toString());

        System.out.println(sb);
        RabbitMQconnector.runtime.getEventService().sendEventBean(tmp, "Associate");

        return sb.toString();
    }

    private void  SendToDB( ClientCloseEvent loc, Product prod, String sb){
        Connection conn;
        Statement stmt;

        try {
            Class.forName("org.mariadb.jdbc.Driver");


            conn = DriverManager.getConnection(
                    DB_URL, USER, PASS);
            stmt = conn.createStatement();


            String sql = "INSERT INTO `Event`(`ClientLocationID`, `ProductID`, `Content`) VALUES ("+loc.getLocationID()+" , "+prod.getProductID()+" ,'"+sb+"')";

            stmt.executeQuery(sql);

        }catch (Exception ex){
            System.out.println(ex.fillInStackTrace().toString());
        }

    }

}
