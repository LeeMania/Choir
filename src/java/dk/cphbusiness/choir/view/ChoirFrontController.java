package dk.cphbusiness.choir.view;

import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(
        name = "CourseFrontController",
        urlPatterns = {"/Controller"})
public class ChoirFrontController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        String target = null;
        String commandKey = request.getParameter("command");
        HttpSession session = request.getSession();

//        String test = "lalamobile";
        
        try {
            if (session.getAttribute("authentication") == null && session.getAttribute("isAuth") != "true") {
                if (request.getHeader("user-agent").toLowerCase().contains("mobile")) {
//                if (test.toLowerCase().contains("mobile")){
                    target = "loginMobile.jsp";
                } else {
                    target = "login.jsp";
                }
                session.setAttribute("isAuth", "true");
            } else {
                Command command = ChoirFactory.getInstance().findCommand(commandKey);
                target = command.execute(request);
            }
        } catch (CommandException ce) {
            target = "fail.jsp";
            request.setAttribute("failure", ce);
        } catch (RuntimeException rte) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print("<html><body><h2>" + rte.getMessage() + "</h2><hr/><pre>");
            rte.printStackTrace(out);
            out.println("</pre></body></html>");
            return;
        }
        request.getRequestDispatcher(target).forward(request, response);
    }
}
