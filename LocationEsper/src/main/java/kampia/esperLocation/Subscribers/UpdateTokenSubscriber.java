package kampia.esperLocation.Subscribers;
import com.espertech.esper.common.client.EventBean;
import kampia.esperLocation.Data.CMSApiConnector;
import okhttp3.*;
import org.json.JSONObject;
import org.json.JSONArray;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

public class UpdateTokenSubscriber implements StatementSubscriber{

    private final OkHttpClient httpClient = new OkHttpClient();

    @Override
    public String output(EventBean event) throws Exception {
        sendPost();
    return "";
    }


    public void sendPost() throws Exception {

        String strBody="{\n" +
                "    \"username\": \"cms_test\",\n" +
                "    \"password\": \"LdZW75%Txh@v+@q$\"\n" +
                "}";
        // form parameters

        RequestBody foBo=  FormBody.create(strBody.getBytes(StandardCharsets.UTF_8));

        Request request = new Request.Builder()
                .url("https://cms.proximiot.com/api/v1/auth/login/")
                .addHeader("Content-Type","application/json")
                .addHeader("User-Agent","csd3954")
                .addHeader("Accept","*/*")
                .addHeader("Accept-Encoding","gzip, deflate, br")
                .addHeader("Connection","keep-alive")
                .post(foBo)
                .build();


        try (Response response = httpClient.newCall(request).execute()) {

            if(!response.isSuccessful()) throw new IOException("Unexpected code " + response);
            // Get response body
            JSONArray array = new JSONArray("["+ Objects.requireNonNull(response.body()).string()+"]");
            JSONObject object = array.getJSONObject(0);
            CMSApiConnector.updateToken(object.getString("token"));
            CMSApiConnector.fetchProducts();
        }

    }
}
