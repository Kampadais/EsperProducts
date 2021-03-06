package kampia.esperLocation.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import kampia.esperLocation.EventTypes.ClientCloseEvent;
import kampia.esperLocation.EventTypes.Location;

import java.io.Serializable;

public class CustomDeserializer<T extends Serializable>  {

    private final ObjectMapper objectMapper = new ObjectMapper();




    public Object deserialize( byte[] data) {
        ObjectMapper mapper = new ObjectMapper();
        ClientCloseEvent temp = null;
        try {
              temp = mapper.readValue(data, ClientCloseEvent.class);
              if (temp.getTicks()==0){
                 Location loctemp = mapper.readValue(data,Location.class);
                 return  loctemp;
              }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return  temp;


    }

}