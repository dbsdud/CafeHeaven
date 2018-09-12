package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private Logger log = Logger.getLogger(this.getClass());

	//홈
		@RequestMapping(value = "home")
		public String home() {
			return "/home";
		}
	//다시 만드는 탑 
		@RequestMapping(value="basic")
		public String index() {
			return "/basic";
		}
		//네이버 로그인 연동 콜백
		
		@RequestMapping(value="callback")
		public String callback() {
			
			
			return "/callback";
		}
		
		//
			/*	@RequestMapping(value ="new")
				public String newfile() {
					return "/notice/NewFile";
				}*/
		
}
