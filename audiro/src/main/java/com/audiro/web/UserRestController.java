package com.audiro.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/user")
public class UserRestController {

	private final UserService userService;
	
	@GetMapping("/check-id")
	@ResponseBody
	public ResponseEntity<String> checkId(@RequestParam(name = "id") String id) {
		log.debug("checkId(id={})", id);
		
		boolean result = userService.checkId(id);
		if (result) {
			return ResponseEntity.ok("Y");
		} else {
			return ResponseEntity.ok("N");
		}
	}
	
	@GetMapping("/check-nickname")
	@ResponseBody
	public ResponseEntity<String> checkNickname(@RequestParam(name = "nickname") String nickname) {
		boolean result = userService.checkNickname(nickname);
		if (result) {
			return ResponseEntity.ok("Y");
		} else {
			return ResponseEntity.ok("N");
		}
	}
	
	@GetMapping("/check-phone")
	@ResponseBody
	public ResponseEntity<String> checkPhone(@RequestParam(name = "phone") String phone) {
		boolean result = userService.checkPhone(phone);
		if (result) {
			return ResponseEntity.ok("Y");
		} else {
			return ResponseEntity.ok("N");
		}
	}
	
	@GetMapping("/check-email")
	@ResponseBody
	public ResponseEntity<String> checkEmail(@RequestParam(name = "email") String email) {
		boolean result = userService.checkEmail(email);
		if (result) {
			return ResponseEntity.ok("Y");
		} else {
			return ResponseEntity.ok("N");
		}
	}
}
