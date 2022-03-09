package com.sns.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	public final static String FILE_UPLOAD_PATH = "D:\\정혜인\\6_spring\\sns\\workspace\\images/";
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\user\\Desktop\\portfolio\\sns\\workspace\\images/";
	
	// 이미지 저장
	public String saveFile(String userLoginId, MultipartFile file)  {
		
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		// 디렉토리 만들기 
		File directory = new File(filePath); // 파일 클레스
		if (directory.mkdir() == false) {
			// mkdir() : 파일 업로드 할 filePath 경로에 폴더(디렉토리) 생성
			logger.error("[파일업로드] 디렉토리 생성 실패");
			return null; // 디렉토리 생성 실패시 null 리턴
		}
		
		// 파일 업로드: byte 단위로 업로드한다.
		try {
			byte[] bytes =file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
			return "/images/" + directoryName + file.getOriginalFilename(); 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 이미지 삭제
}
