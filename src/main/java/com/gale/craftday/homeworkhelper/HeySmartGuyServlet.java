package com.gale.craftday.homeworkhelper;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HeySmartGuyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ExceptionPrinter exceptionPrinter = new ExceptionPrinter();

	private static final String SEARCH_REQUEST = "/search?";
	private static final Pattern SEARCH_URL_PATTERN = Pattern
			.compile(SEARCH_REQUEST);

	private static final String DISPLAY_GROUPS_PARAMETER = "displayGroups";
	private static final String CONTENT_SETS_PARAMETER = "contentSets";
	private static final String QUERY_PARAMETER = "query";

	private static final String RETRIEVE_REQUEST = "/retrieve?";
	private static final Pattern RETRIEVE_URL_PATTERN = Pattern
			.compile(RETRIEVE_REQUEST);

	private static final String DOC_ID_PARAMETER = "docId";


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {

		String actionRequest = request.getPathInfo();

		if (isSearchRequest(actionRequest)) {
			searchAndGetResults(request, response);
		} else if (isRetrieveRequest(actionRequest)) {
			retrieveHTMLFormattedDocument(request, response);
		}
	}

	private boolean isSearchRequest(String actionRequest) {
		Matcher matcher = SEARCH_URL_PATTERN.matcher(actionRequest);
		return matcher.find();
	}

	private void searchAndGetResults(HttpServletRequest request,
			HttpServletResponse response) {

		String query = request.getParameter(QUERY_PARAMETER);
		String contentSets = request.getParameter(CONTENT_SETS_PARAMETER);
		String displayGroups = request.getParameter(DISPLAY_GROUPS_PARAMETER);

		String searchResults = new SearchResultsGuy().search(query, contentSets, displayGroups);
		
		writeJSONResultsToResponse(searchResults, response);
	}

	private void writeJSONResultsToResponse(String results,
			HttpServletResponse response) {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		writeResultsToResponse(results, response);
	}

	private boolean isRetrieveRequest(String actionRequest) {
		Matcher matcher = RETRIEVE_URL_PATTERN.matcher(actionRequest);
		return matcher.find();
	}

	private void retrieveHTMLFormattedDocument(HttpServletRequest request,
			HttpServletResponse response) {

		String docId = request.getParameter(DOC_ID_PARAMETER);

		String htmlFormattedDocument = new DocumentRetrieverGuy().retrieveHTMLFormattedDocument(docId);
		
		writeHTMLToResponse(htmlFormattedDocument, response);
	}


	private void writeHTMLToResponse(String results,
			HttpServletResponse response) {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		//String html = "<html><body>" + results + "</body></html>";
		writeResultsToResponse(results, response);
	}

	private void writeResultsToResponse(String results,
			HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			out.println(results);
			out.close();
		} catch (IOException e) {
			exceptionPrinter.print("Unable to write results to response: "
					+ results, e);
		}
	}

}
