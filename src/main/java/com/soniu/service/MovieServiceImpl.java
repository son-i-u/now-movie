package com.soniu.service;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.soniu.domain.movieLocationSchedule_VO;
import com.soniu.domain.movie_VO;
import com.soniu.domain.userPreferMovie_VO;
import com.soniu.domain.userPrefer_VO;
import com.soniu.mapper.MovieMapper;
import com.soniu.mapper.UserPreferMapper;
import com.soniu.utils.HttpConnectionExample;
import com.soniu.utils.getBatchFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MovieServiceImpl implements MovieService {

	private MovieMapper movieMapper;
	private UserPreferMapper userPreferMapper;

	@Autowired
	getBatchFile Gbf = new getBatchFile();

	@Override
	public List<movie_VO> getList() {
		log.info("getList.........");

		return movieMapper.getList();
	}

	@Override
	public List<movie_VO> getMovieInfo(String movie_id) {

		return movieMapper.getMovieInfo(movie_id);
	}

	/* 단독 영화 평가 */
	@Override
	public void preferInsert(userPrefer_VO pr_vo) {
		log.info("userprefer insert...");

		userPreferMapper.update(pr_vo);
	}

	@Override
	public List<userPrefer_VO> getNotSeeList(String user_id) {

		return userPreferMapper.getNotSeeList(user_id);
	}

	@Override
	public List<movie_VO> getMovieNotSee(String user_id) {

		return movieMapper.getMovieNotSee(user_id);
	}

	@Override
	public List<userPreferMovie_VO> getUserPrefer(String user_id) {
		log.info("Service user_id: " + user_id);
		return userPreferMapper.getUserPrefer(user_id);
	}
	
	public void nowMovieInsert(String movie_id, int score) {
		
		/* user session id , static cause error at server start */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();
		
		userPrefer_VO uf = new userPrefer_VO();
		uf.setUser_id(user_id);
		uf.setMovie_id(movie_id);
		uf.setScore(score);

		userPreferMapper.insert(uf);
	}

	/* 처음 선호영화 선택, default score 4 */
	@Override
	public void preferInsert(String[] movieArray) {

		/* user session id , static cause error at server start */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();

		/* user id, selected id, default 3 score = userprefer */
		for (int i = 0; i < movieArray.length; i++) {
			userPrefer_VO uf = new userPrefer_VO();
			uf.setUser_id(user_id);
			uf.setMovie_id(movieArray[i]);
			uf.setScore(4);

			userPreferMapper.insert(uf);
		}

	}

	/* 다중 영화 평가 */
	@Override
	public void preferInsert(String[] movieArray, String[] scoreArray) {
		/* user session id , static cause error at server start */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();

		/* evaluated info to user_prefer */
		for (int i = 0; i < movieArray.length; i++) {
			userPrefer_VO uf = new userPrefer_VO();
			uf.setUser_id(user_id);
			uf.setMovie_id(movieArray[i]);
			uf.setScore(Integer.parseInt(scoreArray[i]));

			userPreferMapper.update(uf);
		}

	}

	public List<movieLocationSchedule_VO> getMovieLocationSchedule() {
		/* user session id , static cause error at server start */
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String user_id = auth.getName();

		HttpConnectionExample hce = new HttpConnectionExample();
		ArrayList<String> movieList = hce.get("http://127.0.0.1:8090/CF", user_id);
		
		List<movieLocationSchedule_VO> getMLS = movieMapper.getMovieLocationSchedule();
		List<movieLocationSchedule_VO> ret_getMLS = new ArrayList<>();

		/* getMSL 에서 상위 무비만 다시 넣어서 ret */
		for (int i = 0; i < getMLS.size(); i++) {
			if (movieList.contains(getMLS.get(i).getMovie_id())) {
				log.info(getMLS.get(i).getMovie_id());
				ret_getMLS.add(getMLS.get(i));
			}
		}

		/* 위치 */
		
		return ret_getMLS;
	}

}
