package com.audiro.web;


import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.audiro.dto.CommentItemDto;
import com.audiro.dto.CreateReviewDto;
import com.audiro.dto.DetailedPlanDto;
import com.audiro.dto.DetailsReviewDto;
import com.audiro.dto.ListReviewDto;
import com.audiro.dto.MyReviewListDto;
import com.audiro.dto.SearchReviewDto;
import com.audiro.repository.DraftPost;
import com.audiro.repository.Post;
import com.audiro.repository.TravelPlan;
import com.audiro.repository.User;
import com.audiro.service.ReviewService;
import com.audiro.service.TravelPlanService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/post/review")
public class ReviewController {

	private final ReviewService reviewService;
	private final TravelPlanService service;

	// 여행후기 작성페이지
	@GetMapping("/create")
	public void create(Model model, HttpSession session) {
		
		Integer id = (Integer)session.getAttribute("signedInUsersId");
		String usersId = (String)session.getAttribute("signedInUser");		
		TravelPlan plan = service.readTravelPlanById(id);
		List<DetailedPlanDto> list = service.readDetailedPlanByTravelPlanId(id);
		model.addAttribute("travelPlan",plan);		
		model.addAttribute("list",list);

	}

	// 여행후기 작성 저장 후 페이지
	@PostMapping("/create")
	public String create(CreateReviewDto dto, HttpSession session ) {
		// 세션에서 사용자 ID 가져오기
	    Integer usersId = (Integer)session.getAttribute("signedInUsersId");
		dto.setUsersId(usersId);
		reviewService.create(dto);
		return "redirect:/post/review/list";
	}


	// 여행후기 상세보기, 수정하기하면 작성된 페이지 띄우기
	@GetMapping("/details")
	public void reviewDetails(@RequestParam("postId") Integer postId, Model model, HttpSession session) {
	    // 세션에서 사용자 ID 가져오기
	    Integer usersId = (Integer) session.getAttribute("signedInUsersId");
	    String id = (String) session.getAttribute("signedInUser");

	    DetailsReviewDto dto = new DetailsReviewDto();
	    dto.setUsersId(usersId);
	    dto.setPostId(postId);

	    // 여행후기 상세보기
	    DetailsReviewDto post = reviewService.readById(dto);

	    // 굿 수
	    int countLike = reviewService.countGood(postId);

	    // 찜 수
	    int countFavorite = reviewService.countFavorite(postId);

	    // 프로필 이미지
	    String profile = reviewService.img(post.getUsersId());

	    // 모델에 필요한 데이터 추가
	    model.addAttribute("post", post);
	    model.addAttribute("countLike", countLike);
	    model.addAttribute("countFavorite", countFavorite);
	    model.addAttribute("profile", profile);
	    model.addAttribute("signedInUser", id);
	    //model.addAttribute("signedInUsersId", usersId);
	}

	// 여행후기 수정 업데이트
	@PostMapping(value="/update")
	public String update(@ModelAttribute CreateReviewDto dto) {
		reviewService.update(dto);
		return "redirect:/post/review/details?postId=" + dto.getPostId();
	}

	// 내 여행일기 페이지
	@GetMapping("/mypage")
	public void mypage(Model model, MyReviewListDto dto ) {
		
		// 세션에 id 추가
		model.addAttribute("id", dto.getId());
		log.debug("id={}", dto.getId());
		
	    // 내 여행일기 목록
	    List<MyReviewListDto> post = reviewService.myReviewList(dto);
	   
	    model.addAttribute("post", post);
	   
	    
	    // 내 여행일기 수
	    int countMyReview = reviewService.countMyReveiw(post.get(0).getId());
	    model.addAttribute("countMyReview", countMyReview);
	    log.debug("countMyReview", countMyReview);
	    
	    // 나를 찜한 유저 수
	    int countLike = reviewService.countLike(post.get(0).getId());
	    model.addAttribute("countLike", countLike);
	    
	}


	// 여행후기수정페이지
	@GetMapping("/modify")
	public void reviewModify(@RequestParam(name = "postId") Integer postId, 
							   HttpSession session,
							   Model model) {
			
		// 세션에서 사용자 ID 가져오기
	    Integer usersId = (Integer) session.getAttribute("signedInUsersId");
		DetailsReviewDto list = reviewService.readById(DetailsReviewDto
				.builder()
				.postId(postId)
				.usersId(usersId)
				.build()
			);
		model.addAttribute("list", list);
		
		//return "/post/review/modify?postId=" + postId;

	}

	// 여행후기 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam(name = "postId") Integer postId) {
		reviewService.delete(postId);
		return "redirect:/post/review/list";
	}

	// 여행후기 목록 랭킹모델함께 보냄.
	@GetMapping("/list")
	public void reviewList (SearchReviewDto dto, Model model, HttpSession session) {
		
		List<ListReviewDto> list = reviewService.readAll(dto,session);
        
		model.addAttribute("list", list);
		

	}

	// 여행후기 검색
	/*
	 * @GetMapping("/search") public String search(SerachReviewDto dto, Model model)
	 * { List<ListReviewDto> list = reviewService.search(dto);
	 * model.addAttribute("list", list);
	 * 
	 * return "post/review/list"; }
	 */



}