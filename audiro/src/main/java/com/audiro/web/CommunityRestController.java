package com.audiro.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.CommunityCommentsCreateDto;
import com.audiro.dto.CommunityCommentsSelectListDto;
import com.audiro.dto.CommunityPostListDto;
import com.audiro.dto.CommunityPostSearchDto;
import com.audiro.repository.Post;
import com.audiro.service.CommunityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController //->리턴값은 뷰(jsp)의 이름이 아니라 클라이언트(브라우저)로 직접 전달하는 데이터.
@RequestMapping
public class CommunityRestController {
	private final CommunityService communityService;
	
	//---------------페이징 처리 시작 ------------------------------
	//전체(여행+자유) 게시판 최신순 정렬.
    @GetMapping("/community/api/postsAllRecent")//->브라우저로 이 요청주소로 Get방식으로 들어가는 용도가 아님.
    //일반컨트롤러에 매핑되어있는 다른url과 연결된 뷰(jsp)와 연결된 자바스크립트에서 여기서 보낸 데이터를 받아 비동기 방식으로 원하는 대로 조작하기 위한 용도.
    //->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostAllRecent(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        //pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠. 필요에 맞게 개발자의 임의로 설정하면 된다.)
    	int pageSize = 10;
    	//페이징 처리해서 전체(여행+자유)게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts = communityService.getSelectPagingAllNewOrderByIdDesc(page, pageSize);
        //전체 페이지 수
        int totalPages = communityService.getTotalPages(pageSize);

