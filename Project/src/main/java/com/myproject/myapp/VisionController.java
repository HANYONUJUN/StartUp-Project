package com.myproject.myapp;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.vision.v1.*;
import com.google.protobuf.ByteString;
import java.awt.Color;
import java.awt.AlphaComposite;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/board/*")
public class VisionController {
	
	private static final Logger logger= LoggerFactory.getLogger(VisionController.class);
	
	@RequestMapping(value = "vision", method = RequestMethod.GET)
	public void Vision() {
		logger.info("이미지 라벨 추출 페이지 진입");
	}
	
	
	@RequestMapping(value = "/upload", method = {RequestMethod.POST, RequestMethod.GET})
	public String upload(@RequestParam("file") MultipartFile file, Model model) throws Exception {
	    
		//발급받은 google cloud vision api json 파일을 절대경로로 지정시켜서 읽을 수 있게 만듬.
		String credentialsLocation = "내 인증정보";
		GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream(credentialsLocation));
		ImageAnnotatorSettings settings =
			    ImageAnnotatorSettings.newBuilder().setCredentialsProvider(FixedCredentialsProvider.create(credentials)).build();
        
		// 파일 이름과 파일 내용을 Base64로 인코딩하여 모델에 추가
	    String fileName = file.getOriginalFilename();
	    String fileContent = new String(Base64.encodeBase64(file.getBytes()));
	    model.addAttribute("fileName", fileName);
	    model.addAttribute("fileContent", fileContent);
		
		// Vision API에 연결.
	    try (ImageAnnotatorClient client = ImageAnnotatorClient.create(settings)) {
	      
	      // MultipartFile 객체를 바이트 배열로 변환
	      byte[] imageBytes = file.getBytes();

	      // 이미지를 Vision API로 전송하여 라벨을 추출
	      List<AnnotateImageRequest> requests = new ArrayList<>();
	      ByteString imgBytes = ByteString.copyFrom(imageBytes);
	      Image img = Image.newBuilder().setContent(imgBytes).build();
	      Feature feat = Feature.newBuilder().setType(Feature.Type.LABEL_DETECTION).build();
	      
	      AnnotateImageRequest request =
	          AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
	      requests.add(request);
	      BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);

	      // 추출된 라벨을 반환
	      List<AnnotateImageResponse> responses = response.getResponsesList();
	      for (AnnotateImageResponse res : responses) {
	    	//에러가 나면 에러메시지 띄워줌.  
	        if (res.hasError()) {
	          System.err.printf("Error: %s\n", res.getError().getMessage());
	          return "error";
	        }
	        //추출 결과를 console 결과로 나타냄
	        List<EntityAnnotation> labels = res.getLabelAnnotationsList();
            for (EntityAnnotation label : labels) {
                System.out.println(label.getDescription() + " : " + label.getScore());
            }
            model.addAttribute("labels", labels);
	      }
	    }
	    return "/board/result";
	}
	
	
	 private String hexColor = "#000000"; // 초기 Hex Color 값 (검은색)
	
	@RequestMapping(value = "fliter", method = RequestMethod.GET)
	public void fliter(Model model) {
	    logger.info("이미지 필터 변경 페이지 진입");
	    model.addAttribute("hexColor", hexColor);
	}

	   @RequestMapping(value = "/uploadfilter", method = RequestMethod.POST)
	    public String uploadImage(@RequestParam("image") MultipartFile file,
	                              @RequestParam("hexColor") String hexColor,
	                              Model model) throws IOException {
	        BufferedImage originalImage = ImageIO.read(file.getInputStream());
	        BufferedImage filteredImage = applyFilter(originalImage, hexColor);

	        String originalEncodeImg = new String(Base64.encodeBase64(file.getBytes()));
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        String filteredEncodeImage = null;

	        try {
	            ImageIO.write(filteredImage, "png", baos);
	            byte[] imageBytes = baos.toByteArray();
	            byte[] encodedBytes = Base64.encodeBase64(imageBytes);
	            filteredEncodeImage = new String(encodedBytes);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        this.hexColor = hexColor;

	        model.addAttribute("hexColor", hexColor);
	        model.addAttribute("originalImage", originalEncodeImg);
	        model.addAttribute("filteredImage", filteredEncodeImage);

	        return "board/filteredimage"; // 필터링된 이미지를 표시할 View 페이지로 이동
	    }

	    private BufferedImage applyFilter(BufferedImage image, String hexColor) {
	        int rgb = Color.decode(hexColor).getRGB();
	        int alpha = 128; // 투명도 (0-255 범위)
	        
	        BufferedImage filteredImage = new BufferedImage(image.getWidth(), image.getHeight(),
	                BufferedImage.TYPE_INT_ARGB);
	        Graphics2D graphics = filteredImage.createGraphics();
	        graphics.drawImage(image, 0, 0, null);

	        graphics.setColor(new Color(rgb, true));
	        graphics.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha / 255f));
	        graphics.fillRect(0, 0, image.getWidth(), image.getHeight());
	        graphics.dispose();

	        return filteredImage;
	    }
	    
	    @RequestMapping(value = "/download" ,method = RequestMethod.GET)
	    public ResponseEntity<byte[]> downloadImage(@RequestParam("base64Image") String filteredImage, HttpServletRequest request) throws IOException {
	    	  // base64 문자열을 바이트 배열로 디코딩
	        byte[] imageBytes = Base64.decodeBase64(filteredImage);

	        // 다운로드할 파일의 MIME 타입 설정
	        ServletContext servletContext = request.getSession().getServletContext();
	        String contentType = servletContext.getMimeType("image.png");
	        if (contentType == null) {
	            contentType = "application/octet-stream";
	        }

	        // 파일 다운로드를 위한 Response 설정
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.parseMediaType(contentType));
	        headers.setContentDispositionFormData("attachment", "image.png");

	        return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
	    }

		
}
	 
    	 
   
