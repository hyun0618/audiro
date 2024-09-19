package com.audiro.dto;

import java.sql.Clob;
import java.time.LocalDateTime;

import com.audiro.repository.Post;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonFormat(pattern = "yyyy년 mm월 dd일")
public class ListReviewDto {
	
	private Integer postId;
	private Integer usersId;
	private String nickname;
	private String title;
	private String content;
	private Integer good;
	private Integer travelPlanId;
	private LocalDateTime modifiedTime;
	private Integer favoritePost;
	private String id;
	
	public static ListReviewDto fromEntity(Post post) {
		
		return ListReviewDto.builder().postId(post.getPostId())
				.usersId(post.getUsersId())
				.nickname(post.getNickname())
				.title(post.getTitle())
				.content(post.getContent())
				.good(post.getGood())
				.travelPlanId(post.getTravelPlanId())
				.modifiedTime(post.getModifiedTime())
				.favoritePost(post.getFavoritePostId())
				.id(post.getId())
				.build();
		
	}

}