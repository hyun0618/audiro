package com.audiro.repository;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor @Builder
public class FavoriteUsers {
	private Integer favoriteUsersId;
	private Integer usersId;
	private Integer interestedUserId;
	private LocalDateTime createdTime;
	private String interestedUserNickname;


}
