package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.audiro.dto.DetailedPlanDto;
import com.audiro.repository.TravelPlan;
import com.audiro.service.TravelPlanService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/travel/plan")
public class TravelPlanController {

	private final TravelPlanService service;

	@GetMapping("")
	public String plan(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("signedInUsersId") != null) {
			return "/travel/plan";
		} else {
			// 세션이 존재하지 않는 경우 처리할 로직 추가
			return "redirect:/user/signin";
		}
	}

	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("signedInUsersId") != null) {
			int usersId = (int) session.getAttribute("signedInUsersId");
			List<TravelPlan> list = service.readAllTravelPlan(usersId);
			model.addAttribute("travelPlan", list);
			return "/travel/plan_list";
		} else {
			// 세션이 존재하지 않는 경우 처리할 로직 추가
			return "redirect:/user/signin";
		}
	}

	@GetMapping("/details")
	public String details(@RequestParam(name = "id") int id, Model model) {
		TravelPlan plan = service.readTravelPlanById(id);
		List<DetailedPlanDto> list = service.readDetailedPlanByTravelPlanId(id);
		model.addAttribute("travelPlan", plan);
		return "/travel/plan_details";
	}

	@PostMapping("/modify")
	public String modify(@RequestParam("travelPlanId") int travelPlanIdForModify, Model model) {
		model.addAttribute("travelPlanIdForModify", travelPlanIdForModify);
		return "/travel/plan";
	}

	@GetMapping("/search")
	public String search(@RequestParam(name = "category", defaultValue = "c") String category,
		HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("signedInUsersId") != null) {
			int usersId = (int) session.getAttribute("signedInUsersId");
			List<TravelPlan> list;
			if ("t".equals(category)) {
				list = service.readAllTravelPlanOrderByTitle(usersId);
			} else {
				list = service.readAllTravelPlan(usersId);
			}
			model.addAttribute("travelPlan", list);
			return "/travel/plan_list";
		} else {
			return "redirect:/user/signin";
		}
	}

}
