package com.kingnod.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file/upload/")
public class FileController {
	private static Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@RequestMapping(value="package",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> loginPost(@RequestParam("file") MultipartFile file,
			HttpSession httpSession){
		Map<String,Object> map = new HashMap<String,Object>();
		String fileName = file.getOriginalFilename();
		logger.info("附件名称"+fileName);
		map.put("fileName",fileName);
		return map;
	}
	
	
}
