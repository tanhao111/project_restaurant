package com.hcmute.controller.user;

import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hcmute.dao.AccountDao;
import com.hcmute.model.AccountModel;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class LoginController{
	AccountDao dao = new AccountDao();
	@RequestMapping(value= {"/dang-nhap","/login"}, method=RequestMethod.GET)
	public String showForm() {
		return "login";	
	}

	@RequestMapping(value= {"/dang-nhap","/login"}, method=RequestMethod.POST)
	public RedirectView login(ModelMap modelMap,HttpServletRequest req) {
		String username = req.getParameter("username");
        String password = req.getParameter("password");
        AccountModel account = dao.getAccount(username,password);
        if(account != null){
            HttpSession session = req.getSession(true);
			session.setAttribute("account",account);
            return new RedirectView("trang-chu");
        }
        else{
        	modelMap.addAttribute("msg", "Tài khoản hoặc mật khẩu không đúng");
			modelMap.addAttribute("type","error");
        	return new RedirectView("login");
        }
	}
}
