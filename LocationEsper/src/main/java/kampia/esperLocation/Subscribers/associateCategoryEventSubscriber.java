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

        System.out.println(sb);
        return sb.toString();
    }

}
