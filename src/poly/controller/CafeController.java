package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CafeController {
	private Logger log = Logger.getLogger(this.getClass());

	
	//카페정보
	@RequestMapping(value="cafe/cafeInfo")
	public String cafeInfo() {
		return "/cafe/cafeInfo";
	}
	
	
	
	
	//카페관리
	@RequestMapping(value="cafe/cafeInfoManage")
	public String cafeInfoManage() {
		return "/cafe/cafeInfoManage";
	}
	
}
