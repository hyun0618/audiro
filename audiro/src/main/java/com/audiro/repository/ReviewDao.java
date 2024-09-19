package com.audiro.repository;

import java.util.List;
import java.util.Set;

import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.DetailsReviewDto;
import com.audiro.dto.LikeReviewPostDto;
import com.audiro.dto.LikeUserFavoriteDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.dto.SearchReviewDto;

//review-mapper.xml, ranking-mapper.xml 에서 SQL을 실행하는 메서드 작성하기.
public interface ReviewDao {

	// 내여행일기
	// 내 여행일기 목록 불러오기 (최신순)
	List<MyReviewListDto> readMyReview(String id);

	// 내 여행일기 목록 불러오기 (좋아요순)
	List<MyReviewListDto> readMyReviewByGood();

	// 나를 찜한 유저 수
	int countLike(String id);

	//내 여행일기 수
	int countMyReveiw(String id);
	
	//여행후기 찜 수
	int countFavoriteReveiw(Integer postId);
	
	//여행일기많이 작성한 유저TOP3
	List<Post> selectReviewUserTop3();
	
	
	
	
	
	// 여행후기 게시판//////////////////////////////////////////////////////////////
	// 여행후기 postId로 1개 상세보기
	DetailsReviewDto readDetailsReviewById(DetailsReviewDto dto);

	// 여행후기 postId good 수
	int countGoodByPostId(Integer postId);

	// 관심유저 모두 목록 가져오기
	List<LikeUserFavoriteDto> getFavoriteUserIds(LikeUserFavoriteDto dto);
	
	// 관심유저 담기
	int addLikeUser(Integer usersId);
	
	// 관심유저 삭제
	int deleteLikeUser(Integer usersId); // LikeUserFavoriteDto dto

	//여행후기 찜 담아있는 내용 불러오기
	List<LikeReviewPostDto> getFavoritePostIds(LikeReviewPostDto dto);
	
	// 찜 여행후기 담기
	int addLikeReview(LikeReviewPostDto dto);
	
	//찜 여행후기 삭제
	int deleteLikeReview(LikeReviewPostDto dto);
	
	// 여행후기 1개 삭제하기
	int deleteReview(Integer postId);
	
	//여행후기 저장
	int insertReview(Post post);
		
	//여행후기 수정
	int updateReview(CreateReviewDto dto);
	
	//여행후기 모두 불러오기(최신순)
	List<Post> selectReviewAll();
	
	//여행후기 모두 불러오기(좋아요순)
	List<Post> rankingGoodReview();

	//여행후기 검색하기
	List<Post> searchKeyword(SearchReviewDto dto);
		
	//프로필 이미지 가져오기
	String profileImg(Integer id);
	

	
	
	
	
	
}