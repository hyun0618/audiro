package com.audiro.web;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.audiro.dto.RecentlyViewedDto;
import com.audiro.service.RecentlyViewedService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RecentlyViewedController {

	private final RecentlyViewedService recentlyViewedService;
	
	@PostMapping("/recentlyViewed/add")
    public ResponseEntity<Void> addRecentlyViewedDestination(@RequestBody Map<String, Integer> payload) {
        Integer destinationId = payload.get("destinationId");
        recentlyViewedService.addRecentlyViewedDest(destinationId);
        return ResponseEntity.ok().build();
    }
	
	// 최근 본 여행지
	@GetMapping("/recentlyViewed")
	@ResponseBody
	public List<RecentlyViewedDto> recentlyViewedDest() {
		return recentlyViewedService.getRecentlyViewedDest();
	}
}
