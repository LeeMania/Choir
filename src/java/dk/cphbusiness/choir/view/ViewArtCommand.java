package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.ArtistDetail;
import dk.cphbusiness.choir.contract.eto.NoSuchArtistException;
import javax.servlet.http.HttpServletRequest;

public class ViewArtCommand extends TargetCommand {

    public ViewArtCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        long id = Long.parseLong(request.getParameter("id"));
        try {
            ArtistDetail artist = manager.findArtist(id);
            System.out.println(artist);
            request.setAttribute("artist", artist);
        } catch (NoSuchArtistException nsme) {
            throw new CommandException("View Command", nsme.getMessage()
                    + " id: " + nsme.getId());
        }
        return super.execute(request);
    }
}
