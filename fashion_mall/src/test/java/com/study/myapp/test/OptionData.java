package com.study.myapp.test;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class OptionData{


    @Autowired
    private DataSource ds;

    @Test
    public void test() {
        String sql = "insert into productOpt(p_code, po_size, po_color, p_amount)";
               sql += "values(?,?,?,?)";

        for(int i=0; i<24; i++) {
            try(Connection con = ds.getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)){
            	if(i<5) {
                    pstmt.setString(1, "p_code"+i);
                    pstmt.setString(2, "250mm");
                    pstmt.setString(3, "Red");
                    pstmt.setString(4, "5");
            	}else if(i < 10) {
                    pstmt.setString(1, "p_code"+i);
                    pstmt.setString(2, "Large");
                    pstmt.setString(3, "Blue");
                    pstmt.setString(4, "7");
                }else if(i < 15) {
                    pstmt.setString(1, "p_code"+i);
                    pstmt.setString(2, "Small");
                    pstmt.setString(3, "Orange");
                    pstmt.setString(4, "3");
                }else if(i < 20) {
                    pstmt.setString(1, "p_code"+i);
                    pstmt.setString(2, "260mm");
                    pstmt.setString(3, "Green");
                    pstmt.setString(4, "10");
                }else {
                    pstmt.setString(1, "p_code"+i);
                    pstmt.setString(2, "Medium");
                    pstmt.setString(3, "Basic");
                    pstmt.setString(4, "1");
                }
                pstmt.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
