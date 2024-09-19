package com.audiro.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.FavoriteListDestStateReqDto;
import com.audiro.dto.FavoriteListDestUpdateReqDto;
import com.audiro.dto.FavoriteListPostStateReqDto;
import com.audiro.dto.FavoriteListPostUpdateReqDto;
import com.audiro.dto.FavoriteListUserStateReqDto;
import com.audiro.dto.FavoriteListUserUpdateReqDto;
import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.service.FavoriteService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RestController
@RequestMapping("/favorite/api/list")
@RequiredArgsConstructor
public class FavoriteRestController {
	
	private final FavoriteService favoriteService;
	
	@GetMapping("/destination/{destinationId}/{signedInUser}")
	public ResponseEntity<Integer> getFavoriteDestination(@PathVariable Integer destinationId, @PathVariable String signedInUser) {
		
		FavoriteListDestStateReqDto dto = new FavoriteListDestStateReqDto(destinationId, signedInUser);
		Integer id = favoriteService.getFavoriteListDestState(dto);
		log.debug("ListDestinationId = {}", id);
		
		return ResponseEntity.ok(id != null ? id : -1);
	}
	
	@GetMapping("/user/{interestedUserId}/{signedInUser}")
	public ResponseEntity<Integer> getFavoriteUser(@PathVariable Integer interestedUserId, @PathVariable String signedInUser) {
		
		FavoriteListUserStateReqDto dto = new FavoriteListUserStateReqDto(interestedUserId, signedInUser);
		Integer id = favoriteService.getFavoriteListUserState(dto);
		log.debug("ListDestinationId = {}", id);
		
		return ResponseEntity.ok(id != null ? id : -1);
	}
	
	@GetMapping("/post/{postId}/{signedInUser}")
	public ResponseEntity<Integer> getFavoritePost(@PathVariable Integer postId, @PathVariable String signedInUser) {
		
		FavoriteListPostStateReqDto dto = new FavoriteListPostStateReqDto(postId, signedInUser);
		Integer id = favoriteService.getFavoriteListPostState(dto);
		log.debug("ListDestinationId = {}", id);
		
		return ResponseEntity.ok(id != null ? id : -1);
	}
	
	@PostMapping("/destination/update")
	@ResponseBody
	public ResponseEntity<Void> updateFavoriteDestination(@RequestBody FavoriteListDestUpdateReqDto reqDto) {
 
	    boolean isCurrentlyFavorite = favoriteService.isFavoriteListDest(reqDto.getSignedInUser(), reqDto.getDestinationId());	 
	    if ((reqDto.getIsFavorite() == 1) == isCurrentlyFavorite) {        
	        return ResponseEntity.ok().build();
	    }
	    if (reqDto.getIsFavorite() == 1) {
	        favoriteService.addFavoriteListDest(reqDto);
	    } else {	    
	    		favoriteService.removeFavoriteListDest(reqDto);
	    }
	    return ResponseEntity.ok().build();
	}
	@PostMapping("/user/update")
	@ResponseBody
	public ResponseEntity<Void> updateFavoriteUser(@RequestBody FavoriteListUserUpdateReqDto reqDto) {
 
	    boolean isCurrentlyFavorite = favoriteService.isFavoriteListUser(reqDto.getSignedInUser(), reqDto.getInterestedUserId());	 
	    if ((reqDto.getIsFavorite() == 1) == isCurrentlyFavorite) {        
	        return ResponseEntity.ok().build();
	    }
	    if (reqDto.getIsFavorite() == 1) {
	        favoriteService.addFavoriteListUser(reqDto);
	    } else {	    
	    		favoriteService.removeFavoriteListUser(reqDto);
	    }
	    return ResponseEntity.ok().build();
	}
	@PostMapping("/post/update")
	@ResponseBody
	public ResponseEntity<Void> updateFavoritePost(@RequestBody FavoriteListPostUpdateReqDto reqDto) {
 
	    boolean isCurrentlyFavorite = favoriteService.isFavoriteListPost(reqDto.getSignedInUser(), reqDto.getPostId());	 
	    if ((reqDto.getIsFavorite() == 1) == isCurrentlyFavorite) {        
	        return ResponseEntity.ok().build();
	    }
	    if (reqDto.getIsFavorite() == 1) {
	        favoriteService.addFavoriteListPost(reqDto);
	    } else {	    
	    		favoriteService.removeaddFavoriteListPost(reqDto);
	    }
	    return ResponseEntity.ok().build();
	}
	
}
