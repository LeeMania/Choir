package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberSummary;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest; 

public class ListMobileCommand extends TargetCommand {

    public ListMobileCommand (String target) {
        super(target);
    }

    @Override
    public String execute (HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        Collection<MemberSummary> members =manager.listMembers();
        request.setAttribute("members", members);
        request.setAttribute("manager", manager);
        return super.execute(request);
    }
}
