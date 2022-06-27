package com.study.myapp.test;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class ProductAttachTest {

    @Autowired
    private DataSource ds;

    @Test
    public void test() {
        String sql = "insert into product(p_code, p_name, p_price,p_disprice,p_type,p_content,p_sale,t_amount) ";
               sql += "values(?,?,?,?,?,?,?,?)";

        for(int i=21; i<24; i++) {
            try(Connection con = ds.getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)){

                if(i<5) {
                    pstmt.setString(1, "p_code"+i);
                    pstmt.setString(2, "p_name"+i);
                    pstmt.setInt(3, 35000);
                    pstmt.setInt(4, 25000);
                    pstmt.setString(5, "상의");
                    pstmt.setString(6, "상세내용");
                    pstmt.setInt(7, 5);
                    pstmt.setInt(8, 3);
                }else if(i < 15) {
                	pstmt.setString(1, "p_code"+i);
                    pstmt.setString(2, "p_name"+i);
                    pstmt.setInt(3, 45000);
                    pstmt.setInt(4, 35000);
                    pstmt.setString(5, "하의");
                    pstmt.setString(6, "상세내용");
                    pstmt.setInt(7, 3);
                    pstmt.setInt(8, 2);
                }else {
                    pstmt.setString(1, "p_code"+i);
                    pstmt.setString(2, "p_name"+i);
                    pstmt.setInt(3, 55000);
                    pstmt.setInt(4, 45000);
                    pstmt.setString(5, "신발");
                    pstmt.setString(6, "상세내용");
                    pstmt.setInt(7, 1);
                    pstmt.setInt(8, 1);
                }
                pstmt.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
