package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.contract.eto.NoSuchMemberException;
import javax.servlet.http.HttpServletRequest;

public class ViewCommand extends TargetCommand {

    public ViewCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        long id = Long.parseLong(request.getParameter("id"));
        try {
            MemberDetail member = manager.findMember(id);
            request.setAttribute("member", member);
        } catch (NoSuchMemberException nsme) {
            throw new CommandException("View Command", nsme.getMessage()
                    + " id: " + nsme.getId());
        }
        return super.execute(request);
    }
}
