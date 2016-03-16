package com.edu.util;

public class CheckTokenTool {
	public static boolean CheckToken(String token){
		if (null != token) {
			String[] parts = token.split("\\&");
			System.out.println(parts.length);
			String temp = MD5Util.convertMD5(parts[1]);
			if (parts[0].equals(temp))
				return true;
			return false;
		}else{
			return false;
		}
	}
	
	public static String GetUserid(String token){
		if (null != token) {
			String[] parts = token.split("\\&");
			System.out.println(parts.length);
			String temp = MD5Util.convertMD5(parts[1]);
			return parts[0];
		}else{
			return null;
		}
	}
}
