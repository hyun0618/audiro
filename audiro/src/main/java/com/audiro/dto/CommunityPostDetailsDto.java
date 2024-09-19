package com.audiro.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class CommunityPostDetailsDto {
	//post
	private Integer postId;  				//Primary key.
	private Integer usersId;				//Foregin Key: users 테이블의 usres_id(pk) 컬럼을 참조.
	private Integer postTypeId;				//Foregin key: post_type 테이블의 post_type_id(pk) 컬럼을 참조. (10:여행후기, 20:여행메이트, 30:자유)
	private String title;					//게시글 제목.
	private String content;					//게시글 내용.
	@JsonFormat(pattern = "YYYY-MM-dd hh:mm:ss")
	private LocalDateTime createdTime;		//게시글 최초 작성 시간.
	@JsonFormat(pattern = "YYYY-MM-dd hh:mm:ss")
	private LocalDateTime modifiedTime;		//게시글 최종 수정 시간.
	private Integer good;					//게시글 좋아요 갯수.
	
	//user
	private String id;
	private String passwordHash;
	private String userName;
	private String nickname;
	private String phone;
	private String email;

	//profile
    private String path;                    //프로필 이미지 경로

}
