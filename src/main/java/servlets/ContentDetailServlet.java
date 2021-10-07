package servlets;

import props.Contents;
import utils.DBUtil;
import utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="contentDetailServlet" , value = "/content-detail")
public class ContentDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cid = Integer.parseInt(req.getParameter("cid")) ;

        req.getSession().setAttribute("detailCid",cid);


        DBUtil util = new DBUtil();
        Contents contents = util.getContentByCID(cid);

        req.setAttribute("contents",contents);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/content_detail.jsp");
        dispatcher.forward(req,resp);
    }
}
