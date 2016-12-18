package com.springapp.mvc.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RedirectController {

    @RequestMapping(value = "/redirectToAdmin", method = RequestMethod.GET)
    public String redirectToAdmin(){
        return "redirect:admin";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin() {
        return "admin";
    }

    @RequestMapping(value = "/admin/newCafe", method = RequestMethod.GET)
    public String redirectToNew(){
        return "redirect:new";
    }

    @RequestMapping(value = "/admin/new", method = RequestMethod.GET)
    public String newCafe(){
        return "new";
    }

}
