package kampia.esperLocation.config;

import com.espertech.esper.common.client.configuration.Configuration;
import com.espertech.esper.common.client.configuration.common.ConfigurationCommonDBRef;
import kampia.esperLocation.Data.CMSApiConnector;
import kampia.esperLocation.Data.Product;
import kampia.esperLocation.EventTypes.*;
import org.apache.commons.dbcp2.BasicDataSourceFactory;

import java.util.Properties;


public class EsperConfig {

   // private static final Logger log = LoggerFactory.getLogger(EsperConfig.class);

    public final static String RUNTIME_URI = "EsperKafkaExample";

    public static Configuration getConfiguration() {

        Configuration configuration = new Configuration();
        configuration.configure("esper.cfg.xml");

        configuration.getCommon().addEventType(Location.class);
        configuration.getCommon().addEventType(ClientCloseEvent.class);
        configuration.getCommon().addEventType(Associate.class);
        configuration.getCommon().addEventType(Product.class);
        configuration.getCommon().addEventType(ClientInterested.class);
        configuration.getCommon().addEventType(ClientInterestedCat.class);

        configuration.getCommon().addImport(Product.class);
        configuration.getCommon().addAnnotationImport(CMSApiConnector.class);

        //Database connection
        Properties props = new Properties();


        props.put("username", "root");
        props.put("password", "");
        props.put("driverClassName", "org.mariadb.jdbc.Driver");
        props.put("url", "jdbc:mariadb://127.0.0.1/CMS?generateSimpleParameterMetadata=true");
        props.put("initialSize", 2);
        props.put("validationQuery", "select 1 from dual");

        ConfigurationCommonDBRef configDB = new ConfigurationCommonDBRef();
// BasicDataSourceFactory is an Apache DBCP import
        configDB.setDataSourceFactory(props, BasicDataSourceFactory.class.getName());
        configDB.setConnectionLifecycleEnum(ConfigurationCommonDBRef.ConnectionLifecycleEnum.POOLED);

        configuration.getCommon().addDatabaseReference("CMS", configDB);



        //  log.info("Configuration is loaded ({})", configuration.toString());
        return configuration;
    }

}
