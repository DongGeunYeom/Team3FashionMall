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
public class Attach{


    @Autowired
    private DataSource ds;

    @Test
    public void test() {
        String sql = "insert into productattach(uuid, uploadpath, p_code, filename)";
               sql += "values(?,?,?,?)";

        for(int i=21; i<24; i++) {
            try(Connection con = ds.getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)){
            	if(i<5) {
                    pstmt.setString(1, "uuid"+i);
                    pstmt.setString(2, "2022\\05\\17");
                    pstmt.setString(3, "p_code"+i);
                    pstmt.setString(4, "pic01.jpg");
                }else if(i < 15) {
                    pstmt.setString(1, "uuid"+i);
                    pstmt.setString(2, "2022\\05\\16");
                    pstmt.setString(3, "p_code"+i);
                    pstmt.setString(4, "pic02.jpg");
                }else {
                    pstmt.setString(1, "uuid"+i);
                    pstmt.setString(2, "2022\\05\\15");
                    pstmt.setString(3, "p_code"+i);
                    pstmt.setString(4, "pic03.jpg");
                }
                pstmt.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
