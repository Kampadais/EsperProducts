import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.Timestamp;
import java.util.Map;

public class Location  {

    private int LocationID;
    private int clientID;
    private int SessionID;
    private Timestamp Timestamp;
    private int Lat;
    private int Lon;
    private int Floor;


    public Location(){}

    public Location(int id , int sid, Timestamp timestamp, int lat , int lon , int floor , int clientID){
        this.LocationID=id;
        this.clientID=clientID;
        this.SessionID=sid;
        this.Timestamp=timestamp;
        this.Lon=lon;
        this.Lat=lat;
        this.Floor=floor;
    }


    @Override
    public String toString() {
        return "VALUES ("+LocationID+","+SessionID+",'"+Timestamp.toString()+"',"+Lat+","+Lon+","+Floor+");";
    }

    public byte[] serialize( Object arg1) {
        byte[] retVal = null;
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            retVal = objectMapper.writeValueAsString(arg1).getBytes();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return retVal;
    }

    public Object deserialize(String arg0, byte[] arg1) {
        ObjectMapper mapper = new ObjectMapper();
        Location temp = null;
        try {
            temp = mapper.readValue(arg1, Location.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return temp;
    }


    public String sending(){
        return "Lat: " +Lat +" Lon: "+Lon+"";
    }


    public int getFloor() {
        return Floor;
    }

    public int getLat() {
        return Lat;
    }

    public int getLocationID() {
        return LocationID;
    }

    public int getLon() {
        return Lon;
    }

    public int getSessionID() {
        return SessionID;
    }

    public java.sql.Timestamp getTimestamp() {
        return Timestamp;
    }

    public void setFloor(int floor) {
        Floor = floor;
    }

    public void setLat(int lat) {
        Lat = lat;
    }

    public void setLocationID(int locationID) {
        LocationID = locationID;
    }

    public void setLon(int lon) {
        Lon = lon;
    }

    public void setSessionID(int sessionID) {
        SessionID = sessionID;
    }

    public void setTimestamp(java.sql.Timestamp timestamp) {
        Timestamp = timestamp;
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
    }

    public int getClientID() {
        return clientID;
    }
}

