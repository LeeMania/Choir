package chat;

import com.sun.grizzly.tcp.Request;
import com.sun.grizzly.websockets.ProtocolHandler;
import com.sun.grizzly.websockets.WebSocket;
import com.sun.grizzly.websockets.WebSocketApplication;
import com.sun.grizzly.websockets.WebSocketListener;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EchoApplication extends WebSocketApplication {

    @Override
    public boolean isApplicationRequest(Request request) {
        if (request.requestURI().toString().endsWith("/chat")) {
            return true;
        }
        return false;
    }

    @Override
    public WebSocket createWebSocket(ProtocolHandler protocolHandler, WebSocketListener... listeners) {
        return new MemberWebSocket(protocolHandler, listeners);
        //If needed, you could have created your own derived WebSocket class adn initiate it here
//        return super.createWebSocket(protocolHandler, listeners);
    }

    @Override
    public void onConnect(WebSocket socket) {
        super.onConnect(socket);
        Logger.getLogger(EchoApplication.class.getName()).log(Level.INFO, "onConnect");
    }

    @Override
    public void onMessage(WebSocket socket, String text) {
        super.onMessage(socket, text);
//        socket.send(text);
        Set<WebSocket> allSockets = this.getWebSockets();
        if (text.startsWith("Username: ")) {
            MemberWebSocket memberSocket = (MemberWebSocket) socket;
            memberSocket.setUsername(text.substring(10));
            String members = "";
            for (WebSocket webSocket : allSockets) {
                members += ((MemberWebSocket) webSocket).getMemberName() + "\n";
            }

            for (WebSocket webSocket : allSockets) {
                webSocket.send("Online:" + members);
            }
        }else if ("Close".equals(text)){
            String members = "";
            for (WebSocket webSocket : allSockets) {
                members += ((MemberWebSocket) webSocket).getMemberName() + "\n";
            }

            for (WebSocket webSocket : allSockets) {
                webSocket.send("Online:" + members);
            }
        }else {
            text = ((MemberWebSocket) socket).getMemberName()+": "+text;
            for (WebSocket socketR : allSockets) {
                socketR.send(text);
            }
        }
    }
}
