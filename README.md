# PickUp SpringBoot REST API **Facebook**
## PickUp
### Purpose
1. Understand WebSocket. 
2. ... MessageBroker
3. ... SockJS
4. ... STOMP

### Technical Stack
* Spring Boot(Maven)
* WebSocket
* MessageBroker
* SockJS
* STOMP


## Spring Boot
**HttpRequest -> Controller -> View**
### Applicatin.java
Main Method in Spring Boot.
```java
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
```

### WebSocketConfig.java
WebSocketMessageBroker.
```java
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/receive");
        config.setApplicationDestinationPrefixes("/send");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/websocket").withSockJS();
    }

}
```

### TalkController.java
Talk Controller
```java
@Controller
public class TalkController {

    // Member
    static ArrayList<String> members = new ArrayList<>();

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @MessageMapping("/in")
    @SendTo("/receive/member")
    public ArrayList<String> in (Talk talk) {
        members.add(talk.getName());
        return members;
    }

    @MessageMapping("/out")
    @SendTo("/receive/member")
    public ArrayList<String> out (Talk talk) {
        members.remove(talk.getName());
        return members;
    }

    @MessageMapping("/chats")
    @SendTo("/receive/chats")
    public String talk(Talk talk) {
        return talk.getName() + " : " + talk.getContent();
    }

}
```


## Photo
### Main
<img width="1680" alt="2018-09-19 3 50 30" src="https://user-images.githubusercontent.com/31611484/45735697-bddc2a80-bc23-11e8-88a1-34c2dcc42e99.png">
<img width="1680" alt="2018-09-19 3 48 44" src="https://user-images.githubusercontent.com/31611484/45735656-971df400-bc23-11e8-826e-d4e16961c064.png">


## Histories
    2018.09.18. ~ 2018.09.19. WebSocket MessageBroker
