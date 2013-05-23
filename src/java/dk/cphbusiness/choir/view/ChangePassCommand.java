package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.eto.AuthenticationException;
import javax.servlet.http.HttpServletRequest;

public class ChangePassCommand extends TargetCommand{

    public ChangePassCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        try {
            if (request.getParameter("newPass").compareTo(request.getParameter("newPassAgain"))==0)
                    manager.changePassword(request.getParameter("oldPass"),  request.getParameter("newPass"));
            else{
                return "changePassword.jsp";
            }
        } catch (AuthenticationException ex) {
           return "changePassword.jsp"; 
        }
        return super.execute(request); //To change body of generated methods, choose Tools | Templates.
    }
    
}
