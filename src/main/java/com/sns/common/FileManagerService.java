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
	
	public final static String FILE_UPLOAD_PATH = "D:\\정혜인\\6_spring\\sns\\workspace\\images/";
	
	// 이미지 저장
	public String saveFile(Integer userId, MultipartFile file) throws IOException {
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			// mkdir() : 파일 업로드 할 filePath 경로에 폴더(디렉토리) 생성
			logger.error("[파일업로드] 디렉토리 생성 실패");
			return null; // 디렉토리 생성 실패시 null 리턴
		}
		
		// 파일 업로드: byte 단위로 업로드한다.
		byte[] bytes = file.getBytes();
		Path path = Paths.get(filePath + file.getOriginalFilename()); // originalFilename: input에 올린 파일명
		Files.write(path, bytes);
		
		// 이미지 url path를 리턴 (WebMucConfig에서 매핑한 이미지 path)
		
		return "/images/" + directoryName + file.getOriginalFilename();
	
	}
	
	
}
