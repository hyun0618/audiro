package com.audiro.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LikeReviewPostDto {
	private Integer favoritePostId;
	private Integer usersId;
	private Integer postId;
	private Integer isChecked;
	private String id;

}

