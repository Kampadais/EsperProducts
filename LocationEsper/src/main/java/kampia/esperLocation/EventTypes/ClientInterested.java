package kampia.esperLocation.EventTypes;

@SuppressWarnings("FieldMayBeFinal")
public class ClientInterested {

    private int sessionID;
    private int productID;
    private int productCategoryID;
    private Double relevance;

    public ClientInterested(int sessionID, int productID, Double relevance, int productCategoryID) {
        this.sessionID = sessionID;
        this.productID = productID;
        this.relevance = relevance;
        this.productCategoryID = productCategoryID;
    }

    public void setRelevance(Double relevance) {
        this.relevance = relevance;
    }

    public int getProductID() {
        return productID;
    }

    public Double getRelevance() {
        return relevance;
    }

    public int getSessionID() {
        return sessionID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setSessionID(int sessionID) {
        this.sessionID = sessionID;
    }

    public int getProductCategoryID() {
        return productCategoryID;
    }

    public void setProductCategoryID(int productCategoryID) {
        this.productCategoryID = productCategoryID;
    }
}
