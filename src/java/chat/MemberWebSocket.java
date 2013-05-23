package chat;

import com.sun.grizzly.websockets.DefaultWebSocket;
import com.sun.grizzly.websockets.ProtocolHandler;
import com.sun.grizzly.websockets.WebSocketListener;

public class MemberWebSocket extends DefaultWebSocket {

    private String username = "UnknownUser";

    public MemberWebSocket(ProtocolHandler protocolHandler, WebSocketListener... listeners) {
        super(protocolHandler, listeners);
    }

    public String getMemberName() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
}
