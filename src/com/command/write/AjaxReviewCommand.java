package com.command.write;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.lec.beans.AjaxReviewJSON;

public class AjaxReviewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// parameter 받아오기,  없으면 json response (디폴트)
		String reqType = request.getParameter("reqType");
		if(reqType == null) reqType = "json";
		
		// "xml" 혹은 "json" 으로 response 하기
		switch(reqType) {
		case "json":
			responseJSON(request, response);  // Jackson 사용
			break;
		default:
			responseJSON(request, response);  // Jackson 사용
			break;
		} // end switch
	} // end execute()

	// Jackson-databind 사용하여 XML response
	// jackson-dataformat-xml.jar 필요

	/*
	 * Jackson-databind 사용하여 JSON response
	 */
	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
		int cnt = (int)request.getAttribute("result");
		int rno = (int)request.getAttribute("rno");
		AjaxReviewJSON list = new AjaxReviewJSON();  // response 할 Java 객체
		
		List<Integer> arr = new ArrayList<Integer>();
		arr.add(cnt);
		arr.add(rno);
		
		if(cnt == 0) {
			list.setStatus("FAIL");
		} else {
			list.setStatus("OK");
			list.setCount(cnt);
			list.setList(arr);
		}
		
		ObjectMapper mapper = new ObjectMapper();   // Java -> Json 매핑할 Mapper 객체
		
		try {
			String jsonString = mapper.writeValueAsString(list);
			
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);  // response 내보내기 
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

} // end Command




















