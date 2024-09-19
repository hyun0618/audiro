package com.audiro.repository;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DetailedPlan {
	private Integer detailedPlanId;
	private Integer travelPlanId;
	private Integer destinationId;
	private Integer day;
	private LocalDate startTime;
	private LocalDate endTime;
}
