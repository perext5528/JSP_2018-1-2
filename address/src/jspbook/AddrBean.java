package jspbook;

import java.sql.*;
import java.util.*;

public class AddrBean {

    Connection conn = null;
    PreparedStatement pstmt = null;
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

    void disconnect() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean insertDB(AddrBook addrbook) {
        connect();
        String sql = "insert into addrbook (name, email, tel, company) values(?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, addrbook.getName());
            pstmt.setString(2, addrbook.getEmail());
            pstmt.setString(3, addrbook.getTel());
            pstmt.setString(4, addrbook.getCompany());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            disconnect();
        }
        return true;
    }

    public ArrayList<AddrBook> getDBList() {
        connect();
        ArrayList<AddrBook> datas = new ArrayList<AddrBook>();
        String sql = "select * from addrbook order by id desc";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                AddrBook addrbook = new AddrBook();
                addrbook.setId(rs.getInt("id"));
                addrbook.setName(rs.getString("name"));
                addrbook.setEmail(rs.getString("email"));
                addrbook.setCompany(rs.getString("company"));
                addrbook.setTel(rs.getString("tel"));

                datas.add(addrbook);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return datas;
    }

    public AddrBook getDB(int id){
        connect();
        String sql = "select * from addrbook where id=?";
        AddrBook addrbook = new AddrBook();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            addrbook.setId(rs.getInt("id"));
            addrbook.setName(rs.getString("name"));
            addrbook.setEmail(rs.getString("email"));
            addrbook.setTel(rs.getString("tel"));
            addrbook.setCompany(rs.getString("company"));

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            disconnect();
        }
        return addrbook;
    }
}
