package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.eto.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCommand extends TargetCommand {

    public LoginCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        HttpSession session = request.getSession();
        try {
            session.setAttribute("authentication", manager.login(request.getParameter("userName"), request.getParameter("password")));   //Sender MemberAuthentication objektet videre
        } catch (AuthenticationException ae) {
            if (request.getHeader("user-agent").toLowerCase().contains("mobile")) {
                return "loginMobile.jsp";
            } else {
                return "login.jsp";
            }
        }

        return super.execute(request); //To change body of generated methods, choose Tools | Templates.
    }
}
