package com.audiro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor
public class FavoriteListUserStateReqDto {
	private Integer interestedUserId;
	private String userId;
}
