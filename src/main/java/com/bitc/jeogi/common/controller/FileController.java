package com.bitc.jeogi.common.controller;

import java.io.File;

import javax.annotation.PostConstruct;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitc.jeogi.common.util.FileUtil;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class FileController {

	private final String uploadDir;

	@PostConstruct
	public void init() {
		File file = new File(uploadDir);
		if (!file.exists()) {
			file.mkdirs();
		}
		System.out.println("UserServiceImpl 초기화 완료");
	}

	@GetMapping("displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		System.out.println("displayFile : " + fileName);
		return new ResponseEntity<>(FileUtil.getBytes(uploadDir, fileName), FileUtil.getHeaders(fileName),
				HttpStatus.OK);
	}

}
