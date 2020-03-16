package com.soniu.mapper_test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.soniu.domain.movie_VO;
import com.soniu.mapper.MovieMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieMapper_test {

	@Setter(onMethod_ = @Autowired)
	private MovieMapper mapper;

	
	@Test
	public void testGetList() {
		System.out.println(mapper.getList().get(0).getActor() + "입니다");
		mapper.getList().forEach(movie -> log.info(movie));
	}

	
	
	@Test
	public void testGetMocieJoin() {
		//System.out.println(mapper.getMovieLocationSchedule().get(0).getActor() + "입니다");
		mapper.getMovieLocationSchedule().forEach(movie -> log.info(movie));
	}
	
	/*
	 * @Test public void testInsert() { BoardVO board = new BoardVO();
	 * board.setTitle("�깉濡쒖옉�꽦�븯�뒗湲�"); board.setContent("�깉濡� �옉�꽦�븯�뒗 �궡�슜");
	 * board.setWriter("newbie");
	 * 
	 * mapper.insertSelectKey(board);
	 * 
	 * log.info(board); }
	 * 
	 * @Test public void testRead() {
	 * 
	 * //議댁옱�븯�뒗 寃뚯떆臾� 踰덊샇濡� �뀒�뒪�듃 BoardVO board = mapper.read(5L);
	 * 
	 * log.info(board+""); }
	 * 
	 * @Test public void testDelete() { log.info("DELETE COUNT: " +
	 * mapper.delete(3L)); }
	 * 
	 * @Test public void testUpdate() { BoardVO board = new BoardVO(); //�떎�뻾�쟾
	 * 議댁옱�븯�뒗 踰덊샇�씤吏� �솗�씤�븷 寃� board.setBno(5L); board.setTitle("�닔�젙�맂 �젣紐�");
	 * board.setContent("�닔�젙�맂 �궡�슜"); board.setWriter("user00");
	 * 
	 * int count = mapper.update(board); log.info("update count: " + count); }
	 */
}
