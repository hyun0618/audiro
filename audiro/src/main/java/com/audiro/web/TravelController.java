package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.audiro.dto.TravelDestinationDetailsDto;
import com.audiro.repository.TravelDestination;
import com.audiro.service.TravelDestinationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/travel")
public class TravelController {
	
	private final TravelDestinationService service;
	
	@GetMapping("/search")
	public void search() {
		
	}
	
	@GetMapping("/details")
	public void details(@RequestParam(name = "id") int id, Model model) {
		TravelDestinationDetailsDto dto = service.readDetails(id);
		
		model.addAttribute("destination", dto);
	}

}
