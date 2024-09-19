package com.audiro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor
public class FavoriteListDestUpdateReqDto {
	private Integer destinationId;
    private String signedInUser;
    private int isFavorite;
}