        Map<String, Object> response = new HashMap<>();
        //response객체에 저장함
        response.put("posts", posts);
        response.put("totalPages", totalPages);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        return response;
    }


    //여행메이트 게시판 최신순 정렬
    @GetMapping("/community/api/postsMateRecent")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostMateNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getPostMateNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 10;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts2 = communityService.getSelectPagingMateOrderByIdDesc(page, pageSize);
        log.debug(posts2.toString());
        //전체 페이지 수
        int totalPages2 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages2);
        
        Map<String, Object> response2 = new HashMap<>();
        //response객체에 저장함
        response2.put("posts2", posts2);
        response2.put("totalPages2", totalPages2);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response2 : {}", response2);
        return response2;
    }
    
    //자유 게시판 최신순 정렬
    @GetMapping("/community/api/postsFreeRecent")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostFreeNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getPostFreeNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 10;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts3 = communityService.getSelectPagingFreeOrderByIdDesc(page, pageSize);
        log.debug(posts3.toString());
        //전체 페이지 수
        int totalPages3 = communityService.getFreePages(pageSize);
        log.debug("totalPages3: {}",totalPages3);
        
        Map<String, Object> response3 = new HashMap<>();
        //response객체에 저장함
        response3.put("posts3", posts3);
        response3.put("totalPages3", totalPages3);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response3 : {}", response3);
        return response3;
    }
    
    
	//전체(여행+자유) 게시판 인기순 정렬.
    @GetMapping("/community/api/postsAllPopularity")//->브라우저로 이 요청주소로 Get방식으로 들어가는 용도가 아님.
    //일반컨트롤러에 매핑되어있는 다른url과 연결된 뷰(jsp)와 연결된 자바스크립트에서 여기서 보낸 데이터를 받아 비동기 방식으로 원하는 대로 조작하기 위한 용도.
    //->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostAllPopularity(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        //pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠. 필요에 맞게 개발자의 임의로 설정하면 된다.)
    	int pageSize = 10;
    	//페이징 처리해서 전체(여행+자유)게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts4 = communityService.getSelectPagingAllOrderByGoodDesc(page, pageSize);
        //전체 페이지 수
        int totalPages4 = communityService.getTotalPages(pageSize);

        Map<String, Object> response4 = new HashMap<>();
        //response4객체에 저장함
        response4.put("posts4", posts4);
        response4.put("totalPages4", totalPages4);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        return response4;
    }
    
    
	//여행메이트 게시판 인기순 정렬.
    @GetMapping("/community/api/postsMatePopularity")//->브라우저로 이 요청주소로 Get방식으로 들어가는 용도가 아님.
    //일반컨트롤러에 매핑되어있는 다른url과 연결된 뷰(jsp)와 연결된 자바스크립트에서 여기서 보낸 데이터를 받아 비동기 방식으로 원하는 대로 조작하기 위한 용도.
    //->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostMatePopularity(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        //pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠. 필요에 맞게 개발자의 임의로 설정하면 된다.)
    	int pageSize = 10;
    	//페이징 처리해서 전체(여행+자유)게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts5 = communityService.getSelectPagingMateOrderByGoodDesc(page, pageSize);
        //전체 페이지 수
        int totalPages5 = communityService.getMatePages(pageSize);

        Map<String, Object> response5 = new HashMap<>();
        //response4객체에 저장함
        response5.put("posts5", posts5);
        response5.put("totalPages5", totalPages5);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        return response5;
    }
    
    
	//자유 게시판 인기순 정렬.
    @GetMapping("/community/api/postsFreePopularity")//->브라우저로 이 요청주소로 Get방식으로 들어가는 용도가 아님.
    //일반컨트롤러에 매핑되어있는 다른url과 연결된 뷰(jsp)와 연결된 자바스크립트에서 여기서 보낸 데이터를 받아 비동기 방식으로 원하는 대로 조작하기 위한 용도.
    //->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getPostFreePopularity(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        //pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠. 필요에 맞게 개발자의 임의로 설정하면 된다.)
    	int pageSize = 10;
    	//페이징 처리해서 전체(여행+자유)게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts6 = communityService.getSelectPagingFreeOrderByGoodDesc(page, pageSize);
        //전체 페이지 수
        int totalPages6 = communityService.getFreePages(pageSize);

        Map<String, Object> response6 = new HashMap<>();
        //response4객체에 저장함
        response6.put("posts6", posts6);
        response6.put("totalPages6", totalPages6);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        return response6;
    }
    
  //---------------페이징 처리 끝 ------------------------------
    
    
    
   // 여행메이트 게시판 리스트
    //여행메이트 게시판 최신순 정렬
    @GetMapping("/community/mateNewList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getMateNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getMateNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts2 = communityService.getSelectPagingMateOrderByIdDesc(page, pageSize);
        log.debug(posts2.toString());
        //전체 페이지 수
        int totalPages2 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages2);
        
        Map<String, Object> response2 = new HashMap<>();
        //response객체에 저장함
        response2.put("posts2", posts2);
        response2.put("totalPages2", totalPages2);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response2 : {}", response2);
        return response2;
    }
    
    // 여행메이트 게시판 리스트
    //여행메이트 게시판 인기순 정렬
    @GetMapping("/community/matePopularityList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getMateGood(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getMateGood()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts5 = communityService.getSelectPagingMateOrderByGoodDesc(page, pageSize);
        log.debug(posts5.toString());
        //전체 페이지 수
        int totalPages5 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages5);
        
        Map<String, Object> response5 = new HashMap<>();
        //response객체에 저장함
        response5.put("posts5", posts5);
        response5.put("totalPages5", totalPages5);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response5 : {}", response5);
        return response5;
    }
    
    // 자유 게시판 리스트
    //자유 게시판 최신순 정렬
    @GetMapping("/community/freeNewList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getFreeNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getFreeNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts2 = communityService.getSelectPagingFreeOrderByIdDesc(page, pageSize);
        log.debug(posts2.toString());
        //전체 페이지 수
        int totalPages2 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages2);
        
        Map<String, Object> response2 = new HashMap<>();
        //response객체에 저장함
        response2.put("posts2", posts2);
        response2.put("totalPages2", totalPages2);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response2 : {}", response2);
        return response2;
    }
    
    // 자유 게시판 리스트
    // 자유 게시판 인기순 정렬
    @GetMapping("/community/freePopularityList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getFreeGood(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getFreeGood()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts5 = communityService.getSelectPagingFreeOrderByGoodDesc(page, pageSize);
        log.debug(posts5.toString());
        //전체 페이지 수
        int totalPages5 = communityService.getMatePages(pageSize);
        log.debug("totalPages2: {}",totalPages5);
        
        Map<String, Object> response5 = new HashMap<>();
        //response객체에 저장함
        response5.put("posts5", posts5);
        response5.put("totalPages5", totalPages5);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response5 : {}", response5);
        return response5;
    }
    
    /////전체
    // 전체 게시판 리스트
    //전체 게시판 최신순 정렬
    @GetMapping("/community/allNewList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getAllNew(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getAllNew()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts2 = communityService.getSelectPagingAllNewOrderByIdDesc(page, pageSize);
        log.debug(posts2.toString());
        //전체 페이지 수
        int totalPages2 = communityService.getTotalPages(pageSize);
        log.debug("totalPages2: {}",totalPages2);
        
        Map<String, Object> response2 = new HashMap<>();
        //response객체에 저장함
        response2.put("posts2", posts2);
        response2.put("totalPages2", totalPages2);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response2 : {}", response2);
        return response2;
    }
    
    // 자유 게시판 리스트
    // 자유 게시판 인기순 정렬
    @GetMapping("/community/allPopularityList")//->비동기. 에이작스.뷰와 연결된 자바스트립트에서 axios.해서 이 url에 매핑시킨 곳으로 데이터가 전달되어 사용된다. 
    public Map<String, Object> getAllGood(@RequestParam(defaultValue = "1") int page) { //defaultValue = "1"이걸 꼭 설정 해주어야함. 비동기라 url이 바뀌지 않기 때문에. 설정해 두지 않으면 여기에 값을 넣어 호출 없다. 처음 초기값 1. 즉 현재 페이지가 1페이지임.
        log.debug("getAllGood()");
        log.debug("page:{}",page);
    	//pageSize : 한 페이지당 가져올 게시물 수(10개로 설정해둠)
    	int pageSize = 40;
    	//페이징 처리해서 여행메이트 게시판 글 최신순으로 정렬해서 select하는 서비스 호출해서 list에 저장
        List<Post> posts5 = communityService.getSelectPagingAllOrderByGoodDesc(page, pageSize);
        log.debug(posts5.toString());
        //전체 페이지 수
        int totalPages5 = communityService.getTotalPages(pageSize);
        log.debug("totalPages2: {}",totalPages5);
        
        Map<String, Object> response5 = new HashMap<>();
        //response객체에 저장함
        response5.put("posts5", posts5);
        response5.put("totalPages5", totalPages5);
        //같은 url에 매핑된 자바스크립 코드에서 이 데이터를 받아서 이걸로 원하는 조작을 할 것.
        log.debug("response5 : {}", response5);
        return response5;
    }
    
    
    /////전체끝
    
    
    // 댓글 등록
    @PostMapping("/community/api/comments")
    public ResponseEntity<Integer> registerCommunityComment(@RequestBody CommunityCommentsCreateDto dto) {
    	// @RequestBody: Ajax 요청의 요청 패킷 몸통(body)에 포함된 데이터를 읽어서 자바 객체로 변환.
    	log.debug("registerCommunityComment({})", dto);
    	int result = communityService.insertComment(dto);
    	
    	return ResponseEntity.ok(result);
        
    }
    
