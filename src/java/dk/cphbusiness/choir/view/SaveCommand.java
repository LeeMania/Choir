package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberAuthentication;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.contract.eto.AuthenticationException;
import dk.cphbusiness.choir.contract.eto.NoSuchMemberException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class SaveCommand extends TargetCommand {

    private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public SaveCommand(String target) {
        super(target);
    }

    private boolean valDate(String bDay) {
        return true;
//        boolean valDate = true;
//        Date now = new Date();
//        int year = Integer.parseInt(bDay.substring(0, 3));
//        int month = Integer.parseInt(bDay.substring(5, 6));
//        int date = Integer.parseInt(bDay.substring(8, 9));
//
//        if ((year + 18) > now.getYear()) {
//            valDate = false;
//        } else if ((year + 18) == now.getYear()) {
//            if (month > now.getMonth()) {
//                valDate = false;
//            } else if (month == now.getMonth()) {
//                if (date > now.getDate()) {
//                    valDate = false;
//                }
//            }
//        }
//        return valDate;
    }

    private boolean valEmail(String email) {
        boolean result = true;
        try {
            InternetAddress emailAddr = new InternetAddress(email);
            emailAddr.validate();
        } catch (AddressException ex) {
            result = false;
        }
        return true;
//        return result;
    }

    @Override
    public String execute(HttpServletRequest request) throws dk.cphbusiness.choir.view.CommandException {
        System.out.println("SaveCommand.execute(...)");
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        MemberDetail m;
        long id = 0;

        if (!"".equalsIgnoreCase(request.getParameter("id"))) {
            id = Long.parseLong(request.getParameter("id"));
        }

        String name = request.getParameter("fName") + " " + request.getParameter("lName");
        String bDay = request.getParameter("bDay");
        String email = request.getParameter("email");
        System.out.println("SaveCommand.execute(1)");
        if (request.getParameter("fName").length() > 1 && request.getParameter("lName").length() > 1 && valDate(bDay) && valEmail(email)) {
            try {
                System.out.println("SaveCommand.execute(2)");

                if (id == 0) {
                    m = new MemberDetail();
                } else {
                    m = manager.findMember(id);
                }

                m.setFirstName(request.getParameter("fName"));
                m.setLastName(request.getParameter("lName"));
                m.setVoiceCode(Integer.parseInt(request.getParameter("voice")));
                if (request.getParameterValues("role") != null) {
                    String[] roles = request.getParameterValues("role");
                    m.setRoleCodes(roles);
                } else {
                    String[] roles = new String[0];
                    m.setRoleCodes(roles);
                }
                m.setStreet(request.getParameter("street"));
                m.setZipCode(request.getParameter("zipCode"));
                m.setCity(request.getParameter("city"));
                m.setTitle(request.getParameter("title"));
                Date date = dateFormat.parse(bDay);
                m.setDateOfBirth(date);
                m.setEmail(email);
                m.setPhone(request.getParameter("phone"));

                MemberAuthentication memAuth = new MemberAuthentication(id, name);
                System.out.println("SaveCommand.execute(9)");

                manager.saveMember(memAuth, m);
            } catch (NoSuchMemberException nsce) {
                throw new CommandException("Save Command", nsce.getMessage()
                        + " id: " + nsce.getId());
            } catch (AuthenticationException ae) {
                throw new CommandException("Save - Auth Command", ae.getMessage());
            } catch (ParseException ex) {
                throw new CommandException("Save Command", "Can't parse date of birth");
            }
        }
        return super.execute(request);
    }
}
