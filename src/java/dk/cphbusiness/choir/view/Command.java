package dk.cphbusiness.choir.view;

import javax.servlet.http.HttpServletRequest; 

public interface Command {

    public String execute (HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException;
}
