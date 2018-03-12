package com.chiwoo.test.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

@RestController
@RequestMapping("/service")
public class ConvertController {


	@RequestMapping(value="/xml2json", method=RequestMethod.POST)
	public String xml2Json(HttpServletRequest request) {
		String xmlString = request.getParameter("xml2json")
							.replaceAll("\n", "")
							.replaceAll("    ", "");
		
		JSONObject json = XML.toJSONObject(xmlString);
		System.out.println(json);
		
		return json.toString();
	}
	
	
	@RequestMapping(value="/json2xml", method=RequestMethod.POST)
	public String json2Xml(HttpServletRequest request) {
		String jsonString = request.getParameter("json2xml");

		ObjectMapper mapper = new ObjectMapper();
		Map <Object, Object> map = null;
		XmlMapper xmlMapper = new XmlMapper();
		try {
			 map = mapper.readValue(jsonString, new TypeReference<Map<String, Object>>(){});
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String xml = null;
		try {
			xml= xmlMapper.writeValueAsString(map)
					.replaceAll("<LinkedHashMap>", "")
					.replaceAll("</LinkedHashMap>", "");
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return xml;
	}
}
