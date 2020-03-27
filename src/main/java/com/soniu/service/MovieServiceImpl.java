package com.soniu.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

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

		/* collect_movie_list */
		List<String> collec_movie_list = new ArrayList<>();

		/* movie list 중 score 상위 고르고 */
		Map<String, Double> mc_map = Gbf.CalPreferList(user_id);

		/* value 기준 정렬 */
		List<String> keySetList = new ArrayList<>(mc_map.keySet());

		/* 상위 5개, 넘치면 탈출 */
		System.out.println("------value 내림차순------");
		Collections.sort(keySetList, (o1, o2) -> (mc_map.get(o2).compareTo(mc_map.get(o1))));
		for (String key : keySetList) {
			System.out.println("key : " + key + " / " + "value : " + mc_map.get(key));
			collec_movie_list.add(key);

			if (collec_movie_list.size() >= 5) {
				break;
			}

		}

		List<movieLocationSchedule_VO> getMLS = movieMapper.getMovieLocationSchedule();
		List<movieLocationSchedule_VO> ret_getMLS = new ArrayList<>();

		/* getMSL 에서 상위 무비만 다시 넣어서 ret */
		for (int i = 0; i < getMLS.size(); i++) {
			if (collec_movie_list.contains(getMLS.get(i).getMovie_id())) {
				log.info(getMLS.get(i).getMovie_id());
				ret_getMLS.add(getMLS.get(i));
			}
		}

		/* 위치 */

		return ret_getMLS;
	}
}
