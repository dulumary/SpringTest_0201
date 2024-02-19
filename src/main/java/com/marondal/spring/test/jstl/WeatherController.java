package com.marondal.spring.test.jstl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.marondal.spring.test.jstl.domain.Weather;
import com.marondal.spring.test.jstl.service.WeatherService;

@Controller
public class WeatherController {
	
	@Autowired
	private WeatherService weatherService;
	
	@GetMapping("/jstl/weather/list")
	public String weatherList(Model model) {
		
		// 날씨 리스트 얻어오기 
		List<Weather> weatherHistory = weatherService.getWeatherHistory();
		
		model.addAttribute("weatherList", weatherHistory);
		
		return "jstl/weather/list";
	}

}
