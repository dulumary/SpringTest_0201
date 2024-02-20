package com.marondal.spring.test.jstl.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.marondal.spring.test.jstl.domain.Weather;

@Mapper
public interface WeatherHistoryRepository {
	
	public List<Weather> selectWeatherHistory();
	
	public int insertWeather(@Param("date") Date date
			, @Param("weather") String weather
			, @Param("temperatures") double temperatures
			, @Param("precipitation") double precipitation
			, @Param("microDust") String microDust
			, @Param("windSpeed") double windSpeed);
	
	public int insertWeatherByObject(Weather weather);

}
