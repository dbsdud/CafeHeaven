package poly.controller;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.apache.log4j.Logger;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.fasterxml.jackson.databind.ObjectMapper;

import poly.dto.ApiDTO;
import poly.dto.ChartDTO;
import poly.service.IChartService;
import poly.util.CmmUtil;
import poly.util.HttpUtil;
import poly.util.OpenApiXml;
import poly.util.StringUtil;

@Controller
public class BigDataController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="ChartService")
	private IChartService chartService;
	//ssxxsxsdxsxs
	@RequestMapping(value="bigData/bigData")
	public String bigData() {
		return "/bigData/bigData";
	}
	
	//시도 조회
	@RequestMapping(value="sido/sidoSearch")
	public @ResponseBody List<ApiDTO> sido(HttpServletRequest req) throws Exception{
	log.info("search sido start: "+this.getClass());
	/*String sido=req.getParameter("sido");
	log.info("sido 확인 :"+sido);*/
	
	//dong city
	List<ApiDTO> sidoList = new ArrayList<>();
	//xml 파싱
	try {
		DocumentBuilderFactory factory= DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse("http://apis.data.go.kr/B553077/api/open/sdsc/baroApi?resId=dong&catId=mega&signguCd=00&ServiceKey=DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D");
		doc.getDocumentElement().normalize();
		
		//System.out.println("Root element : "+doc.getDocumentElement().getNodeName());
		NodeList list = doc.getElementsByTagName("item");//태그 시작위치
		//System.out.println("-----------------------");
		
		for(int temp = 0; temp < list.getLength(); temp++){
			Node node = list.item(temp);
			if(node.getNodeType()==Node.ELEMENT_NODE){
				Element element = (Element)node;
				//String ctprvnNm=OpenApi.getTagValue("ctprvnNm",element);
				ApiDTO apiDTO=new ApiDTO();
				apiDTO.setCtprvnNm(OpenApiXml.getTagValue("ctprvnNm",element));
				apiDTO.setCtprvnCd(OpenApiXml.getTagValue("ctprvnCd",element));
			
				sidoList.add(apiDTO);
			
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	log.info("search sido end: "+this.getClass());
	
		return sidoList;
	}
	
	
	//구군 조회
		@RequestMapping(value="gugun/gugunSearch")
		public @ResponseBody List<ApiDTO>  gugun(HttpServletRequest req) throws Exception{
		log.info("search gugun start: "+this.getClass());
		String sido=req.getParameter("sido");//시도 코드
		List<ApiDTO> gugunList = new ArrayList<>();
		//xml 파싱
		try {
			DocumentBuilderFactory factory= DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse("http://apis.data.go.kr/B553077/api/open/sdsc/"
					+ "baroApi?resId=dong&catId=cty&ctprvnCd="+sido
					+ "&ServiceKey=DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D");
			
			doc.getDocumentElement().normalize();
			
			//System.out.println("Root element : "+doc.getDocumentElement().getNodeName());
			NodeList list = doc.getElementsByTagName("item");//태그 시작위치
			//System.out.println("-----------------------");
			
			for(int temp = 0; temp < list.getLength(); temp++){
				Node node = list.item(temp);
				if(node.getNodeType()==Node.ELEMENT_NODE){
					Element element = (Element)node;
					//String ctprvnNm=OpenApi.getTagValue("ctprvnNm",element);
					ApiDTO apiDTO=new ApiDTO();
					//여기서는 시도 번호나 명을 세팅해야 나중에 select 조회 할때 쓸수 있음
					apiDTO.setCtprvnCd(OpenApiXml.getTagValue("ctprvnCd",element));
					apiDTO.setSignguCd(OpenApiXml.getTagValue("signguCd",element));//시군구코드번호 세팅
					apiDTO.setSignguNm(OpenApiXml.getTagValue("signguNm",element));//시군구 명 세팅
					//확인
					/*log.info(apiDTO.getCtprvnCd());
					log.info(apiDTO.getCtprvnNm());*/
					gugunList.add(apiDTO);
					
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("search gugun end: "+this.getClass());
		
			return gugunList;
		}
		//동면읍 조회
			@RequestMapping(value="dong/dongSearch")
			public @ResponseBody List<ApiDTO>  dongEubMyun(HttpServletRequest req) throws Exception{
				log.info("search dong start: "+this.getClass());
				String gugun=req.getParameter("gugun");//시군구 코드
				log.info("search dong gugun code:"+gugun);
				List<ApiDTO> dongList = new ArrayList<>();
				//xml 파싱
				try {
					DocumentBuilderFactory factory= DocumentBuilderFactory.newInstance();
					DocumentBuilder builder = factory.newDocumentBuilder();
					Document doc = builder.parse("http://apis.data.go.kr/B553077/api/open/sdsc/baroApi?resId=dong&catId=admi"
							+ "&signguCd="+gugun
							+ "&ServiceKey=DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D");
					
					doc.getDocumentElement().normalize();
					
					//System.out.println("Root element : "+doc.getDocumentElement().getNodeName());
					NodeList list = doc.getElementsByTagName("item");//태그 시작위치
					//System.out.println("-----------------------");
					
					for(int temp = 0; temp < list.getLength(); temp++){
						Node node = list.item(temp);
						if(node.getNodeType()==Node.ELEMENT_NODE){
							Element element = (Element)node;
							//String ctprvnNm=OpenApi.getTagValue("ctprvnNm",element);
							ApiDTO apiDTO=new ApiDTO();
							//여기서는 시도 번호나 명을 세팅해야 나중에 select 조회 할때 쓸수 있음
							apiDTO.setSignguCd(OpenApiXml.getTagValue("signguCd",element));//시군구 코드
							apiDTO.setAdongCd(OpenApiXml.getTagValue("adongCd",element));//행정동코드
							apiDTO.setAdongNm(OpenApiXml.getTagValue("adongNm",element));//행정동명 
							//확인
					/*		log.info(apiDTO.getAdongCd());
							log.info(apiDTO.getAdongNm());*/
							dongList.add(apiDTO);
							
							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				log.info("search dong end: "+this.getClass());
				
					return dongList;
				}
				
				
////////////////////////////지역별  업종별 분포도 조회
				
//대분류 조회/////////////////////////////
	@RequestMapping(value="cgBusiness/bigSearch")
	public @ResponseBody List<ApiDTO>  bigBusiness(HttpServletRequest req) throws Exception{
		log.info("search bigBusiness start: "+this.getClass());
		List<ApiDTO> bigBusinessList = new ArrayList<>();
				//xml 파싱
			try {
				DocumentBuilderFactory factory= DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse("http://apis.data.go.kr/B553077/api/open/sdsc/largeUpjongList?"
						+ "ServiceKey=DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D");
					
				doc.getDocumentElement().normalize();
					
				NodeList list = doc.getElementsByTagName("item");//태그 시작위치
					
				for(int temp = 0; temp < list.getLength(); temp++){
					Node node = list.item(temp);
					if(node.getNodeType()==Node.ELEMENT_NODE){
						Element element = (Element)node;
						//String ctprvnNm=OpenApi.getTagValue("ctprvnNm",element);
						ApiDTO apiDTO=new ApiDTO();
							//여기서는 시도 번호나 명을 세팅해야 나중에 select 조회 할때 쓸수 있음
						apiDTO.setIndsLclsCd(OpenApiXml.getTagValue("indsLclsCd",element));//대분류코드
						apiDTO.setIndsLclsNm(OpenApiXml.getTagValue("indsLclsNm",element));//대분류명 
						//확인
				/*		log.info("대분류 코드 get:"+apiDTO.getIndsLclsCd());
						log.info("대분류 명 get:"+apiDTO.getIndsLclsNm());*/
						bigBusinessList.add(apiDTO);
							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				log.info("search bigBusiness end: "+this.getClass());
				
					return bigBusinessList;
				}
				
	//중분류 조회/////////////////////////////		
				
	@RequestMapping(value="cgBusiness/midSearch")
	public @ResponseBody List<ApiDTO>  midBusiness(HttpServletRequest req) throws Exception{
		log.info("search midBusiness start: "+this.getClass());
		String bigCode=req.getParameter("bigCode");
		log.info("search mid req bigCode:"+bigCode);
		List<ApiDTO> midBusinessList = new ArrayList<>();
				//xml 파싱
			try {
				DocumentBuilderFactory factory= DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document doc = builder.parse("http://apis.data.go.kr/B553077/api/open/sdsc/middleUpjongList?indsLclsCd="+bigCode
						+ "&ServiceKey=DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D");
					
				doc.getDocumentElement().normalize();
					
				NodeList list = doc.getElementsByTagName("item");//태그 시작위치
					
				for(int temp = 0; temp < list.getLength(); temp++){
					Node node = list.item(temp);
					if(node.getNodeType()==Node.ELEMENT_NODE){
						Element element = (Element)node;
						//String ctprvnNm=OpenApi.getTagValue("ctprvnNm",element);
						ApiDTO apiDTO=new ApiDTO();
							//여기서는 시도 번호나 명을 세팅해야 나중에 select 조회 할때 쓸수 있음
						
						apiDTO.setIndsLclsCd(OpenApiXml.getTagValue("indsLclsCd",element));//대분류코드
						apiDTO.setIndsMclsCd(OpenApiXml.getTagValue("indsMclsCd",element));//중분류코드 
						apiDTO.setIndsMclsNm(OpenApiXml.getTagValue("indsMclsNm",element));//중분류명 
						//확인
						/*log.info("중분류 코드 get:"+apiDTO.getIndsMclsCd());
						log.info("중분류 명 get:"+apiDTO.getIndsMclsNm());*/
						midBusinessList.add(apiDTO);
							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				log.info("search midBusiness end: "+this.getClass());
				
					return midBusinessList;
				}
	
	//소분류 조회
	
	@RequestMapping(value="cgBusiness/smallSearch")
	public @ResponseBody List<ApiDTO>  smallBusiness(HttpServletRequest req) throws Exception{
	log.info("search smallBusiness start: "+this.getClass());
	String bigCode=req.getParameter("bigCode");
	log.info("search small req bigCode:"+bigCode);
	String midCode=req.getParameter("midCode");
	log.info("search small req midCode:"+midCode);
	List<ApiDTO> smallBusinessList = new ArrayList<>();
		//xml 파싱
	try {
		DocumentBuilderFactory factory= DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse("http://apis.data.go.kr/B553077/api/open/sdsc/smallUpjongList?indsLclsCd="+bigCode
				+ "&indsMclsCd="+midCode
				+ "&ServiceKey=DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D");
			
		doc.getDocumentElement().normalize();
			
		//System.out.println("Root element : "+doc.getDocumentElement().getNodeName());
		NodeList list = doc.getElementsByTagName("item");//태그 시작위치
		//System.out.println("-----------------------");
			
		for(int temp = 0; temp < list.getLength(); temp++){
			Node node = list.item(temp);
			if(node.getNodeType()==Node.ELEMENT_NODE){
				Element element = (Element)node;
				//String ctprvnNm=OpenApi.getTagValue("ctprvnNm",element);
				ApiDTO apiDTO=new ApiDTO();
					//여기서는 시도 번호나 명을 세팅해야 나중에 select 조회 할때 쓸수 있음
				
				apiDTO.setIndsMclsCd(OpenApiXml.getTagValue("indsMclsCd",element));//중분류코드
				apiDTO.setIndsSclsCd(OpenApiXml.getTagValue("indsSclsCd",element));//소분류코드 
				apiDTO.setIndsSclsNm(OpenApiXml.getTagValue("indsSclsNm",element));//소분류명 
				//확인
		/*		log.info("중분류 코드 get:"+apiDTO.getIndsSclsCd());
				log.info("중분류 명 get:"+apiDTO.getIndsSclsNm());*/
				smallBusinessList.add(apiDTO);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("search midBusiness end: "+this.getClass());
		
			return smallBusinessList;
		}
	//업종별 분포도 서울 몇개 경기도 몇개 전라도 몇개 리스트로 대중소 시도, 구군 ,동 9개의 경우의수 일거같음
	//semas openapi 활용가이드  13) 업종별 상가업소 조회 오퍼레이션
	//divId 는 분류 코드 key 업종코드값
	//ApiDTO 에  필요한 값 dto 명 써주기
/////////////////////////////////////////////////////////////////////////////////////////////////////상권밀집도///////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/bigData/bsCgDistribution")
	public @ResponseBody Map<String, Object> bsCgDistribution(HttpServletRequest req) throws Exception{
		
		
		log.info("search bsCgDistribution start: "+this.getClass());
		//divId  인 지역 분류코드와  key 업종코드값 불러와야됨
		String divId=req.getParameter("divId");
		log.info("search bsCgDistribution req divId:"+divId);
		String key=req.getParameter("key");
		log.info("search bsCgDistribution req key:"+key);
		String ServiceKey="DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D";
		String url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInUpjong?divId="+divId+"&key="+key+"&ServiceKey="+ServiceKey+"&type=json";
		
		HashMap<String, String> hashmapJson = new HashMap<String, String>();
		HashMap<String, Object> hashmapRes = new HashMap<String, Object>();
		
		
		try{
			String charSet = "EUC-KR";
			
			HashMap<String, String> hashmapResponse = (HashMap<String, String>) HttpUtil.callURLGet(url,  charSet);
			if ("200".equals(hashmapResponse.get("httpStatus"))){
				String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
			}else{
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		}catch (Exception e){
			hashmapRes.put("REP_CODE", "9999");
			hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		
			log.info("search  bsCgDistribution  end: "+this.getClass());
		    Iterator<String> i =  hashmapRes.keySet().iterator();
	         while(i.hasNext()) {
	        	i.next();
	      /*      String key1 = i.next();
	            System.out.println(hashmapRes.get(key1));*/
	         }
			return hashmapRes;
			//여기서 apiDTO 에도 저장해야됨

	}

//1.반경내 상권조회 오퍼레이션 명세  상권번호를 얻고  trarNo
//2. 상권번호 얻은걸로 지정 상권조회 오퍼레이션 명세
	@RequestMapping(value="/bigData/cafeLocAnalysis")
	public @ResponseBody Map<String,Object> cafeLocAnalysis(HttpServletRequest req) throws Exception{
		log.info("cafeLocAnalysis start:"+this.getClass());
		
		String cx = req.getParameter("cx");//중심점 경도
		log.info("cafeLoc Ans cx:"+cx);
		String cy = req.getParameter("cy");//중심점 위도
		log.info("cafeLoc Ans cy:"+cy);
		String radius = req.getParameter("radius");//반경
		log.info("cafeLoc Ans radius:"+radius);
		String ServiceKey="DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D";
		//String bgCg= req.getParameter("bgCg");
		
		
		String url ="http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?"
				+ "radius="+radius
				+ "&cx="+cx
				+ "&cy="+cy
				+ "&ServiceKey="+ServiceKey
				+"&type=json"
				+"&numOfRows=1000";
		
		HashMap<String, String> hashmapJson = new HashMap<String, String>();
		HashMap<String, Object> hashmapRes = new HashMap<String, Object>();
		
		try{
			String charSet = "EUC-KR";
			
			HashMap<String, String> hashmapResponse = (HashMap<String, String>) HttpUtil.callURLGet(url,  charSet);
			if ("200".equals(hashmapResponse.get("httpStatus"))){
				String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
			}else{
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		}catch (Exception e){
			hashmapRes.put("REP_CODE", "9999");
			hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		
		    Iterator<String> i =  hashmapRes.keySet().iterator();
	         while(i.hasNext()) {
	        	 i.next();
	       /*     String key1 = i.next();
	            System.out.println(hashmapRes.get(key1));*/
	         }
	 		log.info("cafeLocAnalysis end:"+this.getClass());
			return hashmapRes;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////상권밀집도 끝///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////업종별 분포도 시작/////////////////////////////////////////////////////////////////////////////////	
	//"http://apis.data.go.kr/B553077/api/open/sdsc/baroApi?resId=dong&catId=mega&signguCd=00&ServiceKey=DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D&type=json
	//전체 지도 상권 개수
	@RequestMapping(value="bigData/bsCgDbMap")
	public @ResponseBody Map<String,Object> bsCgDbMap(HttpServletRequest req) throws Exception{
		String url="http://apis.data.go.kr/B553077/api/open/sdsc/baroApi?resId=dong&catId=mega&signguCd=00&ServiceKey=DCERWRgTB%2BHukgI%2BBfnSKofhO6udoVebyOCM4EEZeBKYhcCOb1xlhG2SaLCqdRChGiduI%2FOYrYUGttvma45Ytw%3D%3D&type=json";
		HashMap<String, String> hashmapJson = new HashMap<String, String>();
		HashMap<String, Object> hashmapRes = new HashMap<String, Object>();
		
		try{
			String charSet = "EUC-KR";
			
			HashMap<String, String> hashmapResponse = (HashMap<String, String>) HttpUtil.callURLGet(url,  charSet);
			if ("200".equals(hashmapResponse.get("httpStatus"))){
				String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
				
				hashmapRes = StringUtil.JsonStringToObject(responseBody);
			}else{
				hashmapRes.put("REP_CODE", "9999");
				hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
			}
		}catch (Exception e){
			hashmapRes.put("REP_CODE", "9999");
			hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
		
		    Iterator<String> i =  hashmapRes.keySet().iterator();
	         while(i.hasNext()) {
	        	 //i.next();
	        	
	        		String key=i.next();
	        		log.info(key);
	        //		hashmapRes.get(key);
	         }
	         
	         //JSONParser parser = new JSONParser();
	         //JSONObject json = (JSONObject) parser.parse(stringToParse);
	 		log.info("cafeLocAnalysis end:"+this.getClass());
			return hashmapRes;
	
	}
	
	// 성별차트(윤영)
	/*@RequestMapping(value="bigData/weekGenderChart")
	public @ResponseBody List<ChartDTO> weekGender() throws Exception{
		log.info(this.getClass().getName() + " weekGender Start");
		List<ChartDTO> chList = chartService.getWeekGender();
		log.info(this.getClass().getName() + " weekGender End");
		return chList;
	}*/
}
