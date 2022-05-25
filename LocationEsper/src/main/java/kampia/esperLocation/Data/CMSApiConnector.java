package kampia.esperLocation.Data;

import kampia.esperLocation.EventTypes.Associate;
import kampia.esperLocation.config.Configurations;
import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

public class CMSApiConnector {


    private static String APIToken;

    private static ArrayList<Product> Products = new ArrayList<>();
    private static ArrayList<AdCampaign> campaings = new ArrayList<>();
    private static HashMap<Integer,Client> clients = new HashMap<>();


    private static OkHttpClient httpClient = new OkHttpClient();

    public static void  InitCMSApiConnector() throws IOException, SQLException, ClassNotFoundException {

        if (!Configurations.Local){
            fetchToken();
            fetchProducts();
            fetchClients();
            fetchCampaigns();
            fetchWishlists();
            fetchImpWishlist();
        }else {
            fetchProductsLocal();
            fetchClientsLocal();
            fetchCampaignsLocal();
            fetchWishlistsLocal();
            fetchImpWishlistLocal();
        }

    }

    private static void fetchWishlistsLocal() throws SQLException, ClassNotFoundException {
        Class.forName(Configurations.JDBC_DRIVER) ;
        Connection conn = DriverManager.getConnection(Configurations.DB_URL_CMS+"?generateSimpleParameterMetadata=true", Configurations.USER, Configurations.PASS) ;
        Statement stmt = conn.createStatement() ;
        String query = "SELECT * FROM `explicit_wishlist_items`" ;
        ResultSet rs = stmt.executeQuery(query) ;

        ArrayList<Product> tmpList = new ArrayList<>();
        try {
            while (rs.next()) {
                int ClientID = rs.getInt("clientId");
                if (clients.containsKey(ClientID)){
                    WishList tmpExplList = clients.get(ClientID).getExplicitWishlist();
                    if(tmpExplList.getWishListID()!=-1){
                        tmpExplList.AddProduct(rs.getInt("productId"));
                        tmpExplList.setExpireDate(rs.getInt("productId"),rs.getDate("startDate"),rs.getDate("endDate"));

                    }else{
                        tmpExplList = new WishList(rs.getInt("clientId"));
                        tmpExplList.AddProduct(rs.getInt("productId"));
                        tmpExplList.setExpireDate(rs.getInt("productId"),rs.getDate("startDate"),rs.getDate("endDate"));
                        clients.get(ClientID).setExplicitWishlist(tmpExplList);
                    }
                }

            }

        }catch (Exception ex){
            System.out.println(ex.toString());
        }


    }

    private static void fetchWishlists() {
    }


    private static void fetchImpWishlist(){
    }


    private static void fetchImpWishlistLocal() throws ClassNotFoundException, SQLException {
        Class.forName(Configurations.JDBC_DRIVER) ;
        Connection conn = DriverManager.getConnection(Configurations.DB_URL_Prox+"?generateSimpleParameterMetadata=true", Configurations.USER, Configurations.PASS) ;
        Statement stmt = conn.createStatement() ;
        String query = "SELECT * FROM `ImplicitWishlist`" ;
        ResultSet rs = stmt.executeQuery(query) ;

        ArrayList<Product> tmpList = new ArrayList<>();
        try {
            while (rs.next()) {
                int ClientID = rs.getInt("clientId");
                if (clients.containsKey(ClientID)){
                    WishList tmpImplList = clients.get(ClientID).getImplicitWishList();
                    if(tmpImplList.getWishListID()!=-1){
                        tmpImplList.AddProduct(rs.getInt("productId"));
                        tmpImplList.setExpireDate(rs.getInt("productId"),rs.getDate("startDate"),rs.getDate("endDate"));

                    }else{
                        tmpImplList = new WishList(rs.getInt("clientId"));
                        tmpImplList.AddProduct(rs.getInt("productId"));
                        tmpImplList.setExpireDate(rs.getInt("productId"),rs.getDate("startDate"),rs.getDate("endDate"));
                        clients.get(ClientID).setImplicitWishList(tmpImplList);
                    }
                }
            }
        }catch (Exception ex){
            System.out.println(ex.toString());
        }
    }

    public static void fetchToken(){

        String strBody="{\n" +
                "    \"username\": \""+Configurations.APIUsername+"\",\n" +
                "    \"password\": \""+Configurations.APIPassword+"\"\n" +
                "}";
        RequestBody foBo=  FormBody.create(strBody.getBytes(StandardCharsets.UTF_8));

        Request request = new Request.Builder()
                .url("https://cms.proximiot.com/api/v1/auth/login/")
                .addHeader("Content-Type","application/json")
                .addHeader("User-Agent","csd3954")
                .addHeader("Accept","*/*")
                .addHeader("Accept-Encoding","gzip, deflate, br")
                .addHeader("Connection","keep-alive")
                .post(foBo)
                .build();


        try (Response response = httpClient.newCall(request).execute()) {

            if(!response.isSuccessful()) throw new IOException("Unexpected code " + response);
            // Get response body
            JSONArray array = new JSONArray("["+response.body().string()+"]");
            JSONObject object = array.getJSONObject(0);
            updateToken(object.getString("token"));

        } catch (JSONException | IOException e) {
            e.printStackTrace();
        }

    }

