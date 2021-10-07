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

@WebServlet(name = "contentsServlet" , value = "/contens-insert")
public class ContentsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String category = req.getParameter("category");
        String title = req.getParameter("title");
        String detail = req.getParameter("detail");

        Contents content = new Contents();
        content.setCategory(category);
        content.setTitle(title);
        content.setDetail(detail);

        int aid = (int) req.getSession().getAttribute("aid");
        System.out.println("aid : " + aid);


        DBUtil util = new DBUtil();
        int status = util.contentsInsert(content, aid);
        if (status > 0) {
            resp.sendRedirect(Util.base_url + "dashboard_edit.jsp");
        } else {
            String errorMessage = "";
            if (status == 0) {
                errorMessage = "Ekleme sırasında bir hata oluştu!";
            }
            if (status == -1) {
                errorMessage = "Bu yazı başlığı daha önce kullanılmış";
            }
            req.setAttribute("insertError", errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dashboard_edit.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int cid = Integer.parseInt(req.getParameter("cid"));

        try {
            DBUtil util = new DBUtil();
            int aid = (int) req.getSession().getAttribute("aid");

            if( util.isContentValid(cid,aid)){
                int status = util.deleteContent(cid);
                if (status>0){
                    System.out.println(status);
                    resp.sendRedirect(Util.base_url + "dashboard_edit.jsp");
                }
            }

        }catch (Exception ex){
            System.err.println("Delete Contect Error : " + ex);
        }

    }
}
