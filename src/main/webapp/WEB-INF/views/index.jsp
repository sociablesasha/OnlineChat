<!DOCTYPE html>
<html>

<head>
    <title>Online Chat</title>
    <meta charset="UTF-8">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <link rel="stylesheet" href="/resources/css/app.css">
    <script charset="UTF-8" src="/resources/js/app.js"></script>
</head>

<body>
<div class="wrapper">
    <div class="connect">
        <form>
            <button id="connect" type="submit">Connect</button>
            <button id="disconnect" type="submit" disabled="disabled">Disconnect</button>
        </form>
    </div>

    <div class="member">
        <table>
            <thead>
            <tr>
                <th>Member</th>
            </tr>
            </thead>
            <tbody id="members">
            </tbody>
        </table>
    </div>
</div>

<div class="wrapper">
    <div class="talk-receive">
        <table>
            <thead>
            <tr>
                <th>Chats</th>
            </tr>
            </thead>
            <tbody id="chats">
            </tbody>
        </table>
    </div>

    <div class="talk-send">
        <form>
            <input type="text" id="content" placeholder="Your name here...">
            <button id="send" type="submit" disabled>Send</button>
        </form>
    </div>
</div>
</body>

</html>