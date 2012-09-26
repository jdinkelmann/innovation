package com.gale.craftday.homeworkhelper;

import org.junit.Test;

public class StupidGSONandXSLTIntegrationTest {
	
	@Test
	public void badTest_shows_transform_output(){
		String html = new DocumentRetrieverGuy().retrieveHTMLFormattedDocument("GALE|CX3407200305");
		System.out.println(html);					
	}

}
