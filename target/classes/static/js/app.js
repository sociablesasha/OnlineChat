var stompClient = null;
var name = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    $("#send").prop("disabled", !connected);
}

function connect() {
    name = prompt("이름을 입력해주세요.");

    var socket = new SockJS('/websocket');
    stompClient = Stomp.over(socket);
    stompClient.debug = null;

    stompClient.connect({}, function () {
        setConnected(true);

        stompClient.subscribe('/receive/member', function (members) {
            showMember(members.body);
        });

        stompClient.subscribe('/receive/chats', function (chat) {
            showChat(chat.body);
        });

        stompClient.send("/send/in", {}, JSON.stringify({'name': name}));
    });
}

function disconnect() {
    stompClient.send("/send/out", {}, JSON.stringify({'name': name}));

    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendChat() {
    stompClient.send("/send/chats", {}, JSON.stringify({'name': name, 'content': $("#content").val()}));
    $("#content").val("");
}

function showChat(message) {
    $("#chats").append("<tr><td>" + message + "</td></tr>");
 }

function showMember(members) {
    $("#members").text("");
    JSON.parse(members).forEach(function (member) {
        $("#members").append("<tr><td>" + member + "</td></tr>");
    });
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendChat(); });
});