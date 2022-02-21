package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.EsperMain;
import kampia.esperLocation.EventTypes.ClientInterestedCat;
import kampia.esperLocation.RabbitMQ.RabbitMQconnector;

public class RelCatSubscriber implements  StatementSubscriber{
    @Override
    public String output(EventBean event) {
        StringBuilder sb= new StringBuilder();

        Object[] tmp = (Object[]) event.get("assoc");
        ClientInterestedCat intre = new ClientInterestedCat((int)tmp[0],(int)tmp[1]);
        EsperMain.ClientsInterestsCat.add(intre);

        sb.append("------------****------------      ");
        sb.append("Client with sessionID "+tmp[1]+" is interested for product Category  with id :"+tmp[0] );
        sb.append("       ------------****------------");

        System.out.println(sb);
        RabbitMQconnector.runtime.getEventService().sendEventBean(intre, "ClientInterestedCat");

        return "";
    }
}
