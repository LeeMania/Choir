package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberAuthentication;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.contract.eto.NoSuchMemberException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PassCommand extends TargetCommand {

    public PassCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        MemberAuthentication memAuth = (MemberAuthentication) request.getSession().getAttribute("authentication");
        long id = memAuth.getId();
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
