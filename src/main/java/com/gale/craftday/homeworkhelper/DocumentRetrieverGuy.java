package com.gale.craftday.homeworkhelper;

import org.apache.commons.lang.StringEscapeUtils;

public class DocumentRetrieverGuy extends KnowItAllGuy {

	private static final String DOCUMENT_RETRIEVE_URL = BASE_URL
			+ "retrieve/ocean";

	public String retrieveHTMLFormattedDocument(String docId) {

		String documentRetrieveURL = constructDocumentRetrieveURL(docId);

		String escapedGiftFormattedDocument = makeRequest(documentRetrieveURL);

		String htmlFormattedDocument = new DocumentTransformer()
				.convertToHTML(processGiftResponseForProcessing(escapedGiftFormattedDocument));

		return htmlFormattedDocument;

	}

	private String constructDocumentRetrieveURL(String docId) {
		return String.format("%s/%s", DOCUMENT_RETRIEVE_URL, docId);
	}

	private String processGiftResponseForProcessing(
			String escapedGiftFormattedDocument) {
		String unescapedGIFTFormattedDocument = StringEscapeUtils
				.unescapeJava(escapedGiftFormattedDocument);

		int locationLastQuote = unescapedGIFTFormattedDocument.lastIndexOf("");

		return unescapedGIFTFormattedDocument.substring(0,
				locationLastQuote - 1).replaceFirst("\"", "").replaceAll(
				"<\\?xml version=\"1.0\" encoding=\"UTF-8\"\\?>", "");
	}

}
