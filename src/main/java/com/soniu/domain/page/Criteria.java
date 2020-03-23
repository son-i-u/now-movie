package com.soniu.domain.page;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; //page번호
	private int amount;  //한 page 당 몇개의 데이터를 보여줄 것인가
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
