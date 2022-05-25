package kampia.esperLocation;

import com.espertech.esper.common.client.EPCompiled;
import com.espertech.esper.common.client.EventBean;
import com.espertech.esper.common.client.configuration.Configuration;
import com.espertech.esper.runtime.client.EPDeployment;
import com.espertech.esper.runtime.client.EPRuntime;
import com.espertech.esper.runtime.client.EPRuntimeProvider;
import com.espertech.esper.runtime.client.EPStatement;
import kampia.esperLocation.Data.CMSApiConnector;
import kampia.esperLocation.EventTypes.ClientInterested;
import kampia.esperLocation.EventTypes.ClientInterestedCat;
import kampia.esperLocation.RabbitMQ.RabbitMQconnector;
import kampia.esperLocation.Subscribers.*;
import kampia.esperLocation.config.EsperConfig;
import kampia.esperLocation.utils.EPLUtil;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class EsperMain {

    public static  ArrayList<ClientInterested> ClientsInterests= new  ArrayList();
    public static ArrayList<ClientInterestedCat> ClientsInterestsCat= new ArrayList<>();

    public static CMSApiConnector connector = null;

    public static EPCompiled compiled;
    public static Configuration configuration;
    public static EPRuntime runtime;
    public static EPDeployment deployment;

    public void run() throws Exception {
        CMSApiConnector.InitCMSApiConnector();

        configuration = EsperConfig.getConfiguration();

        compiled = EPLUtil.loadQueries(configuration);

        runtime = EPRuntimeProvider.getRuntime(EsperConfig.RUNTIME_URI, configuration);


        deployment = EPLUtil.deploy(runtime, compiled);

        listenToSampleStatement(runtime, deployment);


        RabbitMQconnector mQconnector = new RabbitMQconnector(runtime);
        mQconnector.run();


    }


    private void listenToSampleStatement(EPRuntime runtime, EPDeployment deployment) {
       EPStatement statement = runtime.getDeploymentService().getStatement(deployment.getDeploymentId(), "closeNtimes");

        statement.addListener((newData, oldData, sta, run) -> {

            for (EventBean nd : newData) {

                CloseNtimesEventSubscriber sub = new CloseNtimesEventSubscriber();
                sub.output(nd);
            }
        });


        statement = runtime.getDeploymentService().getStatement(deployment.getDeploymentId(), "associate");

        statement.addListener((newData, oldData, sta, run) -> {
            for (EventBean nd : newData) {
                tickCounterEventSubscriber sub = new tickCounterEventSubscriber();
                sub.output(nd);
            }
        });
        statement = runtime.getDeploymentService().getStatement(deployment.getDeploymentId(), "UpdateToken");

        statement.addListener((newData, oldData, sta, run) -> {
            for (EventBean nd : newData) {
                UpdateTokenSubscriber sub = new UpdateTokenSubscriber();
                try {
                    sub.output(nd);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });

        statement = runtime.getDeploymentService().getStatement(deployment.getDeploymentId(), "updateRel");

        statement.addListener((newData, oldData, sta, run) -> {
            for (EventBean nd : newData) {
                updateRelProdSubscriber sub = new updateRelProdSubscriber();
                try {
                    sub.output(nd);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });

        statement = runtime.getDeploymentService().getStatement(deployment.getDeploymentId(), "passThresholdProd");

        statement.addListener((newData, oldData, sta, run) -> {
            for (EventBean nd : newData) {
                RelProdSubscriber sub = new RelProdSubscriber();
                try {
                    sub.output(nd);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });

        statement = runtime.getDeploymentService().getStatement(deployment.getDeploymentId(), "passThresholdCat");

        statement.addListener((newData, oldData, sta, run) -> {
            for (EventBean nd : newData) {
                RelCatSubscriber sub = new RelCatSubscriber();
                try {
                    sub.output(nd);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });



    }
}
