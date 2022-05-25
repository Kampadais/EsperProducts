package kampia.esperLocation.RabbitMQ;


import com.espertech.esper.runtime.client.EPRuntime;
import com.rabbitmq.client.*;
import kampia.esperLocation.EventTypes.Location;
import kampia.esperLocation.EventTypes.NotifObject;
import kampia.esperLocation.config.Configurations;
import kampia.esperLocation.config.CustomDeserializer;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.TimeoutException;

public class RabbitMQconnector {


    public static EPRuntime runtime;
    public static HashMap<Integer , ArrayList<Location>> ClientsLoc = new HashMap<>();


    public RabbitMQconnector(EPRuntime runtime){
        RabbitMQconnector.runtime =runtime;
    }

    public void run() throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost(Configurations.RabbitMQHost);
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();


        channel.queueDeclare(Configurations.Reading_Queue_RabbitMQ, false, false, false, null);
        System.out.println(" [*] Waiting for messages. To exit press CTRL+C");

       DeliverCallback deliverCallback = (consumerTag, delivery) -> {

            String message = new String(delivery.getBody(), StandardCharsets.UTF_8);

            Location tmpev = (Location) new CustomDeserializer<>().deserialize(delivery.getBody());
            if (ClientsLoc.get(tmpev.getClientID())==null){
                ArrayList<Location> tmp = new ArrayList<>();
                tmp.add(tmpev);
                ClientsLoc.put(tmpev.getClientID(), tmp);
            }else ClientsLoc.get(tmpev.getClientID()).add(tmpev);


            checkSize(delivery);
           //runtime.getEventService().sendEventBean(tmpev, delivery.getProperties().getContentType());
       };
        channel.basicConsume(Configurations.Reading_Queue_RabbitMQ, true, deliverCallback, consumerTag -> { });
    }

    private void checkSize(Delivery delivery) {
        ClientsLoc.forEach(
                (key, value)
                        -> {
                    if (value.size()>=Configurations.No_Batch_Events) {
                       for (int i=0;i<value.size();i++){
                           runtime.getEventService().sendEventBean(value.get(i), delivery.getProperties().getContentType());
                       }
                       value.clear();
                    }
                }
                );

    }

    public EPRuntime getRuntime() {
        return runtime;
    }

    public static void SendForNotif(NotifObject RMQtoSend ){


        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost(Configurations.RabbitMQHost);
        try (Connection connection = factory.newConnection();
             Channel channel = connection.createChannel()) {
            channel.queueDeclare(Configurations.Output_Queue_RabbitMQ, false, false, false, null);

            AMQP.BasicProperties messageProperties = new AMQP.BasicProperties.Builder()
                    .contentType("NotObject")
                    .build();
            channel.basicPublish("", Configurations.Output_Queue_RabbitMQ, messageProperties, RMQtoSend.serialize(RMQtoSend));


        } catch (IOException | TimeoutException e) {
            e.printStackTrace();
        }


    }
}
