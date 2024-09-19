package com.audiro.repository;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.audiro.dto.DetailedPlanDto;

public interface TravelPlanDao {

	Long insertTravelPlan(@Param("plan") TravelPlan plan);

	Long insertDetailedPlan(DetailedPlan detailedPlan);

	List<TravelPlan> selectAllTrvaelPlan(int usersId);
	
	List<TravelPlan>selectAllTrvaelPlanOrderByTitle(int usersId);

	TravelPlan selectTravelPlanById(int travelPlanId);

	List<DetailedPlanDto> selectDetailedPlan(int travelPlanId);
	
	Integer selectMaxDay(int travelPlanId);
	
	Integer updateTravelPlan(TravelPlan plan);
	
	Integer deleteAllDetailedPlan(int travelPlanId);
	
	Integer deletePlanById(int travelPlanId);
	
	
}
