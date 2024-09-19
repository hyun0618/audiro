package com.audiro.dto;

import com.audiro.repository.Comment;

import lombok.Data;

@Data
public class CommunityCommentsCreateDto {
    private Integer postId;
    private String content;
    private Integer usersId;
    private Integer isPrivate;
//    private Integer commentsId;
//    private String path;
//    private String nickname;
    
    public Comment toEntity() {
    	return Comment.builder()
    			.postId(postId)
    			.content(content)
    			.usersId(usersId)
    			.isPrivate(isPrivate)
    			.build();
    }
}
