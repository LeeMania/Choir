package dk.cphbusiness.choir.view;

import javax.servlet.http.HttpServletRequest; 

public class TargetCommand implements Command {

    private String target;

    public TargetCommand (String target) {
        this.target = target;
    }

    @Override
    public String execute (HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        return target;
    }
}
