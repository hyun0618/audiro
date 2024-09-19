package com.audiro.repository;


import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// DB 테이블 Post의 Model 담당
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post {

	private Integer postId;  				//Primary key.
	private Integer usersId;				//Foregin Key: users 테이블의 usres_id(pk) 컬럼을 참조.
	private Integer postTypeId;				//Foregin key: post_type 테이블의 post_type_id(pk) 컬럼을 참조. (10:여행후기, 20:여행메이트, 30:자유)
	private String title;					//게시글 제목.
	private String content;	
	@JsonFormat(pattern = "YYYY-MM-dd hh:mm:ss")//게시글 내용.
	private LocalDateTime createdTime;
	@JsonFormat(pattern = "YYYY-MM-dd hh:mm:ss")//게시글 최초 작성 시간.
	private LocalDateTime modifiedTime;		//게시글 최종 수정 시간.
	private Integer good;					//게시글 좋아요 갯수.
	private Integer travelPlanId;			//Foregin Key: travel_plan테이블의 travel_plan_id(pk) 컬럼을 참조.
	private String nickname;                //닉네임
	private Integer favoritePostId;         //관심 여행후기 테이블 pk 
	private Integer commentId;				//댓글 pk
	private String formattedModifiedTime;   //포맷팅된 수정 시간
	private Integer interestedUserId;       //관심유저를 받은 유저의 pk
	private String id;                      //유저 아이디
    private String path;                    //프로필 이미지 경로
    private String introduction;            //프로필 자기소개
}