package com.edu.util;
import java.io.IOException;
import java.util.Properties;

public class GetConfigData {
	private static Properties  prop  = new Properties();;

	public GetConfigData() {
		super();
	}
	
	public static String getDatabyKey(String key){
		String data="";
		try {
			prop.load(GetConfigData.class.getClassLoader().getResourceAsStream("methodconfig.properties"));
			data = prop.getProperty(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return data;
	}
}
