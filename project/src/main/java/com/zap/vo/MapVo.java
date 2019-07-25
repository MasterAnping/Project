package com.zap.vo;

import java.util.Map;

public class MapVo {
	
	private Map<String,String> map;

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	

	@Override
	public String toString() {
		return "MapVo [map=" + map + "]";
	}
	
	

}
