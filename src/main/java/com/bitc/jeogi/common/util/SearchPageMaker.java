package com.bitc.jeogi.common.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class SearchPageMaker extends PageMaker {

	@Override
	public String makeQuery(int page) {
		SearchCriteria searchCri = (SearchCriteria) cri;
		UriComponents uri = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", searchCri.getPerPageNum()).queryParam("searchType", searchCri.getSearchType())
				.queryParam("keyword", searchCri.getKeyword()).build();
		return uri.toUriString();
	}

}
