package kampia.esperLocation.Data;

import org.json.JSONException;
import org.json.JSONObject;

import java.text.ParseException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class AdCampaign {

    private int CampaignID;
    private String Code;
    private String Description="";
    private Date StartDate;
    private Date EndDate;
    private int ProductCategoryID=0;
    private int AgeGroup=0;
    private int ProductID=0;
    private int GenderId=0;
    private boolean isActive=false;
    private int brandId=0;
    private int clientLoyaltyStatusId=0;
    private double minDiscount=0;
    private double maxDiscount=0;

    public AdCampaign(int campaignID) {
        CampaignID = campaignID;
    }

    public AdCampaign(JSONObject campJSON) throws JSONException, ParseException {

        this.CampaignID=campJSON.getInt("Id");
        this.Code=campJSON.getString("Code");
        if(!campJSON.isNull("Description")) this.Description=campJSON.getString("Description");
        if (!campJSON.isNull("BrandId"))this.brandId=campJSON.getInt("BrandId");
        if (!campJSON.isNull("clientLoyaltyStatusId"))this.clientLoyaltyStatusId=campJSON.getInt("ClientLoyaltyStatusId");
        if (!campJSON.isNull("MaxExtraDiscount"))this.maxDiscount=campJSON.getInt("MaxExtraDiscount");
        if (!campJSON.isNull("DefaultDiscount"))this.minDiscount=campJSON.getInt("DefaultDiscount");
        if (!campJSON.isNull("AgeGroupId"))this.AgeGroup=campJSON.getInt("AgeGroupId");
        if (!campJSON.isNull("GenderId"))this.GenderId=campJSON.getInt("GenderId");
        if (!campJSON.isNull("IsActive")) this.isActive=campJSON.getBoolean("IsActive");
        if(!campJSON.isNull("ProductCategoryId")) this.ProductCategoryID = campJSON.getInt("ProductCategoryId");
        if(!campJSON.isNull("ProductID")) this.ProductID = campJSON.getInt("ProductID");
        if(!campJSON.isNull("StartDate")) {
            LocalDateTime localDateTime = LocalDateTime.parse(campJSON.getString("StartDate"));
            Instant instant = localDateTime.atZone(ZoneId.systemDefault()).toInstant();
            this.StartDate = Date.from(instant);
          }
        if(!campJSON.isNull("EndDate")) {
            LocalDateTime localDateTime = LocalDateTime.parse(campJSON.getString("EndDate"));
            Instant instant = localDateTime.atZone(ZoneId.systemDefault()).toInstant();
            this.EndDate = Date.from(instant);
        }
    }

    public int getProductID() {
        return ProductID;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public void setProductID(int productID) {
        ProductID = productID;
    }

    public int getProductCategoryID() {
        return ProductCategoryID;
    }

    public void setProductCategoryID(int productCategoryID) {
        ProductCategoryID = productCategoryID;
    }

    public boolean isActive() {
        return isActive;
    }

    public Date getEndDate() {
        return EndDate;
    }

    public Date getStartDate() {
        return StartDate;
    }

    public int getCampaignID() {
        return CampaignID;
    }

    public String getDescription() {
        return Description;
    }

    public String getCode() {
        return Code;
    }

    public void setActive(boolean active) {
        isActive = active;
    }


    public void setCampaignID(int campaignID) {
        CampaignID = campaignID;
    }


    public void setCode(String code) {
        Code = code;
    }

    public void setDescription(String description) {
        Description = description;
    }


    public void setEndDate(Date endDate) {
        EndDate = endDate;
    }

    public void setStartDate(Date startDate) {
        StartDate = startDate;
    }

    public double getMaxDiscount() {
        return maxDiscount;
    }

    public double getMinDiscount() {
        return minDiscount;
    }

    public int getAgeGroup() {
        return AgeGroup;
    }

    public int getClientLoyaltyStatusId() {
        return clientLoyaltyStatusId;
    }

    public int getGenderId() {
        return GenderId;
    }

    public void setAgeGroup(int ageGroup) {
        AgeGroup = ageGroup;
    }

    public void setClientLoyaltyStatusId(int clientLoyaltyStatusId) {
        this.clientLoyaltyStatusId = clientLoyaltyStatusId;
    }

    public void setGenderId(int genderId) {
        GenderId = genderId;
    }

    public void setMaxDiscount(double maxDiscount) {
        this.maxDiscount = maxDiscount;
    }

    public void setMinDiscount(double minDiscount) {
        this.minDiscount = minDiscount;
    }

    @Override
    public String toString() {
        return "AdCampaing{" +
                "CampaignID=" + CampaignID +
                ", Code='" + Code + '\'' +
                ", Description='" + Description + '\'' +
                ", StartDate=" + StartDate +
                ", EndDate=" + EndDate +
                ", ProductCategoryID=" + ProductCategoryID +
                ", AgeGroup=" + AgeGroup +
                ", ProductID=" + ProductID +
                ", GenderId=" + GenderId +
                ", isActive=" + isActive +
                ", brandId=" + brandId +
                ", clientLoyaltyStatusId=" + clientLoyaltyStatusId +
                ", minDiscount=" + minDiscount +
                ", maxDiscount=" + maxDiscount +
                '}';
    }
}