//    //댓글 불러오기  
//    @GetMapping("/community/api/comments/all/{postId}") // *** URL 경로에서 postId 값을 가져옴 // *** 쿼리 파라미터로 page 값을 가져옴, 기본값은 1
//    public Map<String, Object> getAllCommentByPostId(@PathVariable int postId,@RequestParam(defaultValue = "1") int page) {
//        // @PathVariable: 요청 주소의 일부가 변수처럼 변할 수 있는 값일 때,
//        // 디스패쳐 서블릿이 요청 주소를 분석해서 메서드의 아규먼트로 전달.
//        // 1. @PathVariable(name = "postId") 처럼 패스 변수의 이름을 명시하거나,
//        // 2. 패스 변수의 이름을 명시하지 않고 메서드의 파라미터 이름으로 패스 변수를 찾으려면
//        // (Eclipse) 프로젝트 이름 오른쪽 클릭 -> Properties -> Java Compiler ->
//        // "Store information about method parameters (usable via reflection)" 항목을 체크.
//    	int pageSize = 7; //1페이지당 7개 가져오게 설정
//        log.debug("getAllCommentByPostId(postId={},page={})", postId, page);
//        
//        // 서비스 컴포넌트의 메서드를 호출해서 해당 포스트의 댓글 목록을 가져옴.
//        List<CommunityCommentsSelectListDto> commentsList = communityService.getSelectPagingCommentsByCreateTimeDesc(postId, page, pageSize);
//        log.debug("가져온 댓글 list_commentsList : {}",commentsList);
//        //전체 페이지 수 계산하는 서비스의 메서드 호출해서 totalPages에 저장
//        int totalCommentsPages = communityService.getCommentsCountPages(pageSize,postId);
//        // ResponseEntity<T>: 
//        // 서버가 클라이언트로 보내는 데이터와 응답 코드를 함께 설정할 수 있는 타입.
//       // return ResponseEntity.ok(list); //-> 200 OK 응답 코드와 함께 리스트를 전송.
//      //Map<String, Object> response
//		//이건 정확히 모르겠으나 자바 스크립트로 데이터 보낼거 
//		//여기 다 저장해서 보낸다는 것 같음
//        Map<String, Object> response = new HashMap<>();
//        response.put("commentsList", commentsList);
//        response.put("totalCommentsPages", totalCommentsPages);
//        // REST 컨트롤러 메서드가 자바 객체를 리턴하면
//        // jackson-databind 라이브러리가 자바 객체를 JSON 문자열로 변환을 담당하고,
//        // JSON 문자열이 클라이언트로 전송(응답)됨.
//        // jackson-databind 라이브러리의 역할:
//        //   1. 직렬화(serialization): 자바 객체 -> JSON
//        //   2. 역직렬화(de-serialization): JSON -> 자바 객체
//        // jackson-databind 라이브러리에서 
//        // Java 8 이후에 생긴 날짜/시간 타입(LocalDate, LocalDateTime)을 JSON으로 변환하기 위해서는
//        // jackson-datatype-jsr310 모듈이 필요함.
//        return response; //-> 자바스크립트에서 axios로 매핑한 url에서 이 데이터 받음.
//    }
//    

    //댓글 불러오기
    @GetMapping("/community/api/comments/all/{postId}")
    public ResponseEntity<Map<String, Object>> getAllCommentByPostId(
            @PathVariable Integer postId,
            @RequestParam(defaultValue = "1") int page) {
        
        Integer pageSize = 7; // 1페이지당 7개 가져오게 설정
        log.debug("getAllCommentByPostId(postId={},page={})", postId, page);
        
        // 서비스 컴포넌트의 메서드를 호출해서 해당 포스트의 댓글 목록을 가져옴.
        List<CommunityCommentsSelectListDto> commentsList = communityService.getSelectPagingCommentsByCreateTimeDesc(postId, page, pageSize);
        log.debug("가져온 댓글 list_commentsList : {}", commentsList);
        
        // 전체 페이지 수 계산하는 서비스의 메서드 호출해서 totalPages에 저장
        int totalCommentsPages = communityService.getCommentsCountPages(pageSize, postId);
        
        // 응답 데이터를 담을 Map 객체 생성
        Map<String, Object> response = new HashMap<>();
        response.put("commentsList", commentsList);
        response.put("totalCommentsPages", totalCommentsPages);
        
        // ResponseEntity로 응답 데이터와 200 OK 상태 코드를 함께 반환
        return ResponseEntity.ok(response);
    }
    
    
    //댓글 삭제 하기
    @PostMapping("/community/api/comments/delete/comment")
    public ResponseEntity<Integer> deleteCommentByCommentsId(@RequestBody CommunityCommentsSelectListDto request){
    		Integer commentsId = request.getCommentsId();	
    		log.debug("deleteCommentByCommentsId(commentsId={})",commentsId);
    		
            int result = communityService.deleteCommunityCommentByCommentsId(commentsId); // 댓글 삭제 로직 호출
            return ResponseEntity.ok(result);
    }
    
    
    
    //댓글 수정 하기
    @PostMapping("/community/api/comments/update/comment")
    public ResponseEntity<Integer> updateCommentByCommentsId(@RequestBody CommunityCommentsSelectListDto request){
    		Integer commentsId = request.getCommentsId();
    		String cotent = request.getContent();
    		Integer isPrivate = request.getIsPrivate();
    	//	log.debug("updateCommentByCommentsId(dto={})",dto);
    		
            int result = communityService.updateCommnunityComment(commentsId, cotent, isPrivate);
            return ResponseEntity.ok(result);
    }

    
    /**
     * 특정 게시물에 좋아요를 추가하는 엔드포인트
     * @param postId 좋아요를 추가할 게시물의 ID
     * @param usersId 좋아요를 추가하는 사용자의 ID
     */
    @PostMapping("/community/{postId}/like")
    public void likePost(@PathVariable int postId, @RequestParam int usersId) {
        communityService.likePost(postId, usersId);
    }

    /**
     * 사용자가 특정 게시물에 좋아요를 눌렀는지 확인하는 엔드포인트
     * @param postId 확인할 게시물의 ID
     * @param usersId 확인할 사용자의 ID
     * @return 사용자가 게시물에 좋아요를 눌렀는지 여부
     */
    @GetMapping("/community/{postId}/liked")
    public boolean isPostLikedByUser(@PathVariable int postId, @RequestParam int usersId) {
        return communityService.isPostLikedByUser(postId, usersId);
    }
    
    
    //검색 불러오기
    @PostMapping("/community/search")
    public ResponseEntity<Map<String, Object>> getSearch(@RequestBody CommunityPostSearchDto dto) {
        
        log.debug("getSearch({})",dto);
        
        // 서비스 컴포넌트의 메서드를 호출해서 해당 포스트의 검색 목록을 가져옴.
        List<CommunityPostListDto> searchPostList = communityService.searchIdDesc(dto);
        log.debug("검색결과 searchPostLis : {}", searchPostList);
       
        
        // 응답 데이터를 담을 Map 객체 생성
        Map<String, Object> response = new HashMap<>();
        response.put("searchPostList", searchPostList);
 
        // ResponseEntity로 응답 데이터와 200 OK 상태 코드를 함께 반환
        return ResponseEntity.ok(response);
    }
    
}
