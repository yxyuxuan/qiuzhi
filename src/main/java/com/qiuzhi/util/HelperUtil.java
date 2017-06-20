package com.qiuzhi.util;

import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 工具类
 *
 */
public class HelperUtil {
	
	/**
	 * 获得session
	 * @return
	 */
	private static HttpSession getSession(){
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpSession session = requestAttributes.getRequest().getSession();
		return session;
	}
	
	/**
	 * 向session中存入键值对
	 * @param key
	 * @param value
	 */
	public static void setKeyAndValue(String key, String value) {
		HttpSession session = HelperUtil.getSession();
		if(value==null || value.isEmpty()){
			return ;
		}
		session.setAttribute(key, value);
		// TODO: delete
		System.out.println("set => [key:" + key + " value:" + value + "]");

	}

	/**
	 * 根据key从session中获取对应的值
	 * 如果value不存在 则返回 null
	 * @param key
	 * @return
	 */
	public static String getValueByKey(String key) {
		HttpSession session = HelperUtil.getSession();
		Object object = session.getAttribute(key);
		if(object==null){
			return null;
		}
		return   String.valueOf(object);
	}
	
	/**
	 * 从session中删除键值对
	 * @param key
	 */
	public static void removeKeyAndValue(String key){
		HttpSession session = HelperUtil.getSession();
		session.removeAttribute(key);
	}
	

	/**
	 * 清空 session
	 */
	public static void clearKeyAndValue(){
		HttpSession session = HelperUtil.getSession();
		session.invalidate();
	}
	

}