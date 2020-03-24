package com.soniu.service;

import java.security.Principal;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.soniu.domain.Schedule_VO;
import com.soniu.domain.page.Criteria;
import com.soniu.mapper.ScheduleMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {

	ScheduleMapper mapper;

	@Override
	public List<Schedule_VO> getList(Criteria cri) {
		log.info("geList with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void insertSchedule(Schedule_VO sv) {
		log.info("insertSchedule is called.. ");

		mapper.scheduleInsert(sv);
	}

	@Override
	public boolean remove(String schedule_id) {
		log.info("shcedule remove is called..");
		log.info(schedule_id);

		return mapper.remove(schedule_id);
	}

	@Override
	public String authCheck() {
		/* user session id , static cause error at server start */

		// 시큐리티 컨텍스트 객체를 얻습니다.
		SecurityContext context = SecurityContextHolder.getContext();

		// 인증 객체를 얻습니다.
		Authentication authentication = context.getAuthentication();

		// 로그인한 사용자정보를 가진 객체를 얻습니다.
		Object principal = authentication.getPrincipal();

		// 사용자가 가진 모든 롤 정보를 얻습니다.
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		Iterator<? extends GrantedAuthority> iter = authorities.iterator();

		boolean member_check = false;
		
		while (iter.hasNext()) {
			GrantedAuthority auth = iter.next();
			System.out.println(auth.getAuthority().toString());
			if (auth.getAuthority().toString().equals("ROLE_ADMIN")) {
				member_check = !member_check;
			}
		}


		return Boolean.toString(member_check);
	}

}
