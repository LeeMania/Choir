/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dk.cphbusiness.choir.ws.KrakClient;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tore
 */
@WebServlet(name = "AjaxServlet", urlPatterns = {"/AjaxServlet"})
public class AjaxServlet_FindPhone extends HttpServlet {

@Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("Application/JSON;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String phone = request.getParameter("phone");
//        JSONArray result = new KrakClient().findPhone_JSON(JSONArray.class, phone);
        String result = new KrakClient().findPhone_JSON(String.class, phone);
        out.println(result);   
    }


}
