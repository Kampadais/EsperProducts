package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;

/**
 * Just a convenience interface to let us easily contain the Esper statements with the Subscribers -
 * just for clarity, so it's easy to see the statements the subscribers are registered against.
 */
public interface StatementSubscriber {

    public String output(EventBean event) throws Exception;

}
