package com.audiro.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.TravelDestinationListDto;
import com.audiro.service.TravelDestinationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/travel")
public class TravelRestController {
	
	private final TravelDestinationService destiService;
	
	@GetMapping("/search-tags")
	@ResponseBody
	public Map<String, Object> getDestinations(
			@RequestParam(name = "region", required = false) String[] regions,
			@RequestParam(name = "theme", required = false) String[] themes,
			@RequestParam(name = "companion", required = false) String[] companions,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		int itemsPerPage = 15;
		int totalPages = destiService.getTotalPages(regions, themes, companions, keyword, itemsPerPage);
		List<TravelDestinationListDto> dto = 
				destiService.searchByTagsAndKeyword(regions, themes, companions, keyword, currentPage, itemsPerPage);
		
		Map<String, Object> response = new HashMap<>();
		response.put("destinations", dto);
		response.put("totalPages", totalPages);
		
		return response;
	}
}
