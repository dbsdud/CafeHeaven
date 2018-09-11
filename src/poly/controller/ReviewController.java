package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.mail.search.IntegerComparisonTerm;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.PrimitiveArrayBuilder;

import poly.dto.ReviewDTO;
import poly.dto.UserDTO;
import poly.service.IReviewService;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class ReviewController {
	
	@Resource(name="ReviewService")
	private IReviewService reviewService;
	
	
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@RequestMapping(value="/notice/reviewList")
	public @ResponseBody List<ReviewDTO> reviewList(HttpServletRequest req) throws Exception {
		//rDTO 객체 생성
		
		//조회한 데이터를 리스트 형식으로 저장
		List<ReviewDTO> rList= reviewService.getReviewList();
		return rList;
	}
	
	
	//리뷰 등록 ajax
	@RequestMapping(value="/notice/cafeReviewRegProc",method=RequestMethod.POST)
	public @ResponseBody List<ReviewDTO> insertReviewReg(HttpServletRequest req) throws Exception{
		String userNo=CmmUtil.nvl(req.getParameter("userNo"));
		log.info("cafeReview userNo: "+ userNo);
		String menuName = CmmUtil.nvl(req.getParameter("menuName"));
		log.info("cafeReview menuName: "+ menuName);
		String cafeStar = CmmUtil.nvl(req.getParameter("cafeStar"));
		log.info("cafeReview cafeStar:"+cafeStar);
		String cafeReview =CmmUtil.nvl(req.getParameter("cafeReview"));
		log.info("cafeReview cafeReview:"+cafeReview);
		
		//dto저장
		
		ReviewDTO rDTO= new ReviewDTO();
		
		rDTO.setRegNo(userNo);
		rDTO.setMenuName(menuName);
		rDTO.setCafeStar(cafeStar);
		rDTO.setCafeReview(cafeReview);
		//들어갔는지  확인하려면   get으로
		
		log.info("리뷰 nDTO getRegNO"+rDTO.getRegNo());
		log.info("리뷰 nDTO getMenuName"+rDTO.getMenuName());
		log.info("리뷰 nDTO getCafeName"+rDTO.getCafeStar());
		log.info("리뷰 nDTO getCafeReview"+rDTO.getCafeReview());
		
		
		//등록된 정보를 rList 에 저장
		//결과값을 지원하지 않는다 .  DTO 로 받아올수없다 int 나 boolean ? 여기를 바꿔야되는게 맞는데  
		//ajax 로 insert 하고 화면 바로 보여 주려면 DTO 형식이나 list 로 받아와야 될거같은데  
		
		//ReviewDTO rDTO1=reviewService.insertReview(rDTO);
		List<ReviewDTO> rList = reviewService.getReview(rDTO);
		
		log.info("rList 시작:"+rList);
		
		return rList;
		
	}
	
////리뷰 워드클라우드

	
	@RequestMapping (value="/bigData/reviewSearchAns.do",method=RequestMethod.POST)
	public @ResponseBody HashMap<String,Integer> reviewCloud() throws Exception{
		log.info("리뷰 워드클라우드 조회 시작 " +this.getClass());
		
		List<ReviewDTO> rList = new ArrayList<>();
		String str="";
		//공백 제거 단어 저장 리스트
		List<String> rvTrimList = new ArrayList<>();
		//특수문자 제거  저장  정제끝
		List<String> rvSpeList = new ArrayList<>();
/*		//워드 클라우드 들어갈 리스트
		List<Object> rvCloudList = new ArrayList<>();*/
		//단어의 빈도수를 구하기 위해 저장하는 map
		HashMap<String,Integer> hMap= new HashMap<String,Integer>();
		//HashMap<String,String> sMap= new HashMap<String,String>();
		ReviewDTO rDTO= new ReviewDTO();
		rList=reviewService.getReviewText(rDTO);
		
		try {
		
			
			Iterator<ReviewDTO> it = rList.iterator();
			
			while(it.hasNext()) {
				str=it.next().getCafeReview().toString();
				String[] words = str.split("\\s");
				for(String wo : words) {
					rvTrimList.add(wo);
				}
			}
			//단어 추출
				for(int i=0 ; i<rvTrimList.size();i++) {
					str=rvTrimList.get(i);
					//특수문자 제거
						if(!str.matches("[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*")){ 
								//특수문자가 있을 경우
							String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]"; 
							str =str.replaceAll(match, "");
							rvSpeList.add(str);
						}else {
							//특수문자가 없을 경우
							rvSpeList.add(str);
						}
					}
			
				String word="";
				Iterator<String> itTwo = rvSpeList.iterator();
				while(itTwo.hasNext()) {
					//단어 중복 찾는것
					word=itTwo.next().toString();
					if(!hMap.containsKey(word)){
						//단어가 처음일 경우
					hMap.put(word, 0);
					hMap.put(word,hMap.get(word)+1);
				/*	sMap.put("text", word);
					sMap.put("frequency",hMap.get(word).toString());
					rvCloudList.add(sMap);*/
				
					}else {
						hMap.put(word,hMap.get(word)+1);
						/*sMap.put("text", word);
						sMap.put("frequency",hMap.get(word).toString());
						rvCloudList.add(sMap);
			*/
					}
					
				}
				
				
		}catch(Exception e){
			//오류
			System.out.println(e);
			
		}
		
		
/*		  //문서에 없는 단어일 경우
	    if(map.get(word) == null) return 0;
	    return map.get(word);*/
	/*	if(it.next().getCafeReview().matches("[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*")) {
			//특수문자 있을경우
			System.out.println("테스트성공");
		}*/
	
		log.info("리뷰 워드클라우드 조회 끝 " +this.getClass());
		return hMap;
	}

	
	
}




	

