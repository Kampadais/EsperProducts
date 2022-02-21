package kampia.esperLocation.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class WishList {

    private int ClientID;
    private final ArrayList<Integer> Products=new ArrayList<>();
    //0->Start Date , 1->End date
    private final HashMap<Integer ,Date[] > expireDate=new HashMap<>();



    public WishList(int ID ){
        this.ClientID=ID;
    }

    public void AddProduct(int ProductID){
        this.Products.add(ProductID);
    }

    public int getWishListID() {
        return ClientID;
    }

    public int checkCategoryID(int categoryId){
        int noProd=0;
        for (int i=0;i<Products.size();i++){
            for (int j=0;j<CMSApiConnector.getProducts().size();j++){
                if (CMSApiConnector.getProducts().get(j).getProductID()==Products.get(i)){
                    if (CMSApiConnector.getProducts().get(j).getProductCategoryID()==categoryId) noProd++;
                }
            }
        }
        return noProd;

    }

    public boolean checkProduct(int productID){
        for (int i=0;i<Products.size();i++){
           if (Products.get(i)==productID) return true;
        }
        return false;
    }
    public ArrayList<Integer> getProducts() {
        return Products;
    }

    public void setWishListID(int ClientID) {
        this.ClientID = ClientID;
    }

    public HashMap<Integer, Date[]> getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(int ProductId, Date startDate , Date endDate) {
        Date[] tmpDates={startDate,endDate};
        this.expireDate.put(ProductId,tmpDates);
    }

    @Override
    public String toString() {
        return "ExplicitWishList{" +
                "ClientID=" + ClientID +
                ", Products=" + Products +
                ", expireDate=" + expireDate +
                '}';
    }
}
