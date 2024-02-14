package com.marondal.spring.test.jsp.repository;

import org.apache.ibatis.annotations.Mapper;

import com.marondal.spring.test.jsp.domain.Realtor;

@Mapper
public interface RealtorRepository {
	
	public int insertRealtor(Realtor realtor);

}
