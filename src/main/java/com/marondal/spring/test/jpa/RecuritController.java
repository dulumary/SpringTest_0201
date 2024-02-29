package com.marondal.spring.test.jpa;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.marondal.spring.test.jpa.domain.Recruit;
import com.marondal.spring.test.jpa.repository.RecruitRepository;

@RequestMapping("/jpa/recruit")
@Controller
public class RecuritController {
	
	@Autowired
	private RecruitRepository recruitRepository;
	
	@GetMapping("/read/1")
	@ResponseBody
	public Recruit readRecurit() {
		Optional<Recruit> optionalRecruit = recruitRepository.findById(8);
		Recruit recruit = optionalRecruit.orElse(null);
		
		return recruit;
	}
	
	@GetMapping("/read/2")
	@ResponseBody
	public List<Recruit> readRecruitByCompanyId(@RequestParam("companyId") int companyId) {
		List<Recruit> recruitList = recruitRepository.findByCompanyId(companyId);
		
		return recruitList;
	}
	
	@GetMapping("/read/3")
	@ResponseBody
	public List<Recruit> readRecruit() {
		// 웹 back-end 개발자 이고 정규직 인 공고 
//		List<Recruit> recruitList = recruitRepository.findByPositionAndType("웹 back-end 개발자", "정규직");
//		List<Recruit> recruitList = recruitRepository.findByTypeOrSalaryGreaterThanEqual("정규직", 9000);
//		List<Recruit> recruitList = recruitRepository.findTop3ByTypeOrderBySalaryDesc("계약직");
//		List<Recruit> recruitList = recruitRepository.findByRegionAndSalaryBetween("성남시 분당구", 7000, 8500);
		List<Recruit> recruitList = recruitRepository.findByNativeQuery("2026-04-10 00:00:00", 8100, "정규직");
		return recruitList;
	}

}
