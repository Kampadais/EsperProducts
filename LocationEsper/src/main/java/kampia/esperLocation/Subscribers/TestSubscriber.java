package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.EsperMain;
import kampia.esperLocation.EventTypes.ClientInterested;
import kampia.esperLocation.EventTypes.Location;
import kampia.esperLocation.RabbitMQ.RabbitMQconnector;

public class TestSubscriber implements StatementSubscriber{

    @Override
    public String output(EventBean event){

        Location loc1 = (Location) event.get("loc1");
        Location loc2 = (Location) event.get("loc2");


        return "";
    }


}
