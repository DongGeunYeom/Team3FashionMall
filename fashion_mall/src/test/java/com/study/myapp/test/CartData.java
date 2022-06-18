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
public class CartData{


    @Autowired
    private DataSource ds;

    @Test
    public void test() {
        String sql = "insert into Cart(userid, p_code, p_name, po_size, po_color,p_amount,p_price)";
               sql += "values(?,?,?,?,?,?)";

        for(int i=0; i<16; i++) {
            try(Connection con = ds.getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)){
            	if(i<5) {
                    pstmt.setString(1, "aadd19");
                    pstmt.setString(2, "p_code"+i);
                    pstmt.setString(3, "p_name"+i);
                    pstmt.setString(2, "");
                    pstmt.setString(4, "pic01.jpg");
                }else if(i < 10) {
                    pstmt.setString(1, "aadd29");
                    pstmt.setString(2, "p_code"+i);
                    pstmt.setString(3, "p_name"+i);
                    pstmt.setString(3, "2022\\05\\16");
                    pstmt.setString(4, "pic02.jpg");
                }else {
                    pstmt.setString(1, "alsehdfbf2");
                    pstmt.setString(2, "p_code"+i);
                    pstmt.setString(3, "p_name"+i);
                    pstmt.setString(3, "2022\\05\\15");
                    pstmt.setString(4, "pic03.jpg");
                }
                pstmt.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
