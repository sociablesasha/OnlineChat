<!DOCTYPE html>
<html>
<head>
    <title>Hello WebSocket</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <script src="/resources/css/app.css"></script>
    <script src="/resources/js/app.js"></script>
</head>
<body>

<form>
    <div>
        <label for="connect">WebSocket connection:</label>
        <button id="connect" type="submit">Connect</button>
        <button id="disconnect" type="submit" disabled="disabled">Disconnect
        </button>
    </div>
</form>

<form>
    <div>
        <label for="name">What is your name?</label>
        <input type="text" id="name" placeholder="Your name here...">
    </div>
    <button id="send" type="submit">Send</button>
</form>

<table id="conversation">
    <thead>
    <tr>
        <th>Greetings</th>
    </tr>
    </thead>
    <tbody id="greetings">
    </tbody>
</table>
</body>
</html>
