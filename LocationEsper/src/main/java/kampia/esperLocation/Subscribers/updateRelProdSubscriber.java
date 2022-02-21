package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;

public class updateRelProdSubscriber implements StatementSubscriber{

    @Override
    public String output(EventBean event) {
        StringBuilder sb = new StringBuilder();

        sb.append("------------****------------      ");
        sb.append("Update Relevance on productId:"+event.get("productID")+" and SessionID:"+event.get("SessionID")+" sum : "+event.get("relevance"));
        sb.append("       ------------****------------");

        System.out.println(sb);
        return sb.toString();
    }




}
