package dk.cphbusiness.choir.view;

public class CommandException extends Exception {
    private String command;

    public CommandException (String command, String message) {
        super(message);
        this.command = command;
    }

    public String getCommand () {
        return command;
    }
}
