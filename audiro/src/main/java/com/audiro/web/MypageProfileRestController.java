package com.audiro.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.audiro.service.MypageService;

import jakarta.servlet.ServletContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
public class MypageProfileRestController {
	//의존성주입
	  private final ServletContext servletContext;
	  private final MypageService mypageService;

	    @PostMapping("/mypage/profile")
	    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file,
	    		@RequestParam("usersId") Integer usersId) {
	    	
	    	log.debug("handleFileUpload(file:{})",file);
	    	
	        // 파일이 비어 있는지 확인
	        if (file.isEmpty()) {
	            // 파일이 비어 있는 경우, HTTP 400 Bad Request 상태 코드와 에러 메시지를 반환
	            return ResponseEntity.badRequest().body("파일을 업로드 해주세요.");
	        }

	        try {
	            // 파일을 저장할 디렉토리 경로 설정
	            String uploadDir = servletContext.getRealPath("/static/images");
	            log.debug("uploadDir:{}",uploadDir);
	            File uploadDirFile = new File(uploadDir);

	            // 디렉토리가 존재하지 않으면 생성
	            if (!uploadDirFile.exists()) {
	                uploadDirFile.mkdirs();
	            }
	            
	         // 파일 이름에서 확장자 추출
	            String originalFilename = file.getOriginalFilename();
	            String extension = "";
	            if (originalFilename != null && originalFilename.contains(".")) {
	                extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	            }
	            // UUID를 사용하여 유니크한 파일 이름 생성
	            String uniqueFilename = UUID.randomUUID().toString() + extension;

//	         // UUID를 사용하여 고유한 파일 이름 생성
//	            String originalFilename = file.getOriginalFilename();
//	            String extension = "";
//	            if (originalFilename != null && originalFilename.contains(".")) {
//	                extension = originalFilename.substring(originalFilename.lastIndexOf("."));
//	            }
//	            String uniqueFilename = UUID.randomUUID().toString() + extension;

	            // 업로드된 파일을 저장할 파일 객체 생성
	            File uploadFile = new File(uploadDir, uniqueFilename);
	            // 업로드된 파일을 지정된 경로로 저장
	            file.transferTo(uploadFile);
	            
	         // 파일 경로 저장 및 데이터베이스 업데이트
	           // String path = "/static/images/" + uniqueFilename;
	            //log.debug("*************************path:{}",path);
	            //수정함. 파일 경로 저장 및 데이터베이스 업데이트
	            // "/static/images/"를 제거한 경로를 사용
	            String path = "images/" + uniqueFilename;
	            log.debug("*************************path:{}",path);
	            //TODO : DB에 업데이트 하기
	            mypageService.updateProfileImg(path, usersId);
	          //  Service.updateUserProfileImage(usersId, path); // 서비스 메서드를 호출하여 데이터베이스 업데이트

	            // 성공 메시지 반환, HTTP 200 OK 상태 코드와 성공 메시지를 포함한 응답을 반환
	            return ResponseEntity.ok("Y");

	        } catch (IOException e) {
	            // 파일 업로드 중 예외 발생 시 예외 메시지를 출력하고 실패 메시지 반환
	            e.printStackTrace();
	            // HTTP 500 Internal Server Error 상태 코드와 에러 메시지를 포함한 응답을 반환
	            return ResponseEntity.ok("N");
	        }
	    }

}
