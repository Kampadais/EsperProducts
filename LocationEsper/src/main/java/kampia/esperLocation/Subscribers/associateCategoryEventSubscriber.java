package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.EventTypes.Associate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import static kampia.esperLocation.EsperMain.*;

public class associateCategoryEventSubscriber implements StatementSubscriber{


    @Override
    public String output(EventBean event) {
        StringBuilder sb = new StringBuilder();

        Associate assocTmp= (Associate) event.get("loc1");

        sb.append("------------****------------      ");
        sb.append("Associate Location with id:").append(assocTmp.getSessionID()).append( " with productCategory with id:").append(assocTmp.getProductCategoryID());
        sb.append("       ------------****------------");

       // SendToDB(assocTmp,sb.toString());
        System.out.println(sb);
        return sb.toString();
    }

    private void  SendToDB(Associate associate, String sb){
        Connection conn;
        Statement stmt;

        try {
            Class.forName("org.mariadb.jdbc.Driver");



            conn = DriverManager.getConnection(
                    DB_URL, USER, PASS);

            stmt = conn.createStatement();


            String sql = "INSERT INTO `Event`(`ClientLocationID`, `ProductID`, `Content`) VALUES ("+associate.getSessionID()+" , "+associate.getProductCategoryID()+" ,'"+sb+"')";

            stmt.executeQuery(sql);

        }catch (Exception ex){
            System.out.println(ex.fillInStackTrace().toString());
        }

    }

}
