package kampia.esperLocation.Data;

import java.util.Date;

public class AdCampaing {

    private int CampaignID;
    private String Code;
    private String Description;
    private Date StartDate;
    private Date EndDate;
    private int ProductCategoryID;
    private int AgeGroup;
    private int ProductID;
    private int GenderId;
    private boolean isActive;
    private int brandId;
    private int clientLoyaltyStatusId;
    private double minDiscount;
    private double maxDiscount;

    //Important -> Age groups HardCoded


    public AdCampaing(int campaignID) {
        CampaignID = campaignID;
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

