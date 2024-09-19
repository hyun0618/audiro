package com.audiro.dto;

import java.time.LocalDate;

import com.audiro.repository.DetailedPlan;

import lombok.Data;

@Data
public class DetailedPlanDto {
	private Integer detailedPlanId;
	private Integer travelPlanId;
	private Integer destinationId;
	private Integer day;
	private LocalDate startTime;
	private LocalDate endTime;
	private String name;
	private String imgUrl;
	private Integer favoriteDestinationId;
	
	public DetailedPlan toEntity() {
		return DetailedPlan.builder()
				.travelPlanId(travelPlanId)
				.destinationId(destinationId)
				.day(day)
				.startTime(startTime)
				.endTime(endTime)
				.build();
	}
}
