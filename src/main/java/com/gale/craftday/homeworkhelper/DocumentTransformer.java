package com.gale.craftday.homeworkhelper;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class DocumentTransformer {

	private static final String DEFAULT_DOCUMENT_XSLT = "xslt/ReferenceDocument.xslt";

	public String convertToHTML(String xml) {
		System.out.println(xml);	
		InputStream xslStream = openXslStream(DEFAULT_DOCUMENT_XSLT);
		Transformer transformer = makeTransformer(xslStream);
		return doTransform(transformer, xml);

	}

	protected InputStream openXslStream(String xsltName) {
		InputStream xslStream = getClass().getClassLoader()
				.getResourceAsStream(xsltName);
		if (xslStream == null) {
			throw new IllegalArgumentException("Could not find XSL script: "
					+ xsltName);
		}
		return xslStream;
	}

	protected Transformer makeTransformer(InputStream xslStream) {
		TransformerFactory tFactory = XsltTransformer
				.createFactoryThatKnowsAboutResourcePathForIncludes();

		try {
			Transformer transformer = tFactory.newTransformer(new StreamSource(
					xslStream));
			xslStream.close();
			return transformer;
		} catch (TransformerConfigurationException e) {
			throw new IllegalStateException("Error configuring transformer", e);
		} catch (IOException e) {
			throw new IllegalStateException("Error reading XSLT script "
					+ DEFAULT_DOCUMENT_XSLT, e);
		}
	}

	protected String doTransform(Transformer transformer, String xml) {
		String html;
		try {
			// someone thought it would be fun to format the XML into 80 char
			// lines
			// bad idea, now I have to ensure the line stay apart
			xml = xml.replaceAll("(\\S)([\\n\\r\\f])(\\S)", "$1$2 $3");
			StringWriter outputHtmlWriter = new StringWriter();
			transformer.transform(new StreamSource(new StringReader(xml)),
					new StreamResult(outputHtmlWriter));
			html = outputHtmlWriter.toString();
		} catch (TransformerConfigurationException e) {
			throw new IllegalStateException(
					"XSLT Transformer improperly configured", e);
		} catch (TransformerException e) {
			throw new IllegalStateException("Error transforming through XSLT",
					e);
		}
		return html;
	}
}
