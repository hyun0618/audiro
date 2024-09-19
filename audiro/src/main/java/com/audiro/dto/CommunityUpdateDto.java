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
public class CommunityUpdateDto {
	private Integer postId;  				//Primary key.
	private Integer postTypeId;				//Foregin key: post_type 테이블의 post_type_id(pk) 컬럼을 참조.
	private String title;					//게시글 제목.
	private String content;					//게시글 내용.
	
	public Post toEntity() {
        return Post.builder().postId(postId).postTypeId(postTypeId).title(title).content(content).build();
    }

}
