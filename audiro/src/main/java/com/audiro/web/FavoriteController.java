package com.audiro.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.audiro.dto.FavoriteDestinationDto;
import com.audiro.dto.FavoriteListDestStateReqDto;
import com.audiro.dto.FavoritePostDto;
import com.audiro.dto.FavoriteStateReqDto;
import com.audiro.dto.FavoriteUpdateReqDto;
import com.audiro.dto.FavoriteUsersDto;
import com.audiro.dto.RecentlyViewedDto;
import com.audiro.service.FavoriteService;
import com.audiro.service.RecentlyViewedService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class FavoriteController {
	
	private final FavoriteService favoriteService;
	private final RecentlyViewedService recentlyViewedService;
	
	@GetMapping("/favorite/list")
	public String list(@RequestParam(name = "sort", required = false) String sort, @RequestParam(name = "tab", required = false) String tab, Model model) {
		if (sort == null || sort.isEmpty()) {
            sort = "created_time"; // 기본 정렬 기준 설정
        }
		List<FavoriteUsersDto> favoriteUsers = favoriteService.readUsers(sort);
		List<FavoriteDestinationDto> favoriteDestinations = favoriteService.readDestination(sort);
		List<FavoritePostDto> favoritePost = favoriteService.readPost(sort);

		model.addAttribute("favoriteUsers", favoriteUsers);
		model.addAttribute("favoriteDestination", favoriteDestinations);
		model.addAttribute("favoritePost", favoritePost);
		model.addAttribute("currentSort", sort); 
		model.addAttribute("activeTab", "#" + tab);
			
		return "/favorite/list";
	}
	
	
 
}


