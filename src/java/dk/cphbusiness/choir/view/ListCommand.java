package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.dto.ArtistSummary;
import dk.cphbusiness.choir.contract.dto.MaterialSummary;
import dk.cphbusiness.choir.contract.dto.MemberSummary;
import dk.cphbusiness.choir.contract.dto.MusicSummary;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest; 

public class ListCommand extends TargetCommand {

    public ListCommand (String target) {
        super(target);
    }

    @Override
    public String execute (HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        Collection<ArtistSummary> artists = 
                ChoirFactory.getInstance().getManager().listArtists();
//        Collection<MaterialSummary> materials = 
//                ChoirFactory.getInstance().getManager().listMaterials();
        Collection<MemberSummary> members =
                ChoirFactory.getInstance().getManager().listMembers();
//        Collection<MusicSummary> music= 
//                ChoirFactory.getInstance().getManager().listMusic();        
        
//        request.setAttribute("artists", artists);
//        request.setAttribute("materials", materials);
        request.setAttribute("members", members);
//        request.setAttribute("music", music);
        return super.execute(request);
    }
}
