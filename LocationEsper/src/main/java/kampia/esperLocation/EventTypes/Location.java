package kampia.esperLocation.EventTypes;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.sql.Timestamp;

public class Location  extends ClientCloseEvent{

    private int LocationID;
    private int SessionID;
    private int clientID;
    private Timestamp Timestamp;
    private Double Lat;
    private Double Lon;
    private int Floor;
    private Long ticks;

    public Location(){}

    public Location(int id , int sid, Timestamp timestamp, Double lat , Double lon , int floor , int clientID){
        this.clientID= clientID;
        this.LocationID=id;
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


    public int getClientID() {
        return clientID;
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
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

    public void setTicks(Long ticks) {
        this.ticks = ticks;
    }

    public Long getTicks() {
        return ticks;
    }
}
