package com.audiro.repository;

import java.util.List;

import com.audiro.dto.CommentCreateDto;
import com.audiro.dto.CommentUpdateDto;


public interface CommentDao {
	// Comments-mapper.xml에서 id가 같은 SQL을 실행하는 메서드.  
	
	//postId로 모든 댓글 불러오기
	List<Comment> selectByCommentsId(Integer commentId);
	
	//새 댓글 추가하기
    int newInsert(CommentCreateDto dto);
    
    // 댓글 내용, 수정 시간을 업데이트
    int update(CommentUpdateDto dto);
    
    // 댓글 아이디로 삭제
    int deleteById(Integer commentsId);
    
    // 포스트에 달려 있는 모든 댓글 삭제
    int deleteByPostId(Integer postId);
    
    // 포스트에 달려 있는 댓글 개수를 검색
    Integer selectCommentCount(Integer postId);
    
    // 댓글 아이디(PK)로 검색
    Comment selectById(Integer commentsId);
    
    // 대 댓글 추가
    int insert(CommentCreateDto dto);
    
}