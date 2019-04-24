package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.BuyerInfo;
import web.service.face.BuyerService;

@Controller
public class BuyerController {
	
	@RequestMapping(value="/buyer/main", method=RequestMethod.GET)

	public void buyerMain() { }
	
	
@Autowired BuyerService buyerService;
	
	
	@RequestMapping(value="/buyer/join", method=RequestMethod.GET)
	public void mailform() {
		
	}
	
	
	
	@RequestMapping(value="/buyer/mailsender", method=RequestMethod.POST)
	public String mailsender(HttpServletRequest request, Model model, String email, HttpSession sess) {
		
		String code = UUID.randomUUID().toString().split("-")[0];
		
		Map map = new HashMap();
		map.put("emailCode", code);
//		
		model.addAllAttributes(map);

		
		String subject = "가입인증 메일입니다 "; //메일 제목 입력해주세요. 
		String frontBody = "인증코드란에 "; //앞단
		String middleBody = code;
		String endBody = "를 써주세요"; //뒷단
		String body = frontBody+middleBody+endBody;
		
		
		buyerService.mailSender(email, subject, body);
		
		
		
		
		return "jsonView";
		
	}
	
	
	@RequestMapping(value="/buyer/useeamil", method=RequestMethod.POST)
	public String useEamil(String email, Model model) {
		
		System.out.println("넘어온 이메일"+email);
		
		int emailCnt = buyerService.eamilSerch(email);
		
		
		model.addAttribute("emailCnt", emailCnt);
		return "jsonView";
	}
	
	@RequestMapping(value="/mail/code", method=RequestMethod.GET)
	public void emailcode() {
		
	}
	
	
	@RequestMapping("/buyer/useid")
	public String useid(Model model, BuyerInfo bi) {
		
		boolean id = buyerService.haveId(bi);
		
		
		Map map = new HashMap();
		if(id) {
			map.put("haveId", true);
		}else {
			map.put("haveId", false);
			
		}
		
		model.addAllAttributes(map);
		
		return "jsonView";
	}
		
		//회원가입
	@RequestMapping(value="/buyer/join", method=RequestMethod.POST)
	public String buyerJoin(BuyerInfo buyerInfo) {
		
		System.out.println(buyerInfo.toString());
		
		buyerService.buyerJoin(buyerInfo);
		
		return "redirect:/buyer/login";
	}
	
	
	@RequestMapping(value="/buyer/login", method=RequestMethod.GET)
	public void buyerLoginForm() {
		
	}
	
	@RequestMapping(value="/buyer/login", method=RequestMethod.POST)
	public String buyerLogin(BuyerInfo buyerInfo, HttpSession session) {
		
		boolean user = buyerService.buyerLogin(buyerInfo);
		
		System.out.println(buyerInfo.getBuyerId());
		
		if(user) {
			session.setAttribute("haveBuyerId", true);
			session.setAttribute("buyerId", buyerInfo.getBuyerId());
			return "redirect:/buyer/login";
		}
		session.setAttribute("haveBuyerId", false);
		return "redirect:/buyer/login";
		
		
	}
	
	@RequestMapping(value="/buyer/logout", method=RequestMethod.GET)
	public String buyerLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/buyer/login";
	}
	
	
	
	//아이디찾기
	@RequestMapping(value="/buyer/findid", method=RequestMethod.GET)
	public void buyerFindIdForm() {
		
	}
	
	@RequestMapping(value="/buyer/findid", method=RequestMethod.POST)
	public void buyerFindId(BuyerInfo buyerInfo, Model model, HttpServletResponse res) throws IOException {
		
		
		PrintWriter out = null;
		res.setContentType("text/html; charset=UTF-8");
		out = res.getWriter();

		
		//들어온 정보로 값 비교하기
		BuyerInfo bi = buyerService.buyerFindId(buyerInfo);
		
		int cnt = buyerService.buyerCnt(buyerInfo);
		
		System.out.println("받아온값"+buyerInfo.getBuyerName());
//		System.out.println(bi.toString());
//		System.out.println("조회한값"+bi.getBuyerName());
		
		if(cnt == 1) {
			//있으면 메일 발송 메시지 반환
			String subject = "아이디 찾기 결과입니다."; //메일 제목 입력해주세요. 
			String frontBody = "회원님의 아이디는"; //앞단
			String middleBody = bi.getBuyerId();
			String endBody = "입니다."; //뒷단
			String email = bi.getBuyerEmail();
			
			String body = frontBody+middleBody+endBody;
			
			buyerService.mailSender(email, subject, body);
//			model.addAttribute("msg","메일을 발송하였습니다");
//			model.addAttribute("url","/buyer/findid");
			out.println("<script>alert('회원님의 아이디를 메일로 발송하였습니다'); location.href='/buyer/login'</script>" );
					
			out.flush();
			
		}else {
			
			out.println("<script>alert('다시 확인해주세요'); location.href='/buyer/findid'</script>" );
			
			out.flush();
	
		
		}
	}
	
	
	
	
	
	//비밀번호찾기
	
	
	@RequestMapping(value="/buyer/findpw", method=RequestMethod.GET)
	public void buyerFindPwForm() {
		
	}
	
	@RequestMapping(value="/buyer/findpw", method=RequestMethod.POST)
	public void buyerFindPw(BuyerInfo buyerInfo, HttpServletResponse res) throws IOException {
		

		
		PrintWriter out = null;
		res.setContentType("text/html; charset=UTF-8");
		out = res.getWriter();

		
		//들어온 정보로 값 비교하기
		BuyerInfo bi = buyerService.buyerFindInfo(buyerInfo);
		
		//정보 3개로 조회
		int cnt = buyerService.buyerFindCnt(buyerInfo);
		
		System.out.println("받아온값"+buyerInfo.getBuyerName());
//		System.out.println(bi.toString());
//		System.out.println("조회한값"+bi.getBuyerName());
		
		if(cnt == 1) {
			//1. 있다면 비밀번호 변경	
			String newPw = UUID.randomUUID().toString().split("-")[0];
			
			buyerInfo.setBuyerPw(newPw);
			
			buyerService.pwUpdate(buyerInfo);
			
			//2. 메일 변경된 비밀번호를 메일로 발송 후메시지 반환
			String subject = "회원님의 비밀번호가 변경되었습니다."; //메일 제목 입력해주세요. 
			String frontBody = "회원님의 비밀번호는"; //앞단
			String middleBody = newPw;
			String endBody = "입니다. 로그인 후 비밀번호를 변경해주세요."; //뒷단
			String email = bi.getBuyerEmail();
			
			String body = frontBody+middleBody+endBody;
			
			buyerService.mailSender(email, subject, body);
//			model.addAttribute("msg","메일을 발송하였습니다");
//			model.addAttribute("url","/buyer/findid");
			out.println("<script>alert('변경된 회원님의 비밀번호를 메일로 발송하였습니다'); location.href='/buyer/login'</script>" );
					
			out.flush();
			
		}else {
			
			out.println("<script>alert('다시 확인해주세요'); location.href='/buyer/findpw'</script>" );
			
			out.flush();
	
		
		}
		
	}
	
	
	
	

}
