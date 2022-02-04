package kampia.esperLocation.RabbitMQ;


import com.espertech.esper.runtime.client.EPRuntime;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.DeliverCallback;
import kampia.esperLocation.Data.CMSApiConnector;
import kampia.esperLocation.config.CustomDeserializer;

import java.nio.charset.StandardCharsets;

public class RabbitMQconnector {

    private final static String QUEUE_NAME = "input";

    public static EPRuntime runtime;


    public RabbitMQconnector(EPRuntime runtime){
        RabbitMQconnector.runtime =runtime;
    }

    public void run() throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();


        channel.queueDeclare(QUEUE_NAME, false, false, false, null);
        System.out.println(" [*] Waiting for messages. To exit press CTRL+C");

       DeliverCallback deliverCallback = (consumerTag, delivery) -> {

            String message = new String(delivery.getBody(), StandardCharsets.UTF_8);

            CustomDeserializer deserializer= new CustomDeserializer();
            Object tmpev = deserializer.deserialize(delivery.getBody());



            runtime.getEventService().sendEventBean(tmpev, delivery.getProperties().getContentType());
           // System.out.println(" [x] Received '" + tmpev + "'");
        };
        channel.basicConsume(QUEUE_NAME, true, deliverCallback, consumerTag -> { });
    }

    public EPRuntime getRuntime() {
        return runtime;
    }
}
