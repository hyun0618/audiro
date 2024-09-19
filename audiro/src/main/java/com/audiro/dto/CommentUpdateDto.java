package com.audiro.dto;

import java.time.LocalDateTime;

import com.audiro.repository.Comment;

import lombok.Data;

// 댓글 업데이트 요청의 요청 파라미터들을 저장하기 위한 DTO.
@Data
public class CommentUpdateDto {
    private Integer commentsId;
    private String content;
    private Integer isPrivate;
    private LocalDateTime modifiedTime;
    
    
    // 프로필에서 닉네임과 이미지 수정되면 댓글 의 닉네임과 이미지들도 자동으로 수정되는지,,,????

    // CommentUpdateDto 타입을 Comment 타입으로 변환해서 리턴.
    public Comment toEntity() {
        return Comment.builder().commentsId(commentsId)
        		.content(content)
        		.isPrivate(isPrivate)
        		.modifiedTime(modifiedTime)
        		.build();
    }
}