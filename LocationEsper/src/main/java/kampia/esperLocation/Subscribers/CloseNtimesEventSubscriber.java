package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.RabbitMQ.RabbitMQconnector;
import kampia.esperLocation.EventTypes.ClientCloseEvent;
import kampia.esperLocation.EventTypes.Location;


public class CloseNtimesEventSubscriber  implements  StatementSubscriber{


    @Override
    public String output(EventBean event) {

        StringBuilder sb = new StringBuilder();



        Location loc1 = (Location) event.get("loc1");
        Long notimes = (Long) event.get("idcount");
        ClientCloseEvent closeEvent = new ClientCloseEvent(loc1,notimes);


        sb.append("------------****------------      ");
        sb.append("Client with sessionID: "+loc1.getSessionID()+" staying close to a place "+notimes+" times ->  Lat:" + loc1.getLat()  +"  Lon: " + loc1.getLon() + " Floor:"+ loc1.getFloor() );
        sb.append("IDs :" + loc1.getLocationID()  +" "  );
        sb.append("       ------------****------------");


        System.out.println(sb);
        RabbitMQconnector.runtime.getEventService().sendEventBean(closeEvent, "ClientCloseEvent");
        return sb.toString();
    }
}