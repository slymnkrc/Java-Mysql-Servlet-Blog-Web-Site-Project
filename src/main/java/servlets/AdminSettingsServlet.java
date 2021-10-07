package servlets;

import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="adminSettingsServlet" , value = "/admin-settings-servlet")
public class AdminSettingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(Util.base_url+"admin_settings.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oldPass = req.getParameter("oldPass");
        String newPass = req.getParameter("newPass");

        int aid = (int) req.getSession().getAttribute("aid");

        DBUtil util = new DBUtil();

        int status = util.updatePassword(oldPass,newPass,aid);

        if(status>0){
            resp.sendRedirect(Util.base_url+"admin_settings.jsp");

        }else{

            req.setAttribute("updatePasswordError","İşlem Başarısız .. ");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin_settings.jsp");
            dispatcher.forward(req,resp);

        }



    }
}
