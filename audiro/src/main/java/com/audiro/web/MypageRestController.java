package com.audiro.web;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;
import com.audiro.dto.MypageDto;
import com.audiro.service.MypageService;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
public class MypageRestController {
	
	private final MypageService mypageService;

	
	//비밀번호 업데이트
	@PostMapping("/mypage/updatePassword")
    public ResponseEntity<Integer> updatePassword(@RequestBody MypageDto dto) {
        // @RequestBody 어노테이션을 사용하여 요청 본문을 MypageDto 형태로 받습니다.
		log.debug("registerComment({})", dto);
        // 비밀번호 업데이트 로직을 수행합니다.
        int result = mypageService.updatePasswardHashById(dto);
        
        if (result > 0) {
            // 비밀번호 업데이트가 성공한 경우
            return ResponseEntity.ok(result); // HTTP 200 OK 응답을 반환합니다.
        } else {
            // 비밀번호 업데이트가 실패한 경우
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
            // HTTP 500 Internal Server Error 응답을 반환합니다.
        }
    }
	
	//이름 업데이트
	@PostMapping("/mypage/updateUserName")
    public ResponseEntity<Integer> updateUserName(@RequestBody MypageDto dto) {
        // @RequestBody 어노테이션을 사용하여 요청 본문을 MypageDto 형태로 받습니다.
		log.debug("updateUserName({})", dto);
		
        // 업데이트 로직을 수행합니다.
        int result = mypageService.updateUserNameById(dto);
        
        if (result > 0) {
            // 업데이트가 성공한 경우
            return ResponseEntity.ok(result); // HTTP 200 OK 응답을 반환합니다.
        } else {
            //업데이트가 실패한 경우
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
            // HTTP 500 Internal Server Error 응답을 반환합니다.
        }
    }
	
	
	//닉네임 업데이트
	@PostMapping("/mypage/updateNickname")
    public ResponseEntity<Integer> updateNickname(@RequestBody MypageDto dto) {
        // @RequestBody 어노테이션을 사용하여 요청 본문을 MypageDto 형태로 받습니다.
		log.debug("updateNickname({})", dto);
		
        // 닉네임 업데이트 로직을 수행합니다.
        int result = mypageService.updateNicknameById(dto);
        
        if (result > 0) {
            // 닉네임 업데이트가 성공한 경우
            return ResponseEntity.ok(result); // HTTP 200 OK 응답을 반환합니다.
        } else {
            // 닉네임 업데이트가 실패한 경우
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
            // HTTP 500 Internal Server Error 응답을 반환합니다.
        }
    }
	
	
	//전화번호 업데이트
	@PostMapping("/mypage/updatePhone")
    public ResponseEntity<Integer> updatePhone(@RequestBody MypageDto dto) {
        // @RequestBody 어노테이션을 사용하여 요청 본문을 MypageDto 형태로 받습니다.
		log.debug("updatePhone({})", dto);
		
        // 업데이트 로직을 수행합니다.
        int result = mypageService.updatePhoneById(dto);
        
        if (result > 0) {
            // 업데이트가 성공한 경우
            return ResponseEntity.ok(result); // HTTP 200 OK 응답을 반환합니다.
        } else {
            // 업데이트가 실패한 경우
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
            // HTTP 500 Internal Server Error 응답을 반환합니다.
        }
    }
	
	
	//이메일 업데이트
	@PostMapping("/mypage/updateEmail")
    public ResponseEntity<Integer> updateEmail(@RequestBody MypageDto dto) {
        // @RequestBody 어노테이션을 사용하여 요청 본문을 MypageDto 형태로 받습니다.
		log.debug("updateEmail({})", dto);
		
        // 업데이트 로직을 수행합니다.
        int result = mypageService.updateEmailById(dto);
        
        if (result > 0) {
            // 업데이트가 성공한 경우
            return ResponseEntity.ok(result); // HTTP 200 OK 응답을 반환합니다.
        } else {
            // 업데이트가 실패한 경우
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
            // HTTP 500 Internal Server Error 응답을 반환합니다.
        }
    }
	
	//자기소개 업데이트
		@PostMapping("/mypage/updateIntroduction")
	    public ResponseEntity<Integer> updateIntroduction(@RequestBody MypageDto dto) {
	        // @RequestBody 어노테이션을 사용하여 요청 본문을 MypageDto 형태로 받습니다.
			log.debug("updateIntroduction({})", dto);
			
	        // 업데이트 로직을 수행합니다.
	        int result = mypageService.updateIntroductionById(dto);
	        
	        if (result > 0) {
	            // 업데이트가 성공한 경우
	            return ResponseEntity.ok(result); // HTTP 200 OK 응답을 반환합니다.
	        } else {
	            // 업데이트가 실패한 경우
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
	            // HTTP 500 Internal Server Error 응답을 반환합니다.
	        }
	    }
		
		//중복검사
	    //닉네임 중복검사. 중복되면 사용불가
	    @PostMapping("/mypage/checkNickname")
	    public ResponseEntity<String> checkNickname(@RequestBody MypageDto dto) { //
	        log.debug("checkNickname(nickname={})", dto.getNickname());

	        boolean result = mypageService.checkNickname(dto.getNickname().toString());
	        log.debug("result:{}",result);
	        if (result) {
	            return ResponseEntity.ok("Y");
	        } else {
	            return ResponseEntity.ok("N");
	        }
	    }
	    
		//중복검사
	    //전화번호 중복검사. 중복되면 사용불가
	    @PostMapping("mypage/checkPhone")
	    public ResponseEntity<String> checkPhone(@RequestBody MypageDto dto) {

	        log.debug("checkPhone(dto={})", dto);
	        
	        boolean result = mypageService.checkPhone(dto.getPhone().toString());
	        if (result) {
	            return ResponseEntity.ok("Y");
	        } else {
	            return ResponseEntity.ok("N");
	        }
	    }
		//중복검사
	    //이메일 중복검사. 중복되면 사용불가
	    @PostMapping("mypage/checkEmail")
	    public ResponseEntity<String> checkEmail(@RequestBody MypageDto dto) {
	        log.debug("checkEmail(email={})", dto.getEmail().toString());
	        
	        boolean result = mypageService.checkEmail(dto.getEmail().toString()); //-> 중복 X -> 사용가능 이면 true.
	        if (result) {
	            return ResponseEntity.ok("Y");
	        } else {
	            return ResponseEntity.ok("N");
	        }
	    }	    

}
