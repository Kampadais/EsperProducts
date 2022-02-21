package kampia.esperLocation.Subscribers;

import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.Data.CMSApiConnector;
import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

public class UpdateTokenSubscriber implements StatementSubscriber{

    private final OkHttpClient httpClient = new OkHttpClient();

    @Override
    public String output(EventBean event) throws Exception {
        CMSApiConnector.fetchToken();
    return "";
    }


}
