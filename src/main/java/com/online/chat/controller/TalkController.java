package com.online.chat.controller;

import com.online.chat.model.Talk;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
public class TalkController {

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