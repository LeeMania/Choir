package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.contract.dto.RoleSummary;
import dk.cphbusiness.choir.contract.dto.VoiceSummary;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpSession;

public class CreateCommand extends TargetCommand {

    public CreateCommand (String target) {
        super(target);
    }

    @Override
    public String execute (HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
//        Member member = new Member(null, null, null, null, null, null, null, null, null, null);
//        MemberDetail memberDetail = new MemberDetail(member.getId(), null, null, null, true, true, null, null, null, null, null, null, null, null);
        MemberDetail memberDetail = new MemberDetail();
        request.setAttribute("member", memberDetail);

        Collection<RoleSummary> roles = ChoirFactory.getInstance().getManager().listRoles();
        request.setAttribute("roles", roles);

        Collection<VoiceSummary> voices = ChoirFactory.getInstance().getManager().listVoices();
        request.setAttribute("voices", voices);
        
        request.setAttribute("status", "Create New Member");

        return super.execute(request);
    }
}
