package com.zap.vo;

import java.util.List;

public class OneToMany<K, V> {

	private K one;
	private List<V> many;

	public OneToMany() {
	}

	public OneToMany(K one, List<V> many) {
		this.one = one;
		this.many = many;
	}

	public K getOne() {
		return one;
	}

	public void setOne(K one) {
		this.one = one;
	}

	public List<V> getMany() {
		return many;
	}

	public void setMany(List<V> many) {
		this.many = many;
	}

}
