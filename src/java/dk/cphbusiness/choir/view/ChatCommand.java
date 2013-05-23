package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.dto.MemberAuthentication;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpSession;

public class ChatCommand extends TargetCommand {

    public ChatCommand (String target) {
        super(target);
    }

    @Override
    public String execute (HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        HttpSession session = request.getSession();
        MemberAuthentication memAuth = (MemberAuthentication) session.getAttribute("authentication");
        String username = memAuth.getName();
        request.setAttribute("username", username);
        return super.execute(request);
    }
}
