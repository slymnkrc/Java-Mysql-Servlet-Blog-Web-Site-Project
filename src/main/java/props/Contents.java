package props;

import java.util.Date;

public class Contents {

    public Contents() {

    }

    public Contents(int cid,String category,String title,String detail,Date date) {
        this.cid = cid;
        this.category = category;
        this.title = title;
        this.detail = detail;
        this.date = date;
    }

    private int cid;
    private String title;
    private String category;
    private String detail;
    private Date date;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }


    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
