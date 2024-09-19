package com.audiro.web;

import static com.audiro.filter.AuthenticationFilter.SESSION_ATTR_USER;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.audiro.dto.UserSignUpDto;
import com.audiro.dto.UserSigninDto;
import com.audiro.repository.User;
import com.audiro.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/user")
public class UserController {
	
	private final UserService userService;
	
	@GetMapping("/signup")
	public void signup() {

	}
	
	@PostMapping("/signup")
	public String signUp(UserSignUpDto dto) {
		userService.signup(dto);
		
		return "redirect:/user/signin";
	}
	
	@GetMapping("/signin")
	public void signin() {
		
	}
	
	@PostMapping("/signin")
	public String signin(UserSigninDto dto,
			@RequestParam(name = "target", defaultValue = "") String target,
			HttpSession session) throws IOException {
		
		User user = userService.signin(dto);
		String targetPage = "";
		
		if (user != null) {
			session.setAttribute(SESSION_ATTR_USER, user.getId());
			session.setAttribute("signedInUsersId", user.getUsersId()); 
			session.setAttribute("signedInUsersNickname", user.getNickname()); 
			
			targetPage = (target.equals("")) ? "/" : target;
		} else {
			targetPage = "/user/signin?result=f&target=" + URLEncoder.encode(target, "UTF-8");
		}
		
		return "redirect:" + targetPage;
	}
	
	@GetMapping("/signout")
	public String signOut(HttpSession session) {
		session.removeAttribute(SESSION_ATTR_USER);
		session.invalidate();
		
		return "redirect:/";
	}
	
}
