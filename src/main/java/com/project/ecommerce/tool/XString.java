package com.project.ecommerce.tool;

import java.security.MessageDigest;
import java.text.Normalizer;
import java.util.Base64;
import java.util.regex.Pattern;

public class XString {
	/**
	 * Ma hoa chuoi duoi dang base 64
	 * @param text Chuoi can ma hoa
	 * @return Chuoi da ma hoa
	 */
	public static String toBase64(String text) {
		try {
			byte[] bytes = text.getBytes("UTF-8");
			String encodeText = Base64.getEncoder().encodeToString(bytes);
			return encodeText;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Giai ma chuoi dang base 64
	 * @param encodeText Chuoi da ma hoa base 64
	 * @return Chuoi da giai ma
	 */
	public static String fromBase64(String encodeText) {
		try {
			byte[] decodeBytes = Base64.getDecoder().decode(encodeText);
			String text = new String(decodeBytes, "UTF-8");
			return text;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Ma hoa chuoi dang MD5
	 * @param text Chuoi can ma hoa
	 * @return Chuoi da ma hoa
	 */
	public static String toMd5(String text) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] hash = md.digest(text.getBytes("UTF-8"));
			String encodeText = Base64.getEncoder().encodeToString(hash);
			return encodeText;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Bo dau unicode khoi chuoi
	 * @param unicodeText chuoi unicode
	 * @return Chuoi ASCII da loai dau
	 */
	public static String toAscii(String unicodeText) {
		String temp = Normalizer.normalize(unicodeText, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		String asciiText = pattern.matcher(temp).replaceAll("");
		return asciiText;
	}

}
