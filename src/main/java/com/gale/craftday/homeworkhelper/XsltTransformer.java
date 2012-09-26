package com.gale.craftday.homeworkhelper;

import java.io.IOException;

import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamSource;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;

public final class XsltTransformer {
	private static ResourceLoader rLoader;
	
	private  XsltTransformer(){}
	
	public static TransformerFactory createFactoryThatKnowsAboutResourcePathForIncludes()
			throws TransformerFactoryConfigurationError {
		TransformerFactory tFactory = TransformerFactory.newInstance();
		setURIResolver(tFactory);
		return tFactory;
	}

	private static void setURIResolver(TransformerFactory tFactory) {
		tFactory.setURIResolver(new URIResolver() {
			@Override
			public Source resolve(String href, String base) throws TransformerException {
				getResourceLoader();
				try {
					return new StreamSource(rLoader.getResource(href).getInputStream());
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}

			private void getResourceLoader() {
				if (rLoader == null){
					rLoader = new DefaultResourceLoader();
				}
			}
		});
	}
	//CHECKSTYLE:ON
}
