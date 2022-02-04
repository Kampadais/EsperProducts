package kampia.esperLocation.Data;

import kampia.esperLocation.EventTypes.Associate;
import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

import static kampia.esperLocation.EsperMain.connector;

public class CMSApiConnector {

    private static String APIusernname = "cms_test";
    private static String APIpass = "LdZW75%Txh@v+@q$";
    private static String APIToken;

    private static ArrayList<Product> Products = new ArrayList<>();
    private static ArrayList<AdCampaing> campaings = new ArrayList<>();
    private static HashMap<Integer,Client> clients = new HashMap<>();


    private static OkHttpClient httpClient = new OkHttpClient();

    public static void  InitCMSApiConnector(boolean local) throws IOException, SQLException, ClassNotFoundException {

        if (!local){
            fetchToken();
            fetchProducts();
            fetchClients();
            fetchCampaigns();
            fetchWishlists();
        }else {
            fetchProductsLocal();
            fetchClientsLocal();
            fetchCampaignsLocal();
            fetchWishlistsLocal();
        }

    }

    private static void fetchWishlistsLocal() throws SQLException, ClassNotFoundException {
        Class.forName("org.mariadb.jdbc.Driver") ;
        Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/CMS?generateSimpleParameterMetadata=true", "root", "") ;
        Statement stmt = conn.createStatement() ;
        String query = "SELECT * FROM `explicit_wishlist_items`" ;
        ResultSet rs = stmt.executeQuery(query) ;

        ArrayList<Product> tmpList = new ArrayList<>();
        try {
            while (rs.next()) {
                int ClientID = rs.getInt("clientId");
                if (clients.containsKey(ClientID)){
                    ExplicitWishList tmpExplList = clients.get(ClientID).getWishlist();
                    if(tmpExplList.getWishListID()!=-1){
                        tmpExplList.AddProduct(rs.getInt("productId"));
                        tmpExplList.setExpireDate(rs.getInt("productId"),rs.getDate("startDate"),rs.getDate("endDate"));

                    }else{
                        tmpExplList = new ExplicitWishList(rs.getInt("clientId"));
                        int kekw= rs.getInt("productId");
                        tmpExplList.AddProduct(rs.getInt("productId"));
                        tmpExplList.setExpireDate(rs.getInt("productId"),rs.getDate("startDate"),rs.getDate("endDate"));
                        clients.get(ClientID).setWishlist(tmpExplList);
                    }
                }

            }

        }catch (Exception ex){
            System.out.println(ex.toString());
        }


    }

    private static void fetchWishlists() {
    }



    private static void fetchToken(){

        String strBody="{\n" +
                "    \"username\": \"cms_test\",\n" +
                "    \"password\": \"LdZW75%Txh@v+@q$\"\n" +
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
        ArrayList<Product> prod_list = new ArrayList<>();
       // HashMap<Integer,Product> prod_list= new HashMap<>();
        int j=0;
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
                    Product tmp_prod = new Product(array.getJSONObject(i));
                   // prod_list.put(j++,tmp_prod);
                    prod_list.add(tmp_prod);
                }

            }

        } catch (JSONException e) {
            e.printStackTrace();
        }

        //for (int i=0;i<prod_list.size();i++) System.out.println(prod_list.get(i));
        Products= prod_list;
    }

    public static void fetchProductsLocal() throws ClassNotFoundException, SQLException {
        Class.forName("org.mariadb.jdbc.Driver") ;
        Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/CMS?generateSimpleParameterMetadata=true", "root", "") ;
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

    public static void fetchClients(){
        //TODO fetch Birthday
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
                    tmpClient.setWishlist(new ExplicitWishList(-1));
                    clients.put(tmpClient.getClientID(),tmpClient);
                }
            }
        } catch (JSONException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void fetchCampaigns(){

    }

    public static void fetchCampaignsLocal() throws ClassNotFoundException, SQLException {
        Class.forName("org.mariadb.jdbc.Driver") ;
        Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/CMS?generateSimpleParameterMetadata=true", "root", "") ;
        Statement stmt = conn.createStatement() ;
        String query = "SELECT * FROM `ad_offers`;" ;
        ResultSet rs = stmt.executeQuery(query) ;


        ArrayList<AdCampaing> tmpList = new ArrayList<>();
        try {
            while (rs.next()) {
                AdCampaing tmp = new AdCampaing(rs.getInt("id"));
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
                tmpList.add(tmp);

            }
        }catch (Exception ex){
            System.out.println(ex.toString());
        }
        campaings= tmpList;

    }

    private static void fetchClientsLocal() throws ClassNotFoundException, SQLException {
        Class.forName("org.mariadb.jdbc.Driver") ;
        Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/CMS?generateSimpleParameterMetadata=true", "root", "") ;
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


                tmp.setWishlist(new ExplicitWishList(-1));
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
            //TODO elegxos ean einai compatible me to campaing
            if (campaings.get(i).getProductCategoryID() == assoc.getProductCategoryID()) {
                multiplier+=0.1;
            //    System.out.println("Campaing id->" + campaings.get(i).getCampaignID()+ " matches category");
            }
            if (campaings.get(i).getProductID()==assoc.getProductID()){
                multiplier+=0.4;
            //    System.out.println("Campaing id->" + campaings.get(i).getCampaignID()+ " matches productID");
            }
        }



        Client tmpClient = clients.get(assoc.getClientID());

        whishAcc+= tmpClient.getWishlist().checkCategoryID(assoc.getProductCategoryID());

        if (tmpClient.getWishlist().checkProduct(assoc.getProductID())) {
            whishAcc += 5 ;
       //     System.out.println("Product-> " + assoc.getProductID() + " in whishlist.");
        }
        double retRel= oldRel+ multiplier*(whishAcc+newRel);

      //  System.out.println("Old->" + oldRel + " added->" +multiplier*(whishAcc+newRel) );
        return  retRel;

    }

    public static HashMap<Integer,Client> getClients(){return clients;}

    public static ArrayList<AdCampaing> getCampaigns() {
        return campaings;
    }

    public static ArrayList<Product> getProducts(){
        return Products;
    }

}