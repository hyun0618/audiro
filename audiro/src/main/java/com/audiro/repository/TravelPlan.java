package com.audiro.repository;

import java.sql.Timestamp;
import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TravelPlan {
	private Integer travelPlanId;
	private Integer usersId;
	private String title;
	private LocalDate startDate;
	private Integer duration;
	private LocalDate endDate;
	private Integer isReviewed;
	private Timestamp createdTime;
	private Timestamp modifiedTime;
}
