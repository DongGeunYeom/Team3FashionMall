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

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.study.dto.AttachDTO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import oracle.jdbc.proxy.annotation.Pre;

@Slf4j
@Controller
public class UploadAjaxController {
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/uploadAjax")
	public ResponseEntity<List<AttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("ajax 업로드 요청");
		
		List<AttachDTO> attachList = new ArrayList<AttachDTO>();
		
		// 업로드 폴더 지정
		String uploadBasicPath = "d:\\upload";
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
			AttachDTO attachDto = new AttachDTO();
			attachDto.setUploadPath(uploadFolderPath);
			attachDto.setFileName(oriFileName);
			attachDto.setUuid(uuid.toString());
			
			save = new File(uploadPath, uploadFileName);
			try {
			
				if(checkImageType(save)) {
					attachDto.setFileType(true);
					
					//썸네일 저장
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					InputStream in = f.getInputStream();
					Thumbnailator.createThumbnail(in,thumbnail, 80, 80);
					in.close();
					thumbnail.close();
				}
				
				// 파일저장
				f.transferTo(save);
				attachList.add(attachDto);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}	
		return new ResponseEntity<List<AttachDTO>>(attachList, HttpStatus.OK);
	}
	
	// Thumbnail Image Controller
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("이미지 요청 "+fileName);
		
		File file = new File("d:\\upload\\"+fileName);
		
		ResponseEntity<byte[]> image = null;
		
		HttpHeaders header = new HttpHeaders();
		
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return image;
	}

	// 이미지 파일 여부 확인
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image"); // image/jpeg, image/gif, image/bmp, image/png
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
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
	
	@GetMapping(path = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	// 다운로드(이미지, 텍스트, 비디오... + 상태코드)
	public ResponseEntity<Resource> downloadFile(String fileName){
		log.info("다운로드 요청 "+fileName);
		
		Resource resource = new FileSystemResource("d:\\upload\\"+fileName);
		String resourceUidName = resource.getFilename();
		// uuid값 제거
		String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition",
					"attachment;filename="+new String(resourceName.getBytes("utf-8"),"ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	// 서버 파일 삭제 : X버튼 클릭시
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type){
		log.info("파일 삭제 요청 "+fileName+" "+type);
		
		try {
			File file = new File("d:\\upload\\"+URLDecoder.decode(fileName, "utf-8"));
			file.delete(); // 이미지인 경우는 썸네일 삭제, 일반인 경우 파일 삭제
			
			// 이미지인 경우 원본 파일 삭제
			if(type.equals("image")) {
				//원본 파일 경로
				String largeName = file.getAbsolutePath().replace("s_","");
				file = new File(largeName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
 	}
	
}
