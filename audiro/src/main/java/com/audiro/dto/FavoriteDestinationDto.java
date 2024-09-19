package com.audiro.dto;

import java.time.LocalDateTime;

import com.audiro.repository.FavoriteDestination;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor @Builder
public class FavoriteDestinationDto {

	private Integer favoriteDestinationId;
	private Integer usersId;
	private Integer destinationId;
	private LocalDateTime createdTime;
	private String favoriteDestination;
	private String imgUrl;
	private String name;

	public static FavoriteDestinationDto fromEntity(FavoriteDestination favoritedestination) {
		return FavoriteDestinationDto.builder()
				.favoriteDestinationId(favoritedestination.getFavoriteDestinationId())
				.usersId(favoritedestination.getUsersId())
				.destinationId(favoritedestination.getDestinationId())
				.createdTime(favoritedestination.getCreatedTime())
				.favoriteDestination(favoritedestination.getFavoriteDestination())
				.imgUrl(favoritedestination.getImgUrl())
				.build();
	}
	
}
	


