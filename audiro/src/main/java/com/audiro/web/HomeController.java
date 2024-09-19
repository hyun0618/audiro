package com.audiro.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteTopPostStateReqDto;
import com.audiro.dto.FavoriteTopPostUpdateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.TopDestinationDto;
import com.audiro.dto.TopPostDto;
import com.audiro.service.TopService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final TopService topService;
	
// Home Destination
	@GetMapping("/")
	public String topDestination(Model model) {
		List<TopDestinationDto> topDestination = topService.getTopDestination();
		log.debug("top destination:{}", topDestination);
		model.addAttribute("topDestination", topDestination);
		
		List<TopPostDto> topPost = topService.getTopPost();
        log.debug("top post:{}", topPost);
        model.addAttribute("topPost", topPost);
        
		return "home";
	}
	// 메인 여행지 찜 상태
	@GetMapping("/favorite/state/topDestination/{travelDestinationId}/{signedInUser}")
	@ResponseBody
	public ResponseEntity<Integer> apiFavorite(@PathVariable Integer travelDestinationId,
			@PathVariable String signedInUser) {
		log.debug("apiFavorite(travelDestinationId={}, signedInUser={})", 
				travelDestinationId, signedInUser);
		
		FavoriteStateReqDto dto = new FavoriteStateReqDto(travelDestinationId, signedInUser);
		Integer id = topService.getFavoriteState(dto);
		log.debug("id = {}", id);
		
		return ResponseEntity.ok(id != null ? id : -1);
	}
	// 메인 글 찜 상태
	@GetMapping("/favorite/state/topPost/{postId}/{signedInUser}")
	@ResponseBody
	public ResponseEntity<Integer> favoriteStateTopPost(@PathVariable Integer postId,
			@PathVariable String signedInUser) {
		log.debug("apiFavorite(postId={}, signedInUser={})", 
				postId, signedInUser);
		
		FavoriteTopPostStateReqDto dto = new FavoriteTopPostStateReqDto(postId, signedInUser);
		Integer id = topService.getFavoriteTopPostState(dto);
		log.debug("id = {}", id);
		
		return ResponseEntity.ok(id != null ? id : -1);
	}
	
	// 메인 여행지 찜 업데이트
	@PostMapping("/favorite/update/top/destination")
	@ResponseBody
	public ResponseEntity<Void> updateFavorite(@RequestBody FavoriteUpdateReqDto reqDto) {

	    boolean isCurrentlyFavorite = topService.isFavorite(reqDto.getSignedInUser(), reqDto.getTravelDestinationId());
	   
	    if ((reqDto.getIsFavorite() == 1) == isCurrentlyFavorite) {
	        log.warn("No change in favorite state, skipping update.");
	        return ResponseEntity.ok().build();
	    }

	    if (reqDto.getIsFavorite() == 1) {
	        log.debug("Inserting favorite: {}", reqDto);
	        topService.addFavorite(reqDto);
	    } else {
	        log.debug("Deleting favorite: {}", reqDto);
	        topService.removeFavorite(reqDto);
	    }
	    return ResponseEntity.ok().build();
	}
	
	// 메인 글 찜 업데이트
	@PostMapping("/favorite/update/top/post")
	@ResponseBody
	public ResponseEntity<Void> updateFavoritePost(@RequestBody FavoriteTopPostUpdateReqDto reqDto) {

	    boolean isCurrentlyFavorite = topService.isFavoriteTopPost(reqDto.getSignedInUser(), reqDto.getPostId());
	   
	    if ((reqDto.getIsFavorite() == 1) == isCurrentlyFavorite) {
	        log.warn("No change in favorite state, skipping update.");
	        return ResponseEntity.ok().build();
	    }

	    if (reqDto.getIsFavorite() == 1) {
	        log.debug("Inserting favorite: {}", reqDto);
	        topService.addFavorite(reqDto);
	    } else {
	        log.debug("Deleting favorite: {}", reqDto);
	        topService.removeFavorite(reqDto);
	    }
	    return ResponseEntity.ok().build();
	}
		
}
