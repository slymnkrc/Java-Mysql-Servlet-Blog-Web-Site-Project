package servlets;

import props.Contents;
import utils.DB;
import utils.DBUtil;
import utils.Util;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "contentsUpdateServlet", value = "/content-update")
public class ContentsUpdateServlet extends HttpServlet{


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        boolean cidStatus = req.getSession().getAttribute("updateCid") != null;
        if( cidStatus ){
            String category = req.getParameter("category");
            String title = req.getParameter("title");
            String detail = req.getParameter("detail");
            int cid = (int) req.getSession().getAttribute("updateCid");

            DBUtil util = new DBUtil();
            int status = util.updateContent(category,title,detail,cid);

            req.getSession().removeAttribute("updateCid");
        }

        resp.sendRedirect(Util.base_url + "dashboard_edit.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int cid = Integer.parseInt(req.getParameter("cid"));
        req.getSession().setAttribute("updateCid",cid);
        DBUtil util = new DBUtil();
        Contents contents = util.getContentByCID(cid);

        req.setAttribute("contents",contents);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/content_update.jsp");
        dispatcher.forward(req,resp);
    }
}
