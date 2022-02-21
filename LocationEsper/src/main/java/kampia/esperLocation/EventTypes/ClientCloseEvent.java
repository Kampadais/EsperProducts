package kampia.esperLocation.EventTypes;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ClientCloseEvent    {
    private int LocationID;
    private int SessionID;
    private int ClientID;
    private java.sql.Timestamp Timestamp;
    private Double Lat;
    private Double Lon;
    private int Floor;
    private Long ticks;


    public ClientCloseEvent(){ticks=0L;}

    public ClientCloseEvent(Location loc1 ,Long ticks){
        this.Lat = loc1.getLat();
        this.Lon = loc1.getLon();
        this.Floor=loc1.getFloor();
        this.LocationID=loc1.getLocationID();
        this.Timestamp=loc1.getTimestamp();
        this.SessionID=loc1.getSessionID();
        this.ticks = ticks;
        this.ClientID=loc1.getClientID();
    }


    public ClientCloseEvent(int id , int sid, java.sql.Timestamp timestamp, Double lat , Double lon , int floor , int clientID){
        this.ClientID=clientID;
        this.LocationID=id;
        this.SessionID=sid;
        this.Timestamp=timestamp;
        this.Lon=lon;
        this.Lat=lat;
        this.Floor=floor;
    }

    @Override
    public String toString() {
        return "ClientCloseEvent{" +
                "LocationID=" + LocationID +
                ", SessionID=" + SessionID +
                ", ClientID=" + ClientID +
                ", Timestamp=" + Timestamp +
                ", Lat=" + Lat +
                ", Lon=" + Lon +
                ", Floor=" + Floor +
                ", ticks=" + ticks +
                '}';
    }

    public byte[] serialize(Object arg1) {
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

    public void setClientID(int clientID) {
        ClientID = clientID;
    }

    public int getClientID() {
        return ClientID;
    }

    public void setTimestamp(java.sql.Timestamp timestamp) {
        Timestamp = timestamp;
    }

    public void setSessionID(int sessionID) {
        SessionID = sessionID;
    }

    public void setLocationID(int locationID) {
        LocationID = locationID;
    }

    public void setLon(Double lon) {
        Lon = lon;
    }

    public void setLat(Double lat) {
        Lat = lat;
    }

    public int getLocationID() {
        return LocationID;
    }

    public void setFloor(int floor) {
        Floor = floor;
    }

    public java.sql.Timestamp getTimestamp() {
        return Timestamp;
    }

    public int getSessionID() {
        return SessionID;
    }

    public Double getLon() {
        return Lon;
    }

    public Double getLat() {
        return Lat;
    }

    public int getFloor() {
        return Floor;
    }

    public Long getTicks() {
        return ticks;
    }

    public void setTicks(Long ticks) {
        this.ticks = ticks;
    }

}
