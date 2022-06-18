package com.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.study.dto.ReviewAttachDTO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Controller
public class ReviewUploadAjaxController {
	
	@PostMapping("/uploadAjax2")
	public ResponseEntity<List<ReviewAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("ajax 업로드 요청");
		
		List<ReviewAttachDTO> attachList = new ArrayList<ReviewAttachDTO>();
		
		// 업로드 폴더 지정
		String uploadBasicPath = "c:\\upload";
		// 업로드 세부 폴더 지정 "2022\05\06"
		String uploadFolderPath = getFolder();
		// 전체 업로드 경로 생성 "d://upload//2022//05//06
		File uploadPath = new File(uploadBasicPath, uploadFolderPath);
		
		// 폴더가 없다면 폴더들 생성
		if(!uploadPath.exists()) { 
			uploadPath.mkdirs();
		}
		
		// 업로드파일명
		String uploadFileName ="";
		File save = null;
		for(MultipartFile f:uploadFile) {
			
			// 파일명 가져오기
			String oriFileName = f.getOriginalFilename();
			// 중복 파일명 해결하기
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+oriFileName;
				
			// 업로드 파일 객체 생성
			ReviewAttachDTO attachDto = new ReviewAttachDTO();
			attachDto.setR_uploadpath(uploadFolderPath);
			attachDto.setR_filename(oriFileName);
			attachDto.setR_uuid(uuid.toString());
				
			save = new File(uploadPath, uploadFileName);
			try {
				//썸네일 저장
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
				InputStream in = f.getInputStream();
				Thumbnailator.createThumbnail(in,thumbnail, 300, 300);
				in.close();
				thumbnail.close();
			
				// 파일저장
				f.transferTo(save);
				attachList.add(attachDto);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}	
		log.info("사진파일 확인 "+attachList);
		return new ResponseEntity<List<ReviewAttachDTO>>(attachList, HttpStatus.OK);
	}
	
	// 폴더 생성 메소드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// 오늘 날짜
		Date date = new Date(); // Wed Dec 08 15:40:05 KST 2022
		// "2022-05-06"
		String str = sdf.format(date);
		
		// windows:\ , unix : / => // "2022\5\06\"
		return str.replace("-",File.separator);
	}
	
	// 서버 파일 삭제 : X버튼 클릭시
	@PostMapping("/deleteFile2")
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("파일 삭제 요청 "+fileName);
		
		try {
			// 썸네일 삭제
			File file = new File("d:\\upload\\"+URLDecoder.decode(fileName, "utf-8"));
			file.delete(); 
			
			//원본 파일 삭제
			String largeName = file.getAbsolutePath().replace("s_","");
			file = new File(largeName);
			file.delete();

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
 	}

	
}
