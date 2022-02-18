package kampia.esperLocation.EventTypes;

import com.fasterxml.jackson.databind.ObjectMapper;

public class NotifObject {

    private int clientID;
    private int productID;
    private int productCategoryID;



    public NotifObject(int clientID,int productID,int productCategoryID){
        this.clientID=clientID;
        this.productID=productID;
        this.productCategoryID=productCategoryID;
    }

    public int getClientID() {
        return clientID;
    }

    public int getProductCategoryID() {
        return productCategoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
    }

    public void setProductCategoryID(int productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
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

}
