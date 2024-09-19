package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.audiro.dto.CommunityCommentsUpdateDto;
import com.audiro.dto.CommunityCommentsCreateDto;
import com.audiro.dto.CommunityCommentsSelectListDto;
import com.audiro.dto.CommunityPostDetailsDto;
import com.audiro.dto.CommunityPostSearchDto;
import com.audiro.dto.CommunityRankingDto;

//community-mapper.xml에서 SQL을 실행하는 메서드 작성하기.
public interface CommunityDao {
	//id(회원가입)로 UsersId뽑아오기
	Integer selectUsersIdById(String id);
	
	//수정하기
	Integer updateFreeAndMate(Post post);
	
	//삭제하기
	Integer deletePostById(Integer postId);
	//-----------------페이징 처리해서 목록 가져오기 select 시작 ------------------------------
    // 페이징 처리를 위한 전체(여행메이트+자유게시판) 총 게시물 수를 가져오는 메서드
    int countAllPosts();
    
    //페이징 처리를 위한 여행메이트 총 게시물 수를 가져오는 메서드
    int countMatePosts();
    
    //페이징 처리를 위한 자유게시판 총 게시물 수를 가져오는 메서드
    int countFreePosts();
    
    //페이징 처리를 위한 검색 총 게시물 수를 가져오는 메서드
    int countSearchKeyword(CommunityPostSearchDto dto);

    //전체(여행메이트+자유)post list 최신순으로 정렬해서 가져오기. 페이징된 데이터를 가져오는 메서드
    List<Post> selectPagingEntireOrderByIdDesc(@Param("offset") int offset, @Param("limit") int limit);
    
    ////전체(여행메이트+자유)post list 인기순(good 많은 순 desc)으로 정렬해서 가져오기.
    List<Post> selectPagingEntireOrderByGoodDesc(@Param("offset") int offset, @Param("limit") int limit);
    
    //여행 메이트 게시판 목록 최신순으로 가져오기
    List<Post> selectPagingMateOrderByCreatedTimeDesc(@Param("offset") int offset, @Param("limit") int limit);
    
    ////여행 메이트 게시판 목록 인기순으로 가져오기
    List<Post> selectPagingMateOrderByGoodDesc(@Param("offset") int offset, @Param("limit") int limit);
    
    //자유 게시판 목록 최신순으로 가져오기
    List<Post> selectPagingFreeOrderByCreatedTimeDesc(@Param("offset") int offset, @Param("limit") int limit);
    
    //자유 게시판 목록 인기순으로 가져오기
    List<Post> selectPagingFreeOrderByGoodDesc(@Param("offset") int offset, @Param("limit") int limit);
    
    
    
	
  //-----------------페이징 처리해서 목록 가져오기 select 끝------------------------------
    
    //랭킹
    
    //좋아요 많이 받은 유저 top3
	List<CommunityRankingDto> selectLikeUserTop3();
    
	//전체 good 많이 받은 post(게시물) top3
    List<CommunityRankingDto> selectAllPostsGoodTop3();
    
    //전체 댓글 많이 단 유저 top3
    List<CommunityRankingDto> selectCommentsUserTop3();
	//랭깅 끝

    
    //글 상세보기 페이지
    CommunityPostDetailsDto selectDetailsFreeAndMate(int postId);
    
	//글쓰기 (자유+여행메이트 글쓰면) post테이블에 insert하는 문장
	int insertFreeAndMate(Post post);
	
	//댓글 등록
	int insertCommunityComment(CommunityCommentsCreateDto dto);
	
	//전체 댓글 갯수
	Integer selectCommunityCommentCount(Integer postId);
	
	//댓글 불러오기(해당 글에 해당하는)
	List<CommunityCommentsSelectListDto> selectCommentsByUsersIdPaging(Integer postId, @Param("offset") int offset, @Param("limit") int limit);
    
	
	//댓글 수정하기(업데이트), 댓글 내용,비댓여부,업데이트시간 수정 가능.
	int updateCommentByCommentsId(Integer commentsId, String content, Integer isPrivate);
	
	//댓글 삭제하기
	int deleteCommentByCommentsId(Integer commentsId);
	
	//post테이블에 good추가
	int updatePostGood(@Param("postId") int postId);
	
