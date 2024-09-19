package com.audiro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor
public class FavoriteUpdateReqDto {
	private Integer travelDestinationId;
    private String signedInUser;
    private int isFavorite;
}
