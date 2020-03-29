package com.soniu.utils_test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soniu.domain.movie_VO;
import com.soniu.utils.getMovieApi;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class getMovieApiTest {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	@Test
	public void testEncode() {
		System.out.println("ddd" + pwencoder.encode("pw"));
	}

	@Test
	public void testInsertMovie() throws SQLException {

		getMovieApi getmovieapi = new getMovieApi();
		/*
		 * movie_VO mv = getmovieapi.get(
		 * "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=53527059be82bbb2d884e8748cc78bca&movieCd=20124079"
		 * );
		 */

		ArrayList<movie_VO> mv_arr = new ArrayList<>();

		/* 영화 리스트 받기 */
		String base = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=53527059be82bbb2d884e8748cc78bca&movieCd=";

		for (int i = 20120031; i < 20120200; i++) {
			String get_uri = base + i;
			movie_VO mv = getmovieapi.get(get_uri);

			if( mv.getMovie_id() != null) {
				mv_arr.add(mv);
				System.out.println("arr_Add");
			}
		}

		for (int i = 0; i < mv_arr.size(); i++) {
			String sql = "insert into movie values(?,?,?,?,?,?,?,?)";

			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, mv_arr.get(i).getMovie_id());
				pstmt.setString(2, mv_arr.get(i).getMovie_nm());
				pstmt.setString(3, mv_arr.get(i).getMovie_nm_en());
				pstmt.setString(4, mv_arr.get(i).getDirector());
				pstmt.setString(5, mv_arr.get(i).getActor());
				pstmt.setString(6, mv_arr.get(i).getNation());
				pstmt.setString(7, mv_arr.get(i).getGenre());
				pstmt.setString(8, mv_arr.get(i).getImg_loc());

				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
					}
				}
			}
		}

	}

}
