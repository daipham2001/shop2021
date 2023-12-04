package com.project.ecommerce.tool;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CookieService {
	HttpServletRequest request;
	HttpServletResponse response;
	
	public CookieService(HttpServletRequest request,HttpServletResponse response )
	{
		this.response=response;
		this.request=request;
				
	}

	public Cookie get(String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals(name)) {
					return cookie;
				}
			}
		}
		return null;
	}
	/**
	 * Doc gia tri cookie
	 * @param name Ten cookie muon doc
	 * @param defval Gia tri mac dinh
	 * @return Gia tri cookie hoac defval neu cookie khong ton tai
	 */
	public String getValue(String name, String defval) {
		Cookie cookie = get(name);
		if(cookie == null) {
			return defval;
		}
		String value = cookie.getValue();
		return XString.fromBase64(value);
	}
	/**
	 * Doc cac gia tri cua cookie
	 * @param name Ten cookie chua nhieu gia tri
	 * @return Mang chuoi chua nhieu gia tri cookie
	 */
	public String[] getValues(String name) {
		String value = getValue(name, "");
		if(value.length() > 0) {
			return  value.split("&");
		}
		return  new String[0];
	}
	/**
	 * Gui cookie ve client de luu lai
	 * @param cookie Cookie can gui
	 * @param days So ngay ton tai cua cookie
	 */
	public void add(Cookie cookie, int days) {
		cookie.setMaxAge(days * 24 * 60 * 60);
		response.addCookie(cookie);
	}
	/**
	 * Tao va gui cookie ve client de luu lai
	 * @param name Ten cookie
	 * @param days So ngay ton tai cua cookie
	 * @param values Cac gia tri cua cookie
	 */
	public void add(String name, int days, String...values) {
		Cookie cookie = new Cookie(name, XString.toBase64(String.join("&", values)));
		cookie.setPath("/");
		this.add(cookie, days);
	}
	/**
	 * Xoa cookie
	 * @param name Ten cookie can xoa
	 */
	public void delete(String name) {
		this.add(name, 0);
	}

}
