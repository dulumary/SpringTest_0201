package com.marondal.spring.test.jstl.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.marondal.spring.test.jstl.domain.Weather;

@Mapper
public interface WeatherHistoryRepository {
	
	public List<Weather> selectWeatherHistory();

}
