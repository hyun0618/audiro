package com.audiro.web;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import static com.audiro.filter.AuthenticationFilter.SESSION_ATTR_USER;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.dto.MypageDto;
import com.audiro.service.MypageService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MypageController {

	private final MypageService mypageService;
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping("/mypage")
	public String mypage(@RequestParam(name = "id") String id, Model model) {
		log.debug("mypage(id:{})",id);
		
		MypageDto dto= mypageService.selectUsersAllProfileAllById(id);
		
		model.addAttribute("m", dto);
		
		return "/mypage/mypage";
	}
	
	@ResponseBody
	@PostMapping("/mypage/delete")
	public ResponseEntity<String> deleteUser(@RequestBody MypageDto dto,HttpSession session) {
		log.debug("deleteUser(dto:{})", dto);
		
		// 데이터베이스에서 해시된 비밀번호를 가져옴
		String passwordHash = mypageService.selectPasswordHash(dto.getUsersId());

		// 비밀번호가 null인지 확인
		if (passwordHash == null) {
			// 해시된 비밀번호가 없으면 사용자 ID가 잘못된 것이므로, 적절한 메시지를 반환
			return ResponseEntity.ok("NN"); //->뷰에 then에서 할일로 === NN이면 잘못된 접근입니다.
		}

		// 비밀번호가 일치하는지 확인
		boolean isMatch = passwordEncoder.matches(dto.getPasswordHash(), passwordHash);

		// 비밀번호가 일치하면
		if (isMatch) {
			// 사용자 삭제 로직을 추가
			int result = mypageService.deleteUser(dto.getUsersId());
			log.debug("result:{}",result);
			if(result == 1) {
			session.removeAttribute(SESSION_ATTR_USER);
			session.invalidate();
			return ResponseEntity.ok("Y"); //->뷰에 then에서 할일로 === Y 탈퇴가 정상적으로 완료 되었습니다.
			} else {
				return ResponseEntity.ok("NNN"); //->뷰에 then에서 할일로 === NNN 탈퇴 오류.
			}
		} else {
			// 비밀번호가 일치하지 않으면 적절한 메시지를 반환
			return ResponseEntity.ok("N"); //->뷰에 then에서 할일로 === 비밀번호가 일치하지 않습니다.
		}
	}
}
