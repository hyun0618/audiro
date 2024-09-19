package com.audiro.dto;

import java.time.LocalDateTime;

import com.audiro.repository.Post;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommunityPostListDto {
	//통합(전체)게시판 목록 select 해온걸 Dto타입으로 변환.
	private Integer postId;  				//Primary key.
	private Integer usersId;				//Foregin Key: users 테이블의 usres_id(pk) 컬럼을 참조.
	private Integer postTypeId;				//Foregin key: post_type 테이블의 post_type_id(pk) 컬럼을 참조.
	private String title;					//게시글 제목.
	private String content;					//게시글 내용.
	
	//json 날짜 형식 변환 처리.
	@JsonFormat(pattern = "YYYY-MM-dd hh:mm:ss")
	private LocalDateTime createdTime;		//댓글 최초 작성 시간.
	@JsonFormat(pattern = "YYYY-MM-dd hh:mm:ss")
	private LocalDateTime modifiedTime;		//댓글 최종 수정 시간.
	private Integer good;					//게시글 좋아요 갯수.
//	private Integer travelPlanId;			//Foregin Key: travel_plan테이블의 travel_plan_id(pk) 컬럼을 참조.
	
	private String nickname;     // 작성자 닉네임 (JOIN 된 users 테이블의 필드)
	private String id;
	//post타입을 dto타입으로(CommunityPostListDto)로 변환
	public static CommunityPostListDto fromEntity(Post post) {
		
		return CommunityPostListDto.builder()
				.postId(post.getPostId())
				.usersId(post.getUsersId())
				.postTypeId(post.getPostTypeId())
				.title(post.getTitle())
				.content(post.getContent())
				.createdTime(post.getCreatedTime())
				.modifiedTime(post.getModifiedTime())
				.good(post.getGood())
				.nickname(post.getNickname())
				.id(post.getId())
				.build();
	}

}
