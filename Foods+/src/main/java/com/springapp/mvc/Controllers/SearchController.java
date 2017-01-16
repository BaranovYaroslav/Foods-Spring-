package com.springapp.mvc.Controllers;

import com.springapp.mvc.CafeDto;
import com.springapp.mvc.DAO.CafeDao;
import com.springapp.mvc.Utils.SearchStrategy;
import com.springapp.mvc.Utils.SimpleSearchStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SearchController {

    private CafeDao cafeDao = new CafeDao();

    private SearchStrategy searchStrategy = new SimpleSearchStrategy();

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    public List<CafeDto> searchCafes( @RequestParam(required = false) int min, @RequestParam(required = false) int max,
                                      @RequestParam(required = false) String position,
                                      @RequestParam(required = false) boolean meat,
                                      @RequestParam(required = false) boolean vegetarian,
                                      @RequestParam(required = false) boolean cakes){
        return searchStrategy.search(min, max, position, meat, vegetarian, cakes);
    }

}
