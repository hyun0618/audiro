package com.audiro.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteDestination {
	private Integer favoriteDestinationId;
	private Integer usersId;
	private Integer destinationId;
	private LocalDateTime createdTime;
	
	private String favoriteDestination;
	private String imgUrl;

}
