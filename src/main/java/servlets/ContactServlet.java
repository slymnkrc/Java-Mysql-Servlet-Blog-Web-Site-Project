package servlets;

import props.Contact;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="contactServlet", value = "/contact-servlet")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(Util.base_url+"contact.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String message = req.getParameter("message");

        Contact contact = new Contact();

        contact.setName(name);
        contact.setEmail(email);
        contact.setPhone(phone);
        contact.setMessage(message);

        DBUtil util = new DBUtil();

        int status = util.contactInsert(contact);

        if (status > 0) {
            resp.sendRedirect(Util.base_url + "contact.jsp");
        } else {
            String errorMessage = "";
            if (status == 0) {
                errorMessage = "İletişim formu gönderme sırasında bir hata oluştu!";
            }

            req.setAttribute("contactInsertError", errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contact.jsp");
            dispatcher.forward(req, resp);
        }



    }
}
