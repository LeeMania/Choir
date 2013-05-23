package servlet;

import chat.EchoApplication;
import com.sun.grizzly.websockets.WebSocketEngine;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(name = "ApplicationLauncer", urlPatterns = {"/ApplicationLauncer"}, loadOnStartup = 1)
public class ApplicationLauncer extends HttpServlet {
    EchoApplication echo = new EchoApplication();

    @Override
    public void init() throws ServletException {
        WebSocketEngine.getEngine().register(echo);
    }

    @Override
    public void destroy() {
        WebSocketEngine.getEngine().unregister(echo);
    }
}
