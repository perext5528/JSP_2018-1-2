package Beans;

import java.sql.*;

public class beanLogin2 {
    private String userId;
    private String userPw;

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/jspdb";

    void connect() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, "perext", "joowan0935");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public boolean CheckUser() {
        connect();
        String sql = "select uId, uPw from account where uNo=1";
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            String realId = rs.getString(1);
            String realPw = rs.getString(2);

            if (userId.equals(realId) && userPw.equals(realPw)) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }


    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }
}

