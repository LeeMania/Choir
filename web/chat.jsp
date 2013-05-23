<!DOCTYPE html>
<html>
    <head>
        <title>Glassfish WebSocket Chat</title>
        <link rel="stylesheet" type="text/css" href="StyleSheet.css">   <!--StyleSheet-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <script type="text/javascript">
            var ws;
            var username = "${username}";
            var $textarea;
            var $users;
            var isChecked = false;

            $(document).ready(function() {
                if (!("WebSocket" in window)) {
                    alert("Your browser does not support WebSockets");
                    return;
                }


                var uri = "ws://" + location.host + "/ChoirFrontend/chat";
                ws = new WebSocket(uri);
                //        ws = new WebSocket("ws://echo.websocket.org/");

                ws.onopen = function(e) {
                    ws.send("Username: " + username);
                    $textarea = $('#messages');
                    text = "Connected as " + username + "\n";
                    if (localStorage.chatLog) {
                        $textarea.val(localStorage.chatLog + "\n" + text);
                    } else {
                        $textarea.val(text);
                    }
                };

                ws.onmessage = function(e) {
                    if (e.data.indexOf("Online:") == 0) {
                        var users = e.data.split(":")[1];
                        $users = $('#users');
                        $users.val(users);
                    } else {
                        $textarea = $('#messages');
                        if (localStorage.chatLog) {
                            localStorage.chatLog = localStorage.chatLog + "\n" + e.data;
                        } else {
                            localStorage.chatLog = e.data;
                        }
                        $textarea.val($textarea.val() + e.data + "\n");
                    }
                };
            });

            function close() {
                if (ws !== undefined)
                    ws.close();
            }
            window.onclose = close();

            function sendMessage() {
                var message = $('#message').val();
                ws.send(message);
                $('#message').val('');
            }

            function clearText() {
                if (isChecked) {
                    localStorage.clear();
                }
                $textarea.val("");
            }

            function check() {
                if (isChecked) {
                    isChecked = false;
                } else {
                    isChecked = true;
                }
            }

        </script>
    </head>
    <body>
        <div >
        </div>

        <div>
            <textarea id="messages" rows="16" cols="48" readonly="readonly" style="resize: none"></textarea>
            <textarea id="users" rows="16" cols="20" readonly="readonly" style="resize: none"></textarea>
        </div>
        <form name="message" action="">
            <input name="usermsg" type="text" id="message" size="60" /> 
            <input type="button" value="Send..." onclick="sendMessage();" />
        </form>
        <div>
            <button onclick="clearText();">Clear textarea</button>
            <p>and log:<input type="checkbox" onclick="check();"></p>
        </div>
        <div>
            <ul>

            </ul>
        </div>
    </div>
</body>
</html>
