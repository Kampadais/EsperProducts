package kampia.esperLocation.Data;

import org.json.JSONException;
import org.json.JSONObject;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;


public class Client {

    private int ClientID;
    private String FName;
    private String LName;
    private String Email;
    private int ClientCategory;
    private int GenderID;
    private int LoyaltyID;
    private WishList ExplicitWishlist;
    private WishList ImplicitWishList;
    private int AgeGroup=0;



    public Client(JSONObject clientJson) throws JSONException {

        this.ClientID=clientJson.getInt("Id");

        if (!clientJson.isNull("ClientLoyaltyStatusId"))this.LoyaltyID=clientJson.getInt("ClientLoyaltyStatusId");
        if (!clientJson.isNull("FirstName"))this.FName=clientJson.getString("FirstName");
        if (!clientJson.isNull("LastName"))this.LName=clientJson.getString("LastName");
        if (!clientJson.isNull("GenderID"))this.GenderID=clientJson.getInt("GenderId");
        if(!clientJson.isNull("DateOfBirth")){
            LocalDateTime localDateTime = LocalDateTime.parse(clientJson.getString("DateOfBirth"));
            Instant instant = localDateTime.atZone(ZoneId.systemDefault()).toInstant();
            setAgeGroup(java.util.Date.from(instant));
        }

    }

    public Client(int clientID){
        this.ClientID=clientID;
    }

    public Client() {}

    public void setAgeGroup(Date Birth) {
        LocalDate start = Instant.ofEpochMilli(Birth.getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
        LocalDate stop = LocalDate.now( ZoneId.of( "America/Montreal" ) );
        long years = java.time.temporal.ChronoUnit.YEARS.between( start , stop );

       if (years>=18 && years<=35) this.AgeGroup=2;
       else if(years>=36 && years<=60) this.AgeGroup=3;
       else this.AgeGroup=4;

      //  System.out.println("ID -> "+this.getClientID()+"Age -> "+years+" Group -> " + this.AgeGroup);
    }

    public int getAgeGroup() {
        return AgeGroup;
    }

    public int getClientID() {
        return ClientID;
    }

    public int getClientCategory() {
        return ClientCategory;
    }

    public int getGenderID() {
        return GenderID;
    }

    public int getLoyaltyID() {
        return LoyaltyID;
    }

    public void setClientCategory(int clientCategory) {
        ClientCategory = clientCategory;
    }

    public void setClientID(int clientID) {
        ClientID = clientID;
    }

    public String getEmail() {
        return Email;
    }

    public String getFName() {
        return FName;
    }

    public String getLName() {
        return LName;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public void setFName(String FName) {
        this.FName = FName;
    }

    public void setGenderID(int genderID) {
        GenderID = genderID;
    }

    public void setLName(String LName) {
        this.LName = LName;
    }

    public void setLoyaltyID(int loyaltyID) {
        LoyaltyID = loyaltyID;
    }

    public WishList getExplicitWishlist() {
        return ExplicitWishlist;
    }

    public void setExplicitWishlist(WishList explicitWishlist) {
        ExplicitWishlist = explicitWishlist;
    }

    public void setAgeGroup(int ageGroup) {
        AgeGroup = ageGroup;
    }

    public void setImplicitWishList(WishList implicitWishList) {
        ImplicitWishList = implicitWishList;
    }

    public WishList getImplicitWishList() {
        return ImplicitWishList;
    }

    @Override
    public String toString() {
        return "Client{" +
                "ClientID=" + ClientID +
                ", FName='" + FName + '\'' +
                ", LName='" + LName + '\'' +
                ", Email='" + Email + '\'' +
                ", ClientCategory=" + ClientCategory +
                ", GenderID=" + GenderID +
                ", LoyaltyID=" + LoyaltyID +
                ", EWishlist=" + ExplicitWishlist +
                ", IWishlist= "+ ImplicitWishList+
                ", AgeGroup="+ AgeGroup+
                '}';
    }
}
