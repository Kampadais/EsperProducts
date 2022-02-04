package kampia.esperLocation.Data;

import org.json.JSONException;
import org.json.JSONObject;

public class Product {

    private int ProductID=0;
    private String SKU="";
    private int ProductCategoryID=0;
    private int ManufacturerID=0;
    private int BrandID=0;
    private String Model="";
    private int CountryID=0;
    private double RetailPrice=0;
    private int VatID=0;
    private int Dimensions=0;
    private int ColourID=0;
    private Double Lat=0d;
    private Double Lon=0d;
    private int Floor=0;


    public Product(){}

    public Product(JSONObject JsonProd) throws JSONException {

        this.SKU= JsonProd.getString("Sku");
        this.ProductCategoryID= JsonProd.getInt("ProductCategoryId");
        this.ProductID=JsonProd.getInt("Id");
        this.RetailPrice=JsonProd.getDouble("RetailPrice");
        JSONObject LocTmp = JsonProd.getJSONArray("ProductLocations").getJSONObject(0);
        this.Lat = LocTmp.getDouble("Latitude");
        this.Lon= LocTmp.getDouble("Longitude");
        this.Floor=LocTmp.getInt("Floor");


    }

    public Product(int productID, String SKU, int MUnitID, int productCategoryID, int manufacturerID, int brandID, String model, int countryID, double retailPrice, int vatID, int dimensions, int colourID, Double lat, Double lon, int floor) {
        ProductID = productID;
        this.SKU = SKU;
        ProductCategoryID = productCategoryID;
        ManufacturerID = manufacturerID;
        BrandID = brandID;
        Model = model;
        CountryID = countryID;
        RetailPrice = retailPrice;
        VatID = vatID;
        Dimensions = dimensions;
        ColourID = colourID;
        Lat = lat;
        Lon = lon;
        Floor = floor;
    }

    public int getFloor() {
        return Floor;
    }

    public Double getLat() {
        return Lat;
    }

    public Double getLon() {
        return Lon;
    }

    public int getBrandID() {
        return BrandID;
    }

    public double getRetailPrice() {
        return RetailPrice;
    }

    public int getColourID() {
        return ColourID;
    }

    public int getCountryID() {
        return CountryID;
    }

    public int getDimensions() {
        return Dimensions;
    }

    public int getProductID() {
        return ProductID;
    }

    public int getManufacturerID() {
        return ManufacturerID;
    }

    public int getProductCategoryID() {
        return ProductCategoryID;
    }

    public String getSKU() {
        return SKU;
    }

    public int getVatID() {
        return VatID;
    }

    public void setBrandID(int brandID) {
        BrandID = brandID;
    }

    public void setLat(Double lat) {
        Lat = lat;
    }

    public void setLon(Double lon) {
        Lon = lon;
    }

    public String getModel() {
        return Model;
    }

    public void setColourID(int colourID) {
        ColourID = colourID;
    }

    public void setCountryID(int countryID) {
        CountryID = countryID;
    }

    public void setDimensions(int dimensions) {
        Dimensions = dimensions;
    }

    public void setManufacturerID(int manufacturerID) {
        ManufacturerID = manufacturerID;
    }

    public void setModel(String model) {
        Model = model;
    }

    public void setProductCategoryID(int productCategoryID) {
        ProductCategoryID = productCategoryID;
    }

    public void setRetailPrice(double retailPrice) {
        RetailPrice = retailPrice;
    }

    public void setSKU(String SKU) {
        this.SKU = SKU;
    }

    public void setVatID(int vatID) {
        VatID = vatID;
    }

    public void setProductID(int productID) {
        ProductID = productID;
    }



    public void setFloor(int floor) {
        Floor = floor;
    }

    @Override
    public String toString() {
        return "Product{" +
                "ProductID=" + ProductID +
                ", SKU='" + SKU + '\'' +
                ", ProductCategoryID=" + ProductCategoryID +
                ", ManufacturerID=" + ManufacturerID +
                ", BrandID=" + BrandID +
                ", Model='" + Model + '\'' +
                ", CountryID=" + CountryID +
                ", RetailPrice=" + RetailPrice +
                ", VatID=" + VatID +
                ", Dimensions=" + Dimensions +
                ", ColourID=" + ColourID +
                ", Lat=" + Lat +
                ", Lon=" + Lon +
                ", Floor=" + Floor +
                '}';
    }
}
