package com.gale.craftday.homeworkhelper;

public class ExceptionPrinter {
	
	public void print(String message, Exception e){
		System.out.println(message);
		System.out.println("EXCEPTION: " + e.getMessage());		
	}

}
