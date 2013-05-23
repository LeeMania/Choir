package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.control.DummyChoirManager;
import java.util.HashMap;
import java.util.Map; 
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ChoirFactory {
    ChoirManager manager = lookupChoirBeanRemote();
    private static ChoirFactory instance = null;
    private Map<String, Command> commands = new HashMap<String, Command>();
//    private ChoirManager manager = new DummyChoirManager();
    
    
    
    private ChoirFactory () {
        commands.put("main", new TargetCommand("main.jsp"));
        commands.put("back", new TargetCommand("main.jsp"));
        commands.put("cancelEdit", new ListCommand("membersList.jsp"));
        commands.put("memList", new ListCommand("membersList.jsp"));
        commands.put("artList", new ListCommand("artistsList.jsp"));
        commands.put("change", new ChangeCommand("memberEdit.jsp"));
        commands.put("save", new SaveCommand("main.jsp"));
        commands.put("create", new CreateCommand("memberEdit.jsp"));
        commands.put("view", new ViewCommand("memberView.jsp"));
        commands.put("viewArt", new ViewArtCommand("artistView.jsp"));
        commands.put("login", new LoginCommand("main.jsp"));
        commands.put("password", new PassCommand("changePassword.jsp"));
        commands.put("changePass", new ChangePassCommand("login.jsp"));
        commands.put("chat", new ChatCommand("chat.jsp"));
        
        //Mobile sites
        commands.put("mainMob", new TargetCommand("mainMobile.jsp"));
        commands.put("backMob", new TargetCommand("mainMobile.jsp"));
        commands.put("cancelEditMob", new ListMobileCommand("membersListMobile.jsp"));
        commands.put("memListMob", new ListMobileCommand("membersListMobile.jsp"));
        commands.put("changeMob", new ChangeCommand("memberEditMobile.jsp"));
        commands.put("saveMob", new SaveCommand("mainMobile.jsp"));
        commands.put("createMob", new CreateCommand("memberEditMobile.jsp"));
        commands.put("loginMob", new LoginCommand("mainMobile.jsp"));
        commands.put("passwordMob", new PassCommand("changePasswordMobile.jsp"));
        commands.put("changePassMob", new ChangePassCommand("loginMobile.jsp"));
    }

    public static ChoirFactory getInstance () {
        if (instance == null) {
            instance = new ChoirFactory();
        }
        return instance;
    }

    public Command findCommand (String commandKey) {
        if (commandKey == null) {
            commandKey = "main";
        }
        return commands.get(commandKey);
    }

    public ChoirManager getManager () {
        return manager;
    }

    private ChoirManager lookupChoirBeanRemote() {
        try {
            Context c = new InitialContext();
            return (ChoirManager) c.lookup("java:global/ChoirBackend/ChoirBean!dk.cphbusiness.choir.contract.ChoirManager");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

//    private ChoirManager lookupChoirBeanRemote() {
//        try {
//            Context c = new InitialContext();
//            return (ChoirManager) c.lookup("java:global/NewBackend/ChoirBean!dk.cphbusiness.choir.contract.ChoirManager");
//        } catch (NamingException ne) {
//            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
//            throw new RuntimeException(ne);
//        }
//    }
}
