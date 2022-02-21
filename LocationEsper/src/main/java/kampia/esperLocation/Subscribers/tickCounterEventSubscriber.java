package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.Data.Product;
import kampia.esperLocation.EventTypes.Associate;
import kampia.esperLocation.EventTypes.ClientCloseEvent;
import kampia.esperLocation.RabbitMQ.RabbitMQconnector;
import kampia.esperLocation.config.Configurations;

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

        System.out.println(sb);
        RabbitMQconnector.runtime.getEventService().sendEventBean(tmp, "Associate");

        return sb.toString();
    }

}
