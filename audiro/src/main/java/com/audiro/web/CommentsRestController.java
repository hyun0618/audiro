package com.audiro.web;

import com.audiro.dto.CommentCreateDto;
import com.audiro.dto.CommentItemDto;
import com.audiro.repository.Comment;
import com.audiro.repository.CommentDao;
import com.audiro.service.CommentsService;

import jakarta.servlet.http.HttpSession;

import com.audiro.dto.CommentUpdateDto;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController // 리턴하는 값은 뷰 이름이 아니라, 클라이언트로 직접 전송(응답)되는 데이터.
@RequestMapping("/api/comment")

public class CommentsRestController {
	private final CommentsService commentsService; // 생성자에 의한 의존성 주입
	
	public final CommentDao commentDao;
	
	
	//댓글불러오기
	@GetMapping("/{postId}")
	public List<CommentItemDto> selectByPostId(@PathVariable(value = "postId") Integer postId) {
		return commentsService.selectByPostId(postId);
	}
	
	//대 댓글등록
	@PostMapping("/")
	public ResponseEntity<Integer> insertComment(@RequestBody CommentCreateDto dto, HttpSession session) {
		String id = (String) session.getAttribute("signedInUser");
		Integer usersId =  (Integer) session.getAttribute("signedInUsersId");
		dto.setId(id);
		dto.setUsersId(usersId);
		log.debug("insertComment={}",dto);
	
		int result = commentDao.insert(dto);
		return ResponseEntity.ok(result);
	}
	
	//새 댓글등록
	@PostMapping("/new")
	public ResponseEntity<Integer> newInsertComment(@RequestBody CommentCreateDto dto, HttpSession session) {
		String id = (String) session.getAttribute("signedInUser"); // 세션에서 ID 가져오기
		log.debug("Signed in user ID from session: " + id); 
		
		if (id == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // 유저가 로그인되어 있지 않은 경우 처리
	    }
		
	    dto.setId(id); // DTO에 ID 설정		
		int result = commentDao.newInsert(dto);
		return ResponseEntity.ok(result);
	}
	
	// 댓글 수정
	@PutMapping("/{commentsId}")
	public ResponseEntity<Integer> updateComment(@PathVariable int commentsId,
            									 @RequestBody CommentUpdateDto dto) {
        log.debug("updateComment(id={}, dto={})", commentsId, dto);
        
        dto.setCommentsId(commentsId);
        int result = commentDao.update(dto); 
        
        return ResponseEntity.ok(result);
    }
	
	//댓글 삭제
	@DeleteMapping("/{commentsId}")
	public ResponseEntity<Integer> deleteById(@PathVariable int commentsId) {
        
        int result = commentDao.deleteById(commentsId);
        
        return ResponseEntity.ok(result);
	}
	
}