    public  static void updateToken(String token) {
        APIToken = token;
    }

    public static void fetchProducts() throws IOException {

        Request request = new Request.Builder()
                .url("https://cms.proximiot.com/api/v1/products?PageIndex=1&PageSize=1000&useFilterUnion=false")
                .addHeader("Accept", "text/plain")
                .addHeader("Accept-Encoding", "gzip, deflate, br")
                .addHeader("Connection", "keep-alive")
                .addHeader("Authorization", "Bearer " + APIToken)
                .get()
                .build();


        try (Response response = httpClient.newCall(request).execute()) {

            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);

            String jsonBodyres= Objects.requireNonNull(response.body()).string();
            JSONObject object= new JSONObject(jsonBodyres);

            JSONArray array = (JSONArray) object.get("items");


            for(int i=0; i<array.length(); i++){
                if (!array.getJSONObject(i).isNull("ProductLocations")) {
                    for (int j=0;j<array.getJSONObject(i).getJSONArray("ProductLocations").length();j++) {
                        JSONObject tmpprod= array.getJSONObject(i);
                        tmpprod.put("Latitude",array.getJSONObject(i).getJSONArray("ProductLocations").getJSONObject(j).getInt("Latitude"));
                        tmpprod.put("Longitude",array.getJSONObject(i).getJSONArray("ProductLocations").getJSONObject(j).getInt("Longitude"));
                        tmpprod.put("Floor",array.getJSONObject(i).getJSONArray("ProductLocations").getJSONObject(j).getInt("Floor"));

                        Product tmp_prod = new Product(tmpprod);
                        Products.add(tmp_prod);
                    }
                }

            }

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public static void fetchProductsLocal() throws ClassNotFoundException, SQLException {
        Class.forName(Configurations.JDBC_DRIVER) ;
        Connection conn = DriverManager.getConnection(Configurations.DB_URL_CMS+"?generateSimpleParameterMetadata=true", Configurations.USER, Configurations.PASS) ;
        Statement stmt = conn.createStatement() ;
        String query = "SELECT * FROM `products` JOIN `product_categories` ON products.productCategoryId=product_categories.id JOIN `product_locations` ON product_locations.productId = products.id ORDER BY `products`.`id` ASC" ;
        ResultSet rs = stmt.executeQuery(query) ;


        ArrayList<Product> tmpList = new ArrayList<>();
        try {
            while (rs.next()) {
                Product tmp = new Product();
                tmp.setProductID(rs.getInt("id"));
                tmp.setSKU(rs.getString("sku"));
                tmp.setProductCategoryID(rs.getInt("productCategoryId"));
                tmp.setBrandID(rs.getInt("brandId"));
                tmp.setModel(rs.getString("model"));
                tmp.setRetailPrice(rs.getDouble("retailPrice"));
                tmp.setLat(rs.getDouble("latitude"));
                tmp.setLon(rs.getDouble("longitude"));
                tmp.setFloor(rs.getInt("floor"));
                tmpList.add(tmp);

            }

        }catch (Exception ex){
            System.out.println(ex.toString());
        }
        Products=tmpList;

    }

    public static void fetchCampaigns(){

        Request request = new Request.Builder()
                .url("https://cms.proximiot.com/api/v1/ad-campaign-offers?PageIndex=1&PageSize=200&useFilterUnion=false")
                .addHeader("Accept", "text/plain")
                .addHeader("Accept-Encoding", "gzip, deflate, br")
                .addHeader("Connection", "keep-alive")
                .addHeader("Authorization", "Bearer " + APIToken)
                .get()
                .build();


        try (Response response = httpClient.newCall(request).execute()) {

            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);

            String jsonBodyres= Objects.requireNonNull(response.body()).string();
            JSONObject object= new JSONObject(jsonBodyres);

            JSONArray array = (JSONArray) object.get("items");


            for(int i=0; i<array.length(); i++){
                    AdCampaign tmp_camp = new AdCampaign(array.getJSONObject(i));
                    campaings.add(tmp_camp);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }


    }

    public static void fetchCampaignsLocal() throws ClassNotFoundException, SQLException {
        Class.forName(Configurations.JDBC_DRIVER) ;
        Connection conn = DriverManager.getConnection(Configurations.DB_URL_CMS+"?generateSimpleParameterMetadata=true", Configurations.USER, Configurations.PASS) ;
        Statement stmt = conn.createStatement() ;
        String query = "SELECT * FROM `ad_offers`;" ;
        ResultSet rs = stmt.executeQuery(query) ;


        try {
            while (rs.next()) {
                AdCampaign tmp = new AdCampaign(rs.getInt("id"));
                tmp.setActive(rs.getBoolean("isActive"));
                tmp.setAgeGroup(rs.getInt("ageGroupId"));
                tmp.setProductID(rs.getInt("productId"));
                tmp.setCode(rs.getString("code"));
                tmp.setDescription(rs.getString("description"));
                tmp.setEndDate(rs.getDate("endDate"));
                tmp.setStartDate(rs.getDate("startDate"));
                tmp.setProductCategoryID(rs.getInt("productCategoryId"));
                tmp.setBrandId(rs.getInt("brandId"));
                tmp.setGenderId(rs.getInt("genderId"));
                tmp.setClientLoyaltyStatusId(rs.getInt("clientLoyaltyStatusId"));
                tmp.setMaxDiscount(rs.getFloat("maxDiscount"));
                tmp.setMinDiscount(rs.getFloat("minDiscount"));
                campaings.add(tmp);

            }
        }catch (Exception ex){
            System.out.println(ex.toString());
        }

    }

    public static void fetchClients(){

        Request request = new Request.Builder()
                .url("https://cms.proximiot.com/api/v1/clients?PageIndex=1&PageSize=100&useFilterUnion=false")
                .addHeader("Accept", "text/plain")
                .addHeader("Accept-Encoding", "gzip, deflate, br")
                .addHeader("Connection", "keep-alive")
                .addHeader("Authorization", "Bearer " + APIToken)
                .get()
                .build();


        try (Response response = httpClient.newCall(request).execute()) {

            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);

            String jsonBodyres= Objects.requireNonNull(response.body()).string();
            JSONObject object= new JSONObject(jsonBodyres);

            JSONArray array = (JSONArray) object.get("items");


            for(int i=0; i<array.length(); i++){
                if (!array.getJSONObject(i).isNull("Id")) {
                    Client tmpClient = new Client(array.getJSONObject(i));
                    tmpClient.setExplicitWishlist(new WishList(-1));
                    clients.put(tmpClient.getClientID(),tmpClient);
                }
            }
        } catch (JSONException | IOException e) {
            e.printStackTrace();
        }
    }

