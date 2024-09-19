package com.audiro.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor
public class FavoriteListPostUpdateReqDto {
	private Integer postId;
    private String signedInUser;
    private int isFavorite;
}
