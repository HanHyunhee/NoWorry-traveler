package com.res.travel;

import java.nio.charset.StandardCharsets;

import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class apiController1 {
	
	private final String serviceKey="Dt+62KH+mY+kzh4pmZ8eJjwcxWKpTYfUsdqybQFkobVtsnNOuuE3NF96V94O+JrhqzTZyehilYRckOqp1sIkaw==";

		@RequestMapping(value="api",method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	    public String getDataFromAPI(
	            @RequestParam("numOfRows") int numOfRows,
	            @RequestParam("pageNo") int currentPage,
	            @RequestParam("MobileOS") String mobileOS,
	            @RequestParam("MobileApp") String mobileApp,
	            @RequestParam("arrange") String arrange 
	    ) {
	        // API 호출을 위한 URL 생성
			
	        String apiUrl = "https://apis.data.go.kr/B551011/KorService1/searchStay1"
	                + "?numOfRows=" + numOfRows
	                + "&pageNo=" + currentPage
	                + "&MobileOS=" + mobileOS
	                + "&MobileApp=" + mobileApp
	                + "&_type=json"
	                + "&arrange=" + arrange
	                + "&serviceKey=" + serviceKey;

	        
	        RestTemplate restTemplate = new RestTemplate();
	        restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
	        String result = restTemplate.getForObject(apiUrl, String.class);

	        return result; // API 호출 결과를 클라이언트에게 전달
	    }
		
		@RequestMapping(value="re_travel",method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	    public String region(
	            @RequestParam("numOfRows") int numOfRows,
	            @RequestParam("pageNo") int currentPage,
	            @RequestParam("MobileOS") String mobileOS,
	            @RequestParam("MobileApp") String mobileApp,
	            @RequestParam("keyword") String keyword
	           
	    ) {
	        // API 호출을 위한 URL 생성
			
	        String apiUrl = "https://apis.data.go.kr/B551011/KorService1/searchKeyword1"
	        		+"?serviceKey="+serviceKey
	        		+"&numOfRows=" +numOfRows
	                + "&pageNo=" + currentPage
	                + "&MobileOS=" + mobileOS
	                + "&MobileApp=" + mobileApp
	                + "&_type=json"
	                + "&listYN=Y" 
	                +"&arrange=A"  
	                +"&keyword="+ keyword
	                + "&contentTypeId=12"; 
	                

	        
	        RestTemplate restTemplate = new RestTemplate();
	        restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
	        String result = restTemplate.getForObject(apiUrl, String.class);

	        return result; // API 호출 결과를 클라이언트에게 전달
	    }
		
	}

