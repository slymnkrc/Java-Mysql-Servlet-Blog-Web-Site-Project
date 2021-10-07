package utils;

import props.Contact;
import props.Contents;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class DBUtil {

    public boolean login(String email, String password, String remember, HttpServletRequest req, HttpServletResponse resp) {
        boolean status = false;
        DB db = new DB();
        try {

            String sql = "select * from admin where email = ? and password = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, Util.MD5(password));
            ResultSet rs = pre.executeQuery();
            status = rs.next();

            if(status) {
                int aid = rs.getInt("aid");
                String username = rs.getString("username");

                req.getSession().setAttribute("aid", aid);
                req.getSession().setAttribute("username", username);
                if (remember != null && remember.equals("on")) {
                    username = username.replaceAll(" ", "_");
                    String val = aid + "_" + username;
                    Cookie cookie = new Cookie("user", val);
                    cookie.setMaxAge(60 * 60);
                    resp.addCookie(cookie);
                }

            }
        }catch (Exception ex){
            System.err.println("Login Error : " + ex);
        }finally {
            db.close();
        }

        return status;
    }

    //tüm içerikleri getirir.
    public List<Contents> GetAllContents()
    {
            List<Contents> myContentList =new ArrayList<>();

            DB db = new DB();
            try{
                    String mySQLRequest = "SELECT * FROM contents";
                    PreparedStatement pre =db.conn.prepareStatement(mySQLRequest);
                    ResultSet resultSet =pre.executeQuery();

                    while(resultSet.next()) {
                        int cid = resultSet.getInt("cid");
                        String category = resultSet.getString("category");
                        String title = resultSet.getString("title");
                        String detail = resultSet.getString("detail");
                        Date date = resultSet.getDate("date");

                        Contents content = new Contents(cid, category, title, detail, date);
                        myContentList.add(content);
                    }
            }catch (Exception e)
            {
                e.printStackTrace();
            }
            finally{
                db.close();
            }
            return myContentList;
    }

    // ----------- CRUD ---------- Create, Read (get by id, get all), Update, Delete
    //içeriği kendi id'sine göre getirir (cid)
    //anasayfadaki içeriği açerken kullanılır (post - contentDetail)

    public Contents getContentByCID(int cid)
    {
        Contents myContent = new Contents();
        DB db = new DB();

        try{
            String mySQLRequest = "SELECT * FROM contents WHERE cid=?";
            PreparedStatement pre =db.conn.prepareStatement(mySQLRequest);
            pre.setInt(1, cid);             //getirilecek olan içeriğin id'sini (cid) set eder.
            ResultSet resultSet =pre.executeQuery();

            while(resultSet.next()) {
                int cidX = resultSet.getInt("cid");
                String category = resultSet.getString("category");
                String title = resultSet.getString("title");
                String detail = resultSet.getString("detail");
                Date date = resultSet.getDate("date");

                myContent = new Contents(cidX, category, title, detail, date);
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        finally{
            db.close();
        }
        return myContent;
    }

        // İçerik silme işlemi

    public int deleteContent(int cid)
    {
        DB db = new DB();
        int status = 0;
        try{
            String mySQLRequest = "DELETE FROM contents WHERE cid=?";
            PreparedStatement pre = db.conn.prepareStatement(mySQLRequest);
            pre.setInt(1,cid);
            status = pre.executeUpdate();
        }
        catch (Exception ex){
            System.err.println("content delete Error :  " + ex);
        }finally {
            db.close();
        }
      return status;
    }

    // içerik güncelleme işlemi

    public int updateContent(String category, String title, String detail, int cid)
    {
        DB db = new DB();
        int status = 0;
        try{

            String mySQLRequest = "UPDATE contents set category=?, title=?, detail=?, date=now() WHERE cid=?";
            PreparedStatement pre = db.conn.prepareStatement(mySQLRequest);
            pre.setString(1,category);
            pre.setString(2,title);
            pre.setString(3,detail);
            pre.setInt(4,cid);

            status = pre.executeUpdate();
        }
        catch (Exception ex){
            System.err.println("content delete Error :  " + ex);
        }finally {
            db.close();
        }
        return status;
    }

    // contents insert --> içerik ekleme, içeriğin kendisi ve adminin id'sini almaktadır.

    public int contentsInsert(Contents pro, int aid) {
        int status = 0;
        DB db = new DB();
        try {
            System.out.println("aid : " + aid);
            String sql = "insert into contents values ( null, ?, ?, ?, now() ,?) ";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, pro.getCategory() );
            pre.setString(2, pro.getTitle() );
            pre.setString(3, pro.getDetail());
            pre.setInt(4,aid);
            status = pre.executeUpdate();
        } catch (Exception e) {
            if ( e.toString().contains("SQLIntegrityConstraintViolationException") ) {
                status = -1;
            }
            System.err.println("contentsInsert Error : " + e);
        } finally {
            db.close();
        }
        return status;
    }

    // contact bilgileri

    public int contactInsert(Contact pro) {
        int status = 0;
        DB db = new DB();

        try {
            String sql = "insert into contact values ( null,now(), ?, ?, ? ,?) ";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1, pro.getName() );
            pre.setString(2, pro.getEmail() );
            pre.setString(3, pro.getPhone());
            pre.setString(4,pro.getMessage());
            status = pre.executeUpdate();
        } catch (Exception e) {
            System.err.println("contactInsertDButil Error : " + e);
        } finally {
            db.close();
        }
        return status;


    }

    //içeriği adminin id'sine göre getirir(aid)

    public List<Contents> allContents(int aid) {
        List<Contents> ls = new ArrayList<>();
        DB db = new DB();
        try {
            String sql = "select * from contents where aid=?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,aid);
            ResultSet rs = pre.executeQuery();
            while ( rs.next() ) {
                int cid = rs.getInt("cid");
                String category = rs.getString("category");
                String title = rs.getString("title");
                String detail = rs.getString("detail");
                Date date = rs.getDate("date");

                Contents pr = new Contents(cid,category,title,detail, date);
                ls.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.close();
        }
        return ls;
    }

        // içerik kontrol işlemi , admine ait mi ?

    public boolean isContentValid(int cid, int aid){

        boolean status = false;
        DB db = new DB();
        try {
            String mySQLRequest = "select * from contents where cid = ? and aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(mySQLRequest);
            pre.setInt(1,cid);
            pre.setInt(2,aid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();
        }catch (Exception ex){
            System.err.println("isProductValid Error : " + ex);
        }finally {
            db.close();
        }
        return status;
    }

    // Admin Şifre Değiştirme İşlemi

    public int updatePassword(String oldPass ,String newPass, int aid){
        int status = 0;
        DB db = new DB();

        try{
            String sql = "update admin set password =? where password = ? and  aid=?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,Util.MD5(newPass));
            pre.setString(2,Util.MD5(oldPass));
            pre.setInt(3,aid);
            status = pre.executeUpdate();

        }catch (Exception e){
            System.err.println("updatePassword Error : " + e);

        }finally {
            db.close();
        }

        return status;
    }


}