    private static void fetchClientsLocal() throws ClassNotFoundException, SQLException {
        Class.forName(Configurations.JDBC_DRIVER) ;
        Connection conn = DriverManager.getConnection(Configurations.DB_URL_CMS+"?generateSimpleParameterMetadata=true", Configurations.USER, Configurations.PASS) ;
        Statement stmt = conn.createStatement() ;
        String query = "SELECT * FROM `clients`" ;
        ResultSet rs = stmt.executeQuery(query) ;

        try {
            while (rs.next()) {
               Client tmp =new Client();
               tmp.setClientID(rs.getInt("id"));
               tmp.setLoyaltyID(rs.getInt("clientLoyaltyStatusID"));
               tmp.setLName(rs.getString("firstName"));
               tmp.setFName(rs.getString("lastName"));
               tmp.setGenderID(rs.getInt("genderId"));
               if (rs.getDate("dateOfBirth")!=null)  tmp.setAgeGroup(rs.getDate("dateOfBirth"));


                tmp.setExplicitWishlist(new WishList(-1));
                tmp.setImplicitWishList(new WishList(-1));
               clients.put(tmp.getClientID(),tmp);
            }
        }catch (Exception ex){
            System.out.println(ex.toString());
        }


    }

    public static Double calcRelevance(Double oldRel , Double newRel , Associate assoc){

        double whishAcc=0;
        double multiplier=1;

        for (int i=0;i<campaings.size();i++) {
            if (campaings.get(i).getProductCategoryID() == assoc.getProductCategoryID()) {
                if ((campaings.get(i).getAgeGroup()==clients.get(assoc.getClientID()).getAgeGroup() || campaings.get(i).getAgeGroup()==0 ) && (campaings.get(i).getGenderId()==clients.get(assoc.getClientID()).getGenderID() || campaings.get(i).getGenderId()==0)){
                    multiplier+=0.1;
                }
            }
            if (campaings.get(i).getProductID()==assoc.getProductID()){
                if ((campaings.get(i).getAgeGroup()==clients.get(assoc.getClientID()).getAgeGroup() || campaings.get(i).getAgeGroup()==0) && (campaings.get(i).getGenderId()==clients.get(assoc.getClientID()).getGenderID() || campaings.get(i).getGenderId()==0  )){
                    multiplier+=0.4;
                }
            }
        }



        Client tmpClient = clients.get(assoc.getClientID());

        whishAcc+= tmpClient.getExplicitWishlist().checkCategoryID(assoc.getProductCategoryID());

        if (tmpClient.getExplicitWishlist().checkProduct(assoc.getProductID())){
            whishAcc += 5 ;
        }
        if (tmpClient.getImplicitWishList().checkProduct(assoc.getProductID())){
            whishAcc+= 2 ;
        }

        double retRel= oldRel+ multiplier*(whishAcc+newRel);

        return  retRel;

    }

    public static HashMap<Integer,Client> getClients(){return clients;}

    public static ArrayList<AdCampaign> getCampaigns() {return campaings;}

    public static ArrayList<Product> getProducts(){return Products;}

}
