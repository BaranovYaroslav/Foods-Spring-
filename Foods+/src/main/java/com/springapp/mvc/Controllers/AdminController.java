package com.springapp.mvc.Controllers;

import com.springapp.mvc.Cafe;
import com.springapp.mvc.CafeDto;
import com.springapp.mvc.DAO.CafeDao;
import com.springapp.mvc.Utils.LoginUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminController {

    @Autowired
    private CafeDao cafeDao;

    @RequestMapping(value = "/admin/new/save")
    public String saveCafe(@ModelAttribute("cafeDto") CafeDto cafeDto){
        Cafe cafe = new Cafe(cafeDto);
        cafeDao.add(cafe);
        try {
            throw new Exception("zzz" + cafeDto.getMiddleCost());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
    private String logout(HttpServletRequest request, HttpServletResponse response){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication != null){
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/redirectToAdmin", method = RequestMethod.GET)
    public String redirectToAdmin(){
        return "redirect:admin";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(ModelMap model) {
        model.addAttribute("user", LoginUtils.getPrincipal());
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
