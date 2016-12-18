package com.springapp.mvc.Controllers;

import com.springapp.mvc.Cafe;
import com.springapp.mvc.CafeDto;
import com.springapp.mvc.DAO.CafeDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping(value = "/admin/new/save")
    public String saveCafe(@ModelAttribute("cafeDto") CafeDto cafeDto){
        CafeDao cafeDao = new CafeDao();
        Cafe cafe = new Cafe(cafeDto);
        cafeDao.add(cafe);
        try {
            throw new Exception("zzz" + cafeDto.getMiddleCost());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin";
    }

}
