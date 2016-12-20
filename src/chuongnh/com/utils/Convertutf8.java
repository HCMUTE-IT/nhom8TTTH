package chuongnh.com.utils;

public  class Convertutf8 {
	String s;
	//convert from UTF-8 -> internal Java String format
		public static String convertFromUTF8(String s){
		    String out = null;
		    try {
		        out = new String(s.getBytes("ISO-8859-1"), "UTF-8");
		    } catch (java.io.UnsupportedEncodingException e) {
		        return null;
		    }
		    return out;
		}

}
