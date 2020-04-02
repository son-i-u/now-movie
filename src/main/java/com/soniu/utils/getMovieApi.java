package com.soniu.utils;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.soniu.domain.movie_VO;

public class getMovieApi {
	public static void main(String[] args) throws ParseException {
		movie_VO mv = get(
				"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=53527059be82bbb2d884e8748cc78bca&movieCd=20124079");

	}

	public static movie_VO get(String requestURL) {
		movie_VO mv = new movie_VO();

		try {
			HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
			HttpGet getRequest = new HttpGet(requestURL); // GET 메소드 URL 생성
			getRequest.addHeader("x-api-key", "53527059be82bbb2d884e8748cc78bc"); // KEY 입력

			HttpResponse response = client.execute(getRequest);

			// Response 출력
			if (response.getStatusLine().getStatusCode() == 200) {
				ResponseHandler<String> handler = new BasicResponseHandler();
				String body = handler.handleResponse(response);
				System.out.println(body);

				mv = allParse(body);
			} else {
				System.out.println("response is error : " + response.getStatusLine().getStatusCode());
			}

		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return mv;
	}


	@SuppressWarnings("unused")
	public static movie_VO allParse(String body) throws ParseException {
		JSONParser jsonParser = new JSONParser();

		// JSON데이터를 넣어 JSON Object 로 만들어 준다.
		JSONObject jsonObject = (JSONObject) jsonParser.parse(body);
		JSONObject movieInfoResult = (JSONObject) jsonObject.get("movieInfoResult");
		JSONObject movieInfo = (JSONObject) movieInfoResult.get("movieInfo");

		/* movie id */
		String movieCd = (String) movieInfo.get("movieCd");

		/* movieNm */
		String movieNm = (String) movieInfo.get("movieNm");

		/* movieNmEn */
		String movieNmEn = (String) movieInfo.get("movieNmEn");

		/* genre 2 개씩 */
		String objOrArr = movieInfo.get("genres").getClass().toString();
		String genre = obarr(movieInfo, objOrArr, "genres", "genreNm");

		/* actors 2개씩 */
		objOrArr = movieInfo.get("actors").getClass().toString();
		String actor = obarr(movieInfo, objOrArr, "actors", "peopleNm");

		/* director */
		objOrArr = movieInfo.get("directors").getClass().toString();
		String director1 = obarr(movieInfo, objOrArr, "directors", "peopleNm");

		/* nation */
		objOrArr = movieInfo.get("nations").getClass().toString();
		String nation = obarr(movieInfo, objOrArr, "nations", "nationNm");

		/* img_loc */
		String img_loc = "/img/" + movieCd + ".jpg";

		movie_VO mv = new movie_VO();
		mv.setMovie_nm(movieNm);
		mv.setMovie_nm_en(movieNmEn);
		mv.setActor(actor);
		mv.setGenre(genre);
		mv.setNation(nation);
		mv.setImg_loc(img_loc);
		mv.setDirector(director1);
		mv.setMovie_id(movieCd);

		/*
		 * System.out.println(movieCd+"movieCd"); System.out.println(movieNm+"movieNm");
		 * System.out.println(movieNmEn+"movieNmEn"); System.out.println(actor+"actor");
		 * 
		 * System.out.println(genre+"genre"); System.out.println(nation+"nation");
		 * 
		 * System.out.println(director1+"director1"); System.out.println(img_loc
		 * +"img_loc");
		 */

		return mv;
	}

	/* genre Object or Arraa */
	public static String obarr(JSONObject movieInfo, String objOrArr, String ones, String Nm) {
		String genre1 = "";

		if (objOrArr.equals("class org.json.simple.JSONArray")) {
			// array라면
			JSONArray jarr = (JSONArray) movieInfo.get(ones);

			if (jarr.size() != 0) {
				JSONObject jobj = (JSONObject) jarr.get(0);
				genre1 = (String) jobj.get(Nm);
			}

		} else {
			// object라면
			JSONArray genreArray = (JSONArray) movieInfo.get(ones);

			if (genreArray.size() != 0) {
				JSONObject genreObject1 = (JSONObject) genreArray.get(0);
				JSONObject genreObject2 = (JSONObject) genreArray.get(1);

				genre1 = (String) genreObject1.get(Nm);
				if (genreObject2 != null) {
					String genre2 = (String) genreObject2.get(Nm);
					genre1 = genre1.concat("," + genre2);
				}
			}

		}

		return genre1;
	}
}
