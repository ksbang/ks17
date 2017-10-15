package com.goku.ks.myPage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goku.ks.scrap.AbroadScrapService;
import com.goku.ks.scrap.Criteria;
import com.goku.ks.scrap.DemesticScrap;
import com.goku.ks.scrap.DemesticScrapService;
import com.goku.ks.scrap.GETAbroadScrap;
import com.goku.ks.scrap.GETDemesticScrap;
import com.goku.ks.scrap.PageMaker;
import com.goku.ks.user.User;
import com.goku.ks.user.UserService;



@Controller
public class MyPageController {
	
	@Inject
    private UserService userService; 
	
	@Inject
	private DemesticScrapService demScrapService;
	
	@Inject
	private AbroadScrapService abrScrapService;
	
	// 마이페이지 수정경로
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(HttpSession session){
		String email = (String)((Map<String, Object>) session.getAttribute("login")).get("USER_EMAIL");
		System.out.println("mypage.email : " + email);
		return "myPage/myPage";
		
	}
	
	// 마이페이지 유저 스크랩 경로
	@RequestMapping(value = "/manageMyBoard", method = RequestMethod.GET)
	public String manageMyBoard(HttpSession session, Model model, Criteria cri) throws Exception{
		String email = (String)((Map<String, Object>) session.getAttribute("login")).get("USER_EMAIL");
		List<GETDemesticScrap> demScrapList = new ArrayList<GETDemesticScrap>();
		List<GETAbroadScrap> abrScrapList = new ArrayList<GETAbroadScrap>();
		
		demScrapList = demScrapService.demScrapList(email);
		abrScrapList = abrScrapService.abrScrapList(email);
		int idxCount = 0;
		for(int i = 0; i <demScrapList.size(); i++)
		{
			if(idxCount%10 == 0)
			{
				idxCount = 0;
			}
			String imgsrc = "../../../resources/img/news/" + idxCount + ".jpg";
			idxCount = idxCount + 1;
			demScrapList.get(i).setDOMESTIC_SCRAP_IMGSRC(imgsrc);
		}
		model.addAttribute("demScrapList", demScrapList);
		model.addAttribute("abrScrapList",abrScrapList);
		return "myPage/manageMyBoard";
		
	}
	
	// 마이페이지 유저 정보 수정 경로
	@RequestMapping(value = "/manageMyInfo", method = RequestMethod.GET)
	public String manageMyInfo(HttpSession session, Model model) throws Exception{
		String email = (String)((Map<String, Object>) session.getAttribute("login")).get("USER_EMAIL");
		String nickName = userService.getUserNickName(email);
		
		model.addAttribute("nickName", nickName);
		
		return "myPage/manageMyInfo";
		
	}
	
	// 마이페이지 유저 정보 수정 경로
		@RequestMapping(value = "/changeNickName", method = RequestMethod.POST)
		@ResponseBody
		public String changePassword(@ModelAttribute User user, HttpSession session) throws Exception{
			User userInfo = new User();
			String email = (String)((Map<String, Object>) session.getAttribute("login")).get("USER_EMAIL");
			userInfo.setUSER_EMAIL(email);
			String result = "false";
			userService.changeNickName(user);
			result = "true";
			return result;
			
		}
		
		@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
		@ResponseBody
		public String changePassword(@ModelAttribute ChangePassword userInfo, HttpSession session) throws Exception{
			String email = (String)((Map<String, Object>) session.getAttribute("login")).get("USER_EMAIL");
			userInfo.setUSER_EMAIL(email);
			System.out.println(userInfo.toString());
			String result = userService.changePassword(userInfo);
			return result;
			
		}
	
}
