package kampia.esperLocation.RabbitMQ;


import com.espertech.esper.runtime.client.EPRuntime;
import com.rabbitmq.client.*;
import kampia.esperLocation.EventTypes.NotifObject;
import kampia.esperLocation.config.CustomDeserializer;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeoutException;

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
        };
        channel.basicConsume(QUEUE_NAME, true, deliverCallback, consumerTag -> { });
    }

    public EPRuntime getRuntime() {
        return runtime;
    }

    public static void SendForNotif(NotifObject RMQtoSend ){

        String QueueName= "Notification_queue";
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("localhost");
        try (Connection connection = factory.newConnection();
             Channel channel = connection.createChannel()) {
            channel.queueDeclare(QueueName, false, false, false, null);

            AMQP.BasicProperties messageProperties = new AMQP.BasicProperties.Builder()
                    .contentType("Location")
                    .build();
            channel.basicPublish("", QueueName, messageProperties, RMQtoSend.serialize(RMQtoSend));


        } catch (IOException | TimeoutException e) {
            e.printStackTrace();
        }


    }
}
