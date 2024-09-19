package com.audiro.web;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.repository.DestinationTag;
import com.audiro.repository.TravelDestination;
import com.audiro.service.DataService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/destination")
@RequiredArgsConstructor
public class DataRestController {

	private final DataService service;

	@PostMapping("/save")
	public ResponseEntity<String> saveData(@RequestBody List<TravelDestination> data) {
		service.saveAll(data);
		return ResponseEntity.ok("Data saved successfully");
	}
	@PostMapping("/save/tag")
	public ResponseEntity<String> saveTag(@RequestBody List<DestinationTag> data) {
		service.saveTag(data);
		return ResponseEntity.ok("Data saved successfully");
	}


}

