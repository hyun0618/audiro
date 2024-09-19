package com.audiro.dto;

import com.audiro.repository.Comment;
import com.audiro.repository.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentItemDto {

    private Integer commentsId; // 철자 수정
    private Integer parentCommentsId; // 철자 수정
    private String content;
    private String nickname;
    private String path; // 프로필 이미지 경로
    private Timestamp modifiedTime; // JS에서 시간/날짜 타입을 표현하기 위해서.
    private List<CommentItemDto> childComment;
    
    // Comment 타입의 객체를 CommentItemDto 타입 객체로 변환해서 리턴하는 메서드.
    public static CommentItemDto fromEntity(Comment comment) {
        return CommentItemDto.builder()
                .commentsId(comment.getCommentsId()) 
                .parentCommentsId(comment.getParentCommentId())
                .content(comment.getContent()) 
                .nickname(comment.getNickname()) 
                .path(comment.getPath()) 
                .modifiedTime(Timestamp.valueOf(comment.getModifiedTime()))
                .build();
    }
}