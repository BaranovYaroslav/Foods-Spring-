package com.springapp.mvc.Controllers;


import com.springapp.mvc.Cafe;
import com.springapp.mvc.CafeDto;
import com.springapp.mvc.DAO.CafeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class HelloController {

	@Autowired
	private CafeDao cafeDao;

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		CafeDao cafeDao = new CafeDao();
		return "index";
	}

	@RequestMapping(value = "/cafes", method = RequestMethod.GET)
	public @ResponseBody List<CafeDto> getCafe(){
		List<CafeDto> cafeDTOList = new ArrayList<CafeDto>();
		for(Cafe cafe: cafeDao.getALl()){
			cafeDTOList.add(new CafeDto(cafe));
		}
		return cafeDTOList;
	}

}