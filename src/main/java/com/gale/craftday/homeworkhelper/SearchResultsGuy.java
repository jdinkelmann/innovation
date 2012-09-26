package com.gale.craftday.homeworkhelper;

public class SearchResultsGuy extends KnowItAllGuy {

	private static final String SEARCH_AND_GET_RESULTS_URL = BASE_URL
			+ "searchAndGetResults";

	public String search(String query, String contentSets, String displayGroups) {

		String searchRequestURL = constructSearchRequestURL(query, contentSets,
				displayGroups);
		
		System.out.println("searchRequestURL =" + searchRequestURL);

		String searchResults = makeRequest(searchRequestURL);

		return searchResults;
	}

	private String constructSearchRequestURL(String query, String contentSets,
			String displayGroups) {
		return String.format("%s/%s/displayGroups=%s&startPos=1&pageSize=20",
				SEARCH_AND_GET_RESULTS_URL, encodeParameter(query),
				encodeParameter(displayGroups));
	}
}