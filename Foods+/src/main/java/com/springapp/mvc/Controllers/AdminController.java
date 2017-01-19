package com.springapp.mvc.Controllers;

import com.springapp.mvc.Cafe;
import com.springapp.mvc.CafeDto;
import com.springapp.mvc.DAO.CafeDao;
import com.springapp.mvc.Utils.LoginUtils;

import org.apache.logging.log4j.LogManager;

import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.jms.support.JmsUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.jms.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private CafeDao cafeDao;

    @Autowired
    private JmsTemplate jmsTemplate;

    private static Logger logger = LogManager.getLogger(AdminController.class);

    @RequestMapping(value = "/admin/new/save")
    public String saveCafe(@ModelAttribute("cafeDto") CafeDto cafeDto){
        Cafe cafe = new Cafe(cafeDto);
        cafeDao.add(cafe);
        return "redirect:/admin";
    }

    @RequestMapping(value = "admin/remove/{name}", method = RequestMethod.DELETE)
    @ResponseBody
    public List<CafeDto> deleteCafe(@PathVariable("name") String name){

        List<CafeDto> cafeDTOList = new ArrayList<CafeDto>();
        Cafe cafeToDelete = null;

        for(Cafe cafe: cafeDao.getALl()){
            if(cafe.getName().equals(name)){
                cafeToDelete = cafe;
            }
        }

        cafeDao.delete(cafeToDelete);

        for(Cafe cafe: cafeDao.getALl()){
            cafeDTOList.add(new CafeDto(cafe));
        }

        return cafeDTOList;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        logger.info("In send method");
        jmsTemplate.send(new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                return session.createTextMessage("Obtain request for login as admin");
            }
        });
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
