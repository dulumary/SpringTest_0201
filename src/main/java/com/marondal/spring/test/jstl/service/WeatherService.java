package com.marondal.spring.test.jstl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.spring.test.jstl.domain.Weather;
import com.marondal.spring.test.jstl.repository.WeatherHistoryRepository;

@Service
public class WeatherService {
	
	@Autowired
	private WeatherHistoryRepository weatherHistoryRepository;
	
	public List<Weather> getWeatherHistory() {
		
		List<Weather> weatherHistory = weatherHistoryRepository.selectWeatherHistory();
		
		return weatherHistory;
	}
	
	public int addWeather(
			String  date
			, String weather
			, double temperatures
			, double precipitation
			, String microDust
			, double windSpeed) {
		
		int count = weatherHistoryRepository.insertWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		return count;
	}
	
	

}
