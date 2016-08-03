package com.homecloud.db;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import org.apache.commons.codec.binary.Base64;

public class FileUtil {
	public static String readFileAsBase64Icon(String file) throws IOException {
		String base64String = null;
		try {
			Path path = Paths.get(file);
			byte[] data = Files.readAllBytes(path);
			base64String = Base64.encodeBase64String(data);
		} catch (Exception e) {
			return null;
		}
		
		return base64String;
	}
	
//	public String generateImageSrc(String base64String){
//		String res = "<img src='" + base64String + "' alt="" height="48px" width="48px"/>'";
//		//console.log(res);
//		return res;
//	}
}
