package com.gale.craftday.homeworkhelper;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class KnowItAllGuy {
	
	protected static final String BASE_URL = "http://think.eqa.gghybrid.com/craftday/service/";
	protected static final int REQUEST_TIMEOUT_MS = 10000;
	protected static final String RESULT_CHARSET = "ISO8859_1";
	protected static final String URL_ENCODING = "UTF-8";
	
	protected ExceptionPrinter exceptionPrinter = new ExceptionPrinter();
	
	protected String encodeParameter(String parameter) {
		String encodedParameter = "";

		if (parameter != null) {
			try {
				encodedParameter = URLEncoder.encode(parameter, URL_ENCODING);
			} catch (UnsupportedEncodingException e) {
				exceptionPrinter.print(
						"Unable to encode the following parameter; skipping parameter: "
								+ parameter, e);
			}
		}
		return encodedParameter;
	}
	
	protected String makeRequest(String requestURL) {
		String searchResponse = "";

		try {
			searchResponse = new CrossDomainServiceCaller().retrieveContent(
					requestURL, REQUEST_TIMEOUT_MS, RESULT_CHARSET);
		} catch (IOException e) {
			exceptionPrinter.print("Exception received calling request: "
					+ requestURL, e);
		}

		return searchResponse;
	}

}
