package com.marondal.spring.test.jstl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.marondal.spring.test.jstl.domain.Weather;
import com.marondal.spring.test.jstl.service.WeatherService;

@Controller
@RequestMapping("/jstl/weather")
public class WeatherController {
	
	@Autowired
	private WeatherService weatherService;
	
	@GetMapping("/list")
	public String weatherList(Model model) {
		
		// 날씨 리스트 얻어오기 
		List<Weather> weatherHistory = weatherService.getWeatherHistory();
		
		model.addAttribute("weatherList", weatherHistory);
		
		return "jstl/weather/list";
	}
	
	@GetMapping("/input")
	public String inputWeather() {
		return "jstl/weather/input";
	}
	
	@GetMapping("/insert")
	public String insertWeather(
			@RequestParam("date") Date date
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed) {
		
		
		int count = weatherService.addWeather(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		return "redirect:/jstl/weather/list";
		
//		return "수행결과 : " + count;
		
	}
	
	
	
	
	
	
	
	
	

}
