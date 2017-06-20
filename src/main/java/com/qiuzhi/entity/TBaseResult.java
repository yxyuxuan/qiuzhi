package com.qiuzhi.entity;

public class TBaseResult<T> extends BaseResult {
	private T data;

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
}
