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
public class DetailsReviewDto {
		
	private Integer postId;
	private Integer usersId;
	private String nickname;
	private String title;
	private String content;
	private Integer good;
	private Integer travelPlanId;
	private LocalDateTime modifiedTime;
	private Integer favoritePost;
	private Integer favoriteUserId;
	private String id;
	//private String formattedModifiedTime; //시간타입변환해서 저장용도
	private Integer commentId;
	private String path;
	
	public static DetailsReviewDto fromEntity(Post post) {
		
		return DetailsReviewDto.builder().postId(post.getPostId())
				.usersId(post.getUsersId())
				.nickname(post.getNickname())
				.title(post.getTitle())
				.content(post.getContent())
				.good(post.getGood())
				.travelPlanId(post.getTravelPlanId())
				.modifiedTime(post.getModifiedTime())
				.favoriteUserId(post.getInterestedUserId())
				.favoritePost(post.getFavoritePostId())
				.id(post.getId())	
				.commentId(post.getCommentId())
				.build();
		
	}
}
