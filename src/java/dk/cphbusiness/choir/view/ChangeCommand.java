package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.contract.dto.RoleSummary;
import dk.cphbusiness.choir.contract.dto.VoiceSummary;
import dk.cphbusiness.choir.contract.eto.NoSuchMemberException;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;

public class ChangeCommand extends TargetCommand {

    public ChangeCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        long id = Long.parseLong(request.getParameter("id"));
        try {
            MemberDetail member = manager.findMember(id);
            request.setAttribute("member", member);

            String[] memRoles = member.getRoleCodes();
            request.setAttribute("memRoles", memRoles);

            Collection<RoleSummary> roles = ChoirFactory.getInstance().getManager().listRoles();
            request.setAttribute("roles", roles);

            Collection<VoiceSummary> voices = ChoirFactory.getInstance().getManager().listVoices();
            request.setAttribute("voices", voices);

            request.setAttribute("status", "Edit Member");

        } catch (NoSuchMemberException nsme) {
            throw new CommandException("Change Command", nsme.getMessage()
                    + " id: " + nsme.getId());
        }
        return super.execute(request);
    }
}
