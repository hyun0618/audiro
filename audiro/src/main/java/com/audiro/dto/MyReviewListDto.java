package com.audiro.dto;

import java.time.LocalDateTime;

import com.audiro.repository.Post;
import com.audiro.repository.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MyReviewListDto {
	
	private Integer postId;
	private Integer usersId;
	private String  id;
	private String nickname;
	private String title;
	private LocalDateTime modifiedTime;
	private Integer favoritePost; //찜담은 여행후기에서
	private Integer favoriteUserId; //관심유저 고유키 별칭으로가져옴.
	private String path; //프로필경로
	private String introduction; //프로필 자기소개
	private String content;
	private String formattedModifiedTime; //시간타입변환해서 저장용도
	
	public static MyReviewListDto fromEntity(Post post) {
		return MyReviewListDto.builder()
				.postId(post.getPostId())
				.usersId(post.getUsersId())
				.id(post.getId())
				.nickname(post.getNickname())
				.title(post.getTitle())
				.modifiedTime(post.getModifiedTime())
				.favoritePost(post.getFavoritePostId())
				.favoriteUserId(post.getInterestedUserId())
				.path(post.getPath())
				.introduction(post.getIntroduction())
				.content(post.getContent())
				.formattedModifiedTime(post.getFormattedModifiedTime())
				.build();
	}
}