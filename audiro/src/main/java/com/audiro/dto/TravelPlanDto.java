package com.audiro.dto;

import java.time.LocalDate;

import com.audiro.repository.TravelPlan;

import lombok.Data;

@Data
public class TravelPlanDto {
	private int travelPlanId; // travel_plan_id
	private Integer usersId;
	private String title;
	private LocalDate startDate;
	private Integer duration;
	private LocalDate endDate;
	
	public TravelPlan toEntity() {
		return TravelPlan.builder()
				.travelPlanId(travelPlanId)
				.usersId(usersId)
				.title(title)
				.startDate(startDate)
				.duration(duration)
				.endDate(endDate)
				.build();
	}
}
