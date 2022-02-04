package kampia.esperLocation.EventTypes;

public class Associate {

    private int     productID;
    private int     productCategoryID;
    private int     sessionID;
    private int     clientID;
    private int     locationID;
    private double  relevance=0;
    private double  newTicks=0;

    public Associate(int productID, int productCategoryID, int sessionID, Long ticks,int locationID , int ClientID) {
        this.productID=productID;
        this.clientID=ClientID;
        this.productCategoryID=productCategoryID;
        this.sessionID=sessionID;
        this.newTicks=ticks;
        this.locationID=locationID;
    }

    public void setSessionID(int sessionID) {
        this.sessionID = sessionID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setProductCategoryID(int productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public int getProductCategoryID() {
        return productCategoryID;
    }

    public int getProductID() {
        return productID;
    }

    public int getSessionID() {
        return sessionID;
    }

    public int getLocationID() {
        return locationID;
    }

    public int getClientID() {
        return clientID;
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
    }

    public double getRelevance() {
        return relevance;
    }

    public void setLocationID(int locationID) {
        this.locationID = locationID;
    }

    public double getNewTicks() {
        return newTicks;
    }

    public void setNewTicks(long newTicks) {
        this.newTicks = newTicks;
    }

    public void setRelevance(double relevance) {
        this.relevance = relevance;
    }
}