	//good누른 사용자 저장 //로그인한usersId저장시켜야함
	int insertGoodUser(@Param("postId") int postId, @Param("usersId") int usersId);
	
	// good눌렀는지 확인 //로그인한usersId
	int checkGoodUser(@Param("postId") int postId, @Param("usersId") int usersId);
	
	
//	//인기(찜 많은 순위로) 여행후기 10개 가져옴. postId랑 찜개수 2개 select
//	//여기서 뽑은 post_id로 title은 따로 뽑아가져오기. 근데 해당 포스트 삭제되었을경우 해당게시물삭제로 화면 보이게 예외처리하기
//	public List<CommunityPopularReviewDto> selectReviewPopular10();
//	
//	//찜 추가
//	public int insertFavoriteReview(Post post);
//	
//	//찜 삭제(취소)
//	public int deleteCancelFavoriteReview(Post post);
//	
//	//전체 게시판 목록 select 최신순으로 가져옴 
//	public List<Post> selectEntireOrderByCreatedTimeDesc();
//	
//	//전체 게시판 목록 select 인기순으로 가져옴(good 많은 순)
//	public List<Post> selectEntireOrderByGoodDesc();
//	
//	//여행메이트 게시판 목록 select 최신순으로 가져옴
//	public List<Post> selectMateOrderByCreatedTimeDesc();
//	
//	//여행메이트 게시판 목록 select 인기순으로 가져옴
//	public List<Post> selectMateOrderByGoodDesc();
//	
//	//자유 게시판 목록 select 최신순으로 가져옴
//	public List<Post> selectFreeOrderByCreatedTimeDesc();
//	
//	//자유 게시판 목록 select 인기순으로 가져옴
//	public List<Post> selectFreeOrderByGoodDesc();
//	
//	//(자유+여행메이트 글쓰면) post테이블에 insert하는 문장
//	public int insertFreeAndMate(Post post);
//	
//	//사용자가 good버튼 누르면 good 증가
//	public int updatePostGood(int postId);
//
//	//사용자가 good버튼 한번 또 누르면 good 삭제(누른 good 취소)
//	public int updateCancelPostGood(int postId);
//	
//	//자유+여행메이트 상세 페이지 select
//	public Post selectDetailsFreeAndMate(int postId);
//	
//	//자유+여행메이트 게시판에서 수정(update)하는 문장
//	public int updateFreeAndMate(Post post);
//	
//	//자유+여행메이트 게시판에서 삭제(delete)하는 문장
//	public int deletePostById(int postId);
//	
//	//자유 or 여행메이트 게시판 상세보기 select
//	//public Post selectDetailsFreeAndMate(Post post);
//	
//	//임시 저장 등록 insert
//	public int insertDraftPost(DraftPost draftPost);
//	
//	//(자유+여행메이트) 임시저장된 목록 불러오기 select
//	public List<DraftPost> selectFreeAndMateDraftPost(int usersId);
//	
//	//임시저장 된 게시글 1개 불러오기 select
//	public DraftPost selectDraftPost(int draftPostId);
//	
//	
//	//임시저장 된 글 삭제하기
//	public int deleteDraftPostById(int draftPostId);
//	
//	//임시저장 된 글 전체 삭제하기
//	public int deleteAllDraftPostsByUserId(int usersId);
//	
//	//커뮤니티 검색 창 전체(자유+여행메이트) 최신순
//	// post 테이블에서 제목/내용/제목+내용/닉네임으로 검색하기 기능 
//	public List<Post> searchKeywordOrderById(CommunityPostSearchDto dto);
	//검색 (공백제거해서 검색) 이전것보다 업그레이드
	public List<Post> searchKeywordOrderById2(CommunityPostSearchDto dto);
//	
//	//랭킹 뽑기
//	//좋아요 많이 받은 유저 top3
//	public List<CommunityRankingDto> selectLikeUserTop3();
	
	 //커뮤니티 메인 화면에 인기여행지 top10개(찜많은순으로 10개 가져옴) select.
	//public List<CommunityFavoriteDestinationDto> selectPopular10();
	
	//인기 여행지 top10에서 찜 누르면 찜 여행지에 insert
	//public int insertFavoriteDestinations(FavoriteDestination favoriteDestination);
	
	//찜 취소 
	//public int deleteCancelFavoriteDestinations(FavoriteDestination favoriteDestination);
	
	


}
