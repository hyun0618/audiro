package com.audiro.repository;


import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor @Builder
public class FavoritePost {
	private Integer favoritePostId;
	private Integer usersId;
	private Integer postId;
	private LocalDateTime createdTime;
	private String favoritePostTitle;

}
