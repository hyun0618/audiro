package com.audiro.web;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.DetailedPlanDto;
import com.audiro.dto.FavoriteDestinationDto;
import com.audiro.dto.TravelPlanDto;
import com.audiro.repository.DetailedPlan;
import com.audiro.repository.TravelPlan;
import com.audiro.service.FavoriteDestinationService;
import com.audiro.service.TravelPlanService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/plan")
@RequiredArgsConstructor
public class TravelPlanRestController {

	private final FavoriteDestinationService favService;
	private final TravelPlanService planService;

	@GetMapping("/fav")
	public ResponseEntity<List<FavoriteDestinationDto>> readAllFavoriteDestination(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		int usersId = (int) session.getAttribute("signedInUsersId");
		List<FavoriteDestinationDto> list = favService.readAll(usersId);
		return ResponseEntity.ok(list);

	}

	@GetMapping("/fav/{favoriteDestinationId}")
	public ResponseEntity<FavoriteDestinationDto> favoriteDestinationId(@PathVariable int favoriteDestinationId) {
		FavoriteDestinationDto dto = favService.readById(favoriteDestinationId);
		return ResponseEntity.ok(dto);
	}

	@PostMapping("/create/travelPlan")
	public ResponseEntity<Integer> createPlan(@RequestBody TravelPlanDto dto) {

		int result = planService.createPlan(dto);
		return ResponseEntity.ok(result);
	}

	@PostMapping("/create/detailedPlan")
	public ResponseEntity<Integer> createDetailedPlan(@RequestBody List<DetailedPlan> plan) {
		log.debug("rest");
		int result = planService.createDetailedPlan(plan);
		return ResponseEntity.ok(result);
	}

	@GetMapping("/details/{travelPlanId}")
	public ResponseEntity<Map<String, Object>> details(@PathVariable("travelPlanId") int travelPlanId) {
		List<DetailedPlanDto> list = planService.readDetailedPlanByTravelPlanId(travelPlanId);
		int maxDay = planService.getMaxDay(travelPlanId);
		TravelPlan plan = planService.readTravelPlanById(travelPlanId);

		// Map을 사용하여 list와 maxDay를 함께 담습니다.
		Map<String, Object> response = new HashMap<>();
		response.put("list", list);
		response.put("maxDay", maxDay);
		response.put("travelPlan", plan);
		// ResponseEntity로 OK 응답과 함께 Map을 반환합니다.
		return ResponseEntity.ok(response);
	}

	@PostMapping("/modify")
	public ResponseEntity<Integer> modifyPlan(@RequestBody TravelPlanDto dto) {
		int result = planService.updateTravelPlan(dto);
		planService.deleteAllDetailedPlan(dto.getTravelPlanId());
		return ResponseEntity.ok(result);
	}

	@GetMapping("/deleteCourse/{travelPlanId}")
	public ResponseEntity<Integer> deletePlan(@PathVariable("travelPlanId") int travelPlanId) {
		int result = planService.deletePlanById(travelPlanId);
		return ResponseEntity.ok(result);
	}

}
