package com.audiro.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.audiro.dto.CommentCreateDto;
import com.audiro.dto.CommentItemDto;
import com.audiro.dto.CommentUpdateDto;
import com.audiro.repository.Comment;
import com.audiro.repository.CommentDao;
import com.audiro.repository.Post;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class CommentsService {

	private final CommentDao commentDao; // 생성자에 의한 의존성 주입

	// 게시글 모든 댓글 불러오기
	public List<CommentItemDto> selectByPostId(Integer postId) {
		List<Comment> list = commentDao.selectByCommentsId(postId);
		Map<Integer,List<Comment>> commentMap= new HashMap<Integer,List<Comment>>();
		list.stream().forEach(cmm->{	// 같은 부모댓글을 가진 묶음을 담은 map을 생성
			List<Comment> result = commentMap.get(cmm.getParentCommentId());
			if(result == null) {
				result = new ArrayList<Comment>();
				commentMap.put(cmm.getParentCommentId(),result);
			}
			result.add(cmm);
		});
		
		return makeCommentList(null, commentMap);

	}
	//대댓글(자식댓글찾아서 불러오기)
	public List<CommentItemDto> makeCommentList(Integer parentCommentId, Map<Integer,List<Comment>> commentMap){
		List<CommentItemDto> result = commentMap	// 같은 부모를 가진 형제댓글 그룹을 리스트로 변경
				.getOrDefault(parentCommentId, new ArrayList<Comment>())	// 만약 해당 부모 댓글의 자식댓글이 존재하지 않는 경우 빈 리스트를 반환
				.stream()
				.map(CommentItemDto::fromEntity)
				.toList();
		
		result.stream().forEach(cmm->{
			cmm.setChildComment(makeCommentList(	// 현재 댓글의 자식댓글을 찾아 자식 댓글의 리스트를 입력하기 위한 재귀호출
					cmm.getCommentsId(), commentMap)
					.stream()	// 이 아래로 자식댓글의 정렬은 오름차순(나중에 적힌 댓글이 아래로) 위한 정렬
					.sorted((o1,o2)->o1.getCommentsId()-o2.getCommentsId())
					.toList());
		});
		
		return result;
	}

	// 대댓글 추가
	public int create(CommentCreateDto dto) {
		log.debug("create({})", dto);
		int result = commentDao.insert(dto);
		return result; 
	}
	
	//새 댓글 추가
	public int newCreate(CommentCreateDto dto) {
		log.debug("create({})", dto);
		int result = commentDao.newInsert(dto);
		return result; 
	}
	
	// 댓글 수정
	public int update(CommentUpdateDto dto) {
		log.debug("update({})", dto);
		int result = commentDao.update(dto);
		return result;
	}
	//댓글 1개 삭제
	public int deleteById(Integer commetid) {
		log.debug("deleteById(id={})", commetid);

		int result = commentDao.deleteById(commetid);

		return result;
	}

}