package com.marondal.spring.test.ajax;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marondal.spring.test.ajax.domain.Booking;
import com.marondal.spring.test.ajax.service.BookingService;

@RequestMapping("/ajax/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingService bookingService;
	
	
	@GetMapping("/main")
	public String bookingMain() {
		return "ajax/booking/main";
	}
	
	@GetMapping("/list")
	public String bookingList(Model model) {
		
		List<Booking> bookingList = bookingService.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		return "ajax/booking/list";
	}
	
	@GetMapping("/input")
	public String inputBooking() {
		return "ajax/booking/input";
		
	}
	
	@GetMapping("/create")
	@ResponseBody
	public Map<String, String> createBooking(
			@RequestParam("name") String name
			, @DateTimeFormat(pattern="yyyy년 M월 d일") @RequestParam("date") Date date // 2024년 2월 12일
			, @RequestParam("day") int day
			, @RequestParam("headcount") int headcount
			, @RequestParam("phoneNumber") String phoneNumber) {
	
		int count = bookingService.addBooking(name, date, day, headcount, phoneNumber);
		
		// 성공 : {"result":"success"}
		// 실패 : {"result":"fail"}
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteBooking(@RequestParam("id") int id) {
	
		int count = bookingService.deleteBooking(id);
		
		// 성공 : {"result":"success"}
		// 실패 : {"result":"fail"}
		
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	// 이름과 전화번호를 전달 받고, 일치하는 예약 정보를 돌려주는 API
	@GetMapping("/search")
	@ResponseBody
	public Map<String, Object> searchBooking(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Booking booking = bookingService.getBooking(name, phoneNumber);
		
		// 조회 결과가 있는지 없는지를 명확히 구분 해서 response를 구성
		// 조회 성공 실패 여부를 response에 추가
		// 조회 성공시 : {"result":"success", "booking":{"name":"혜리", "date":"2024-02-26", "day":2, ....}
		// 조회 실패시 : {"result":"fail"}
		
		Map<String, Object> resultMap = new HashMap<>();
		if(booking != null) {
			// 조회 성공
			resultMap.put("result", "success");
			resultMap.put("booking", booking);
		} else {
			// 조회 실패
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	

}
