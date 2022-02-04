package kampia.esperLocation.EventTypes;

public class ClientInterestedCat {

    private int productCategoryID;
    private int SessionID;



    public ClientInterestedCat(int productCategoryID , int sessionID){
        this.productCategoryID=productCategoryID;
        this.SessionID=sessionID;
    }

    public void setProductCategoryID(int productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public int getProductCategoryID() {
        return productCategoryID;
    }

    public void setSessionID(int sessionID) {
        SessionID = sessionID;
    }


    public int getSessionID() {
        return SessionID;
    }


}
