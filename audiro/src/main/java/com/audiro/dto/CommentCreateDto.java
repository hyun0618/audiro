package com.audiro.dto;

import com.audiro.repository.Comment;

import lombok.Data;

// 댓글을 등록할 때 요청 파라미터로 전달되는 값들을 저장하기 위한 DTO
@Data
public class CommentCreateDto {
    private Integer postId;
    private String content;
    private Integer usersId;
    private String id;
    private String path;
    private Integer isPrivate;
    private Integer parentCommentId;
    private Integer commentsId;
    
 
    
    // CommentCreateDto 타입을 Comment 타입으로 변환해서 리턴.
    public Comment toEntity() {
        return Comment.builder()
                .postId(postId)
                .content(content)
                .usersId(usersId)
                .id(id)
                .path(path)
                .isPrivate(isPrivate)
                .parentCommentId(parentCommentId)
                .commentsId(commentsId)
                .build();
    }
}