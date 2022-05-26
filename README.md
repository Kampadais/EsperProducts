# EsperProducts


This is a project that based on the position of clients in a retail place finds patterns between them and products. It takes account Implicit and explicit whishlist of the clients and current offers that the store runs.

This is part of a bigger project that is capable of sending push notifications to clients when it seems beneficial based on collected data.

## Prerequisites

* [Esper Dependacy](https://www.espertech.com/esper/esper-downloads/) - Complex event proccecing language, compiler and runtime 
* [RabbitMQ](https://rabbitmq.com/download.html) - sending and receiving messages
* [XAMPP](https://www.apachefriends.org/download.html) - Storing and fetching data for analysis


## Usage guide

1. Clone this repository localy
2. Run XAMPP servers
3. Import **ProximiotDB.sql** and **CMS.sql** using phpMyadmin internal tool
4. Start the RabbitMQ service
5. Open **LocationEsper** and **LocationSenderRMQ** projects seperatly using IDE of your choice
6. Run **LocationEsper**

   If the above steps were executed correctly you will see this on your IDE terminal after some initialization info:
   
    ```[*] Waiting for messages. To exit press CTRL+C```
7. Run **LocationSenderRMQ**

After this the **LocationEsper** should print on terminal something like this :
```------------****------------      Client with sessionID: 8 staying close to a place 19 times ->  Lat:30.0  Lon: -10.0 Floor:1IDs :57        ------------****------------
------------****------------      Client with sessionID:8 and id 5 stays close to  product: 32        ------------****------------
------------****------------      Client with sessionID 8 is interested for product with id :32 relevance -> 16       ------------****------------
------------****------------      Client with sessionID: 8 staying close to a place 14 times ->  Lat:-52.0  Lon: 50.0 Floor:1IDs :78        ------------****------------
------------****------------      Client with sessionID:8 and id 5 stays close to  product: 33        ------------****------------
```
 
## Basic info

### Database scema 
 
  <img width="557" alt="Screenshot 2022-05-26 at 17 34 58" src="https://user-images.githubusercontent.com/45532178/170510113-ac64cbac-ea39-4994-a1fe-b95f0e650767.png">
      
  In order to initialize our program we are using the **Clients** , **Ad campaigns** and **Product** tables storing data on three arraylist.
  
  
  
  
### Program flow 

LocationEsper:

- Program initialization : The program reads the Esper language (EPL) queries from the ```queries.epl``` file and attach listeners to any queries we choose to
- Opening connection to RabbitMQ : We determine the host name and queue name where we want to listen
- The program waits idle for incoming messages

 LocationSenderRMQ
- The program opens a connection to localhost and fetch location data from the **ClientLocation** table
- For every entry a message is sent to a RabbitMQ queue

----
- After this LocationEsper program reads the incoming messages from the RabbitMQ queue and translates it to a Java class object and stores this event on the Arraylist of the specific client. 
- When the arraylist size passes a thresshold we tranfer this data from the Arraylist to Esper internal proccess machine in order to recognize any pattern based on the movement of the client.
- For any recognized pattern we can see the result on our console as prints about the nature of the pattern

The program also supports sending messages on a RabbitMQ queue in order fo

  
   
### Events

The main events that recognize patters are :

1. closeNtimes       : Determines if a client is staying around a place for continuous events 
2. associate         : Checks if the place where the client is around is close to a product
3. updateRel         : Updates the relevance between a client and a product
4. passThresholdProd : Checks if the relevance has passsed a user defined thresshold wich means that the client is interested about this product


## Configurations

Inside the project there is a Java class named Configurations where anyone can change the parameters in order to run the program using remote hosts. You can also change the thresshold about the size of the Arraylist. 

Many aspects of the code can be configurable in order to enchance accuracy of the program so the file will see future updates.



