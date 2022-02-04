package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.EsperMain;
import kampia.esperLocation.RabbitMQ.RabbitMQconnector;
import kampia.esperLocation.EventTypes.ClientInterested;

public class RelProdSubscriber implements StatementSubscriber{

    @Override
    public String output(EventBean event){

        StringBuilder sb= new StringBuilder();

        Object[] tmp = (Object[]) event.get("assoc");
        ClientInterested intre = new ClientInterested((int)tmp[1],(int)tmp[0],(Double)tmp[3],(int)tmp[2]);
        EsperMain.ClientsInterests.add(intre);

        sb.append("------------****------------      ");
        sb.append("Client with sessionID "+tmp[1]+" is interested for product with id :"+tmp[0] + " relevance -> "+tmp[2]  );
        sb.append("       ------------****------------");


        System.out.println(sb);
        RabbitMQconnector.runtime.getEventService().sendEventBean(intre, "ClientInterested");


        return "";
    }


}
