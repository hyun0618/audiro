package com.audiro.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.DetailsReviewDto;
import com.audiro.dto.LikeReviewPostDto;
import com.audiro.dto.LikeUserFavoriteDto;
import com.audiro.dto.ListReviewDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.dto.SearchReviewDto;
import com.audiro.repository.DraftPost;
import com.audiro.repository.FavoriteUsers;
import com.audiro.repository.Post;
import com.audiro.repository.ReviewDao;
import com.audiro.repository.User;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor // final 필드들을 초기화하는 아규먼트를 갖는 생성자.
public class ReviewService {

	private final ReviewDao reviewDao;

	// 여행후기 게시판 최신순,좋아요순 정렬
	public List<Post> getReviewsSortedBy(String sort) {
		List<Post> reviews = null;
		// 데이터베이스 또는 기타 저장소에서 리뷰 목록을 가져오는 로직 구현
		if ("likes".equals(sort)) {
			// 좋아요 순으로 정렬된 리뷰 목록 반환
			reviews = reviewDao.rankingGoodReview();
		} else if ("latest".equals(sort)) {
			// 최신 순으로 정렬된 리뷰 목록 반환
		}
		reviews = reviewDao.selectReviewAll();
		// 기본 정렬
		return reviews = reviewDao.selectReviewAll();
	}

	// 내 여행일기 리스트 불러오기
		public List<MyReviewListDto> myReviewList(MyReviewListDto dto) {
			List<MyReviewListDto> list = reviewDao.readMyReview(dto.getId());
			
			
			
			log.debug("myReviewList={}", list);
			return list;

	}
	//프로필 이미지 가져오기
	public String img(Integer id) {
		String profileimg = reviewDao.profileImg(id);
		return profileimg;
	}

	// 나를 찜한 유저 수
	public int countLike(String id) {

		int result = reviewDao.countLike(id);
		return result;
	}

	// 내 여행일기 갯수
	public int countMyReveiw(String id) {
		int result = reviewDao.countMyReveiw(id);
		return result;
	}
	
	//여행후기 찜 수
	public int countFavorite(Integer postId) {
		int result = reviewDao.countFavoriteReveiw(postId);
		return result;
	}
	
	//여행후기 굿 수
	public int countGood(Integer postId) {
		int result = reviewDao.countGoodByPostId(postId);
		return result;
	}
	

	// 여행후기 많이작성한 유저 TOP3
	public List<Post> selectUserTop3() {
		List<Post> list = reviewDao.selectReviewUserTop3();
		return list;
	}

	// 여행후기 찜 담기// 
	public int LikeReview(LikeReviewPostDto dto) {
		int list = reviewDao.addLikeReview(dto);
		return list;
	}
	
	  //여행후기 찜 삭제 
	public int deleteLikeReview(LikeReviewPostDto dto) { 
		int list = reviewDao.deleteLikeReview(dto); 
		return list; 
		}
	 

	///////////////////////////////////////////////////////
	// 내 여행후기게시판 상세보기
	public DetailsReviewDto readById(DetailsReviewDto dto) {

		DetailsReviewDto list = reviewDao.readDetailsReviewById(dto);
		
		// 날짜 포맷팅을 위한 패턴 설정
	    //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	    // LocalDateTime 객체를 포맷팅된 문자열로 변환
	    //String formattedModifiedTime = list.getModifiedTime().format(formatter);

	    // 변환된 문자열을 설정
	    //list.setFormattedModifiedTime(formattedModifiedTime);
	 
	    return list;
	}

	// 여행후기 게시글 저장
	public int create(CreateReviewDto dto) {
		
		// DTO 값 검증
        if (dto.getUsersId() == null || dto.getTitle() == null || dto.getContent() == null || dto.getId() == null) {
            throw new IllegalArgumentException("DTO contains null values");
        }
		
		int result = reviewDao.insertReview(dto.toEntity());

		return result;
	}

	
	// 여행후기 게시글 수정
	public int update(CreateReviewDto dto) {
		int result = reviewDao.updateReview(dto);

		return result;

	}

	// 여행후기 삭제
	public int delete(Integer postId) {
		int result = reviewDao.deleteReview(postId);
		return result;
	}

	// 여행후기 모두 불러오기(최신순)
	public List<ListReviewDto> readAll(SearchReviewDto dto, HttpSession session) {
	    Integer id = (Integer) session.getAttribute("signedInUsersId");
	    dto.setUsersId(id);
		List<Post> list = reviewDao.searchKeyword(dto);
		return list.stream().map(ListReviewDto::fromEntity).toList();
	}

	// 여행후기 검색
	public List<ListReviewDto> search(SearchReviewDto dto) {
		log.debug("dto={}", dto);
		List<Post> list = reviewDao.searchKeyword(dto);
		return list.stream().map(ListReviewDto::fromEntity).toList();
	}

	
	// 여행후기 담아있지는 확인.
	public boolean toggleFavorite(LikeReviewPostDto dto, HttpSession session) {
		// 세션에서 로그인한 유저 ID 가져오기
        Integer usersId = (Integer) session.getAttribute("signedInUsersId");
        dto.setUsersId(usersId); // 세션에서 가져온 로그인 유저 ID 설정
		
		// 여행후기 찜 담아있는 내용 불러오기.
		List<LikeReviewPostDto> favoritePostIds = reviewDao.getFavoritePostIds(dto);

		// 현재 유저가 찜한 게시물인지 확인
		if (favoritePostIds.size() > 0) {
			// 이미 찜한 경우 제거
			favoritePostIds.stream().forEach(ids->{
				reviewDao.deleteLikeReview(ids);
			});
			return false;
		} else {
			// 찜하지 않은 경우
			reviewDao.addLikeReview(dto);
			return true;
		}
	}
	
	
	// 관심유저 담아있지는 확인.
	public boolean togglUserFavorite(LikeUserFavoriteDto dto, HttpSession session) {
		
		// 세션에서 로그인한 유저 ID 가져오기
        Integer usersId = (Integer) session.getAttribute("signedInUserId");
        dto.setUsersId(usersId); // 세션에서 가져온 로그인 유저 ID 설정
        
		// 여행후기 찜 담아있는 내용 불러오기.
		List<LikeUserFavoriteDto> favoriteUserIds = reviewDao.getFavoriteUserIds(dto);

		// 현재 유저가 관심유저 담았는지 확인
		if (favoriteUserIds.size() > 0) {
			// 이미 찜한 경우 제거
			favoriteUserIds.stream().forEach(ids->{
				reviewDao.deleteLikeUser(ids.getUsersId());
			});
			return false;
		} else {
			// 찜하지 않은 경우
			reviewDao.addLikeUser(dto.getUsersId());
			return true;
		}
	}
	
	

}