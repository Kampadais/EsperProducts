package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.EventTypes.Location;

public class TestSubscriber implements StatementSubscriber{

    @Override
    public String output(EventBean event){

        Location loc1 = (Location) event.get("loc1");
        Location loc2 = (Location) event.get("loc2");


        return "";
    }


}
