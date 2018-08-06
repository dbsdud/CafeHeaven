package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BigDataController {
	private Logger log = Logger.getLogger(this.getClass());

	
	@RequestMapping(value="bigData/bigData")
	public String bigData() {
		return "/bigData/bigData";
	}
	
}
