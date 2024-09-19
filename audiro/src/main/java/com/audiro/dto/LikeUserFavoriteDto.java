package com.audiro.dto;

import lombok.Data;

@Data
public class LikeUserFavoriteDto {
	private Integer favoriteUsersId;
	private Integer usersId;
	private Integer interestedUserId;
	private String id;

}
