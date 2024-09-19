package com.audiro.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class RecentlyViewedDto {
	private Integer destinationId;
	private String userId;
	private String name;       
    private String imgUrl;    
    private LocalDateTime viewedAt; 
}
