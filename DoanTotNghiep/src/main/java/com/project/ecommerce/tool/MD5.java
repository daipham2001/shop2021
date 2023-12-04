package com.project.ecommerce.tool;

import java.security.MessageDigest;

public class MD5 {
	public String mahoa(String MD5) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(MD5.getBytes());
			byte[] b = md.digest();
			StringBuffer sb = new StringBuffer();
			for (byte x : b) {
				sb.append(Integer.toHexString(x & 0xff).toString());
			}
			return sb.toString();
		} catch (Exception e) {
			return "123";
		}
	}
}
