package web.service.impl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BuyerDao;
import web.dto.BuyerInfo;
import web.service.face.BuyerService;

@Service
public class BuyerServiceImpl implements BuyerService {
	@Autowired BuyerDao buyerDao;
	
	@Override
	public boolean haveId(BuyerInfo bi) {
		int usingId = 0;
		
		usingId=buyerDao.usingid(bi);
		
		if(usingId==1) {
			return true;
		}
		return false;
	}

	@Override
	public void buyerJoin(BuyerInfo buyerInfo) {

		buyerDao.buyerJoin(buyerInfo);
		
	}

	@Override
	public boolean buyerLogin(BuyerInfo buyerInfo) {
		
		int login =  buyerDao.buyerLogin(buyerInfo);
		if(login == 1) {
			return true;
		}
		
		return false;
	}

	@Override
	public void mailSender(String email, String subject, String body) {

				// 네이버일 경우 smtp.naver.com 을 입력합니다. // Google일 경우 smtp.gmail.com 을 입력합니다. 
				String host = "smtp.naver.com"; 
				final String username = "jhb0205_"; //네이버 아이디를 입력해주세요. @naver.com은 입력하지 마시구요. 
				final String password = "423692jeon^"; //네이버 이메일 비밀번호를 입력해주세요. 
				int port=465; //포트번호 
				
				
				// 메일 내용 
				String recipient = email; //받는 사람의 메일주소를 입력해주세요. 
				
				
				 
				Properties props = System.getProperties(); 
				
				// 정보를 담기 위한 객체 생성 
				// SMTP 서버 정보 설정 
				props.put("mail.smtp.host", host); 
				props.put("mail.smtp.port", port); 
				props.put("mail.smtp.auth", "true"); 
				props.put("mail.smtp.ssl.enable", "true"); 
				props.put("mail.smtp.ssl.trust", host); 
				
				//Session 생성 
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					String un=username; String pw=password; 
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
						return new javax.mail.PasswordAuthentication(un, pw); } }); 
				session.setDebug(true); //for debug 
				
				Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
				try {
					mimeMessage.setFrom(new InternetAddress("jhb0205_@naver.com"));
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));//수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
					
					mimeMessage.setSubject(subject); //제목셋팅 
					
					mimeMessage.setText(body); //내용셋팅 
					
					Transport.send(mimeMessage); 
					//javax.mail.Transport.send() 이용
				} catch (AddressException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 
				//이때는 이메일 풀 주소를 다 작성해주세요. 
		
		
	}

	
	
	@Override
	public BuyerInfo buyerFindId(BuyerInfo buyerInfo) {
		
		return buyerDao.buyerFindId(buyerInfo);
	}

	@Override
	public int buyerCnt(BuyerInfo buyerInfo) {
		// TODO Auto-generated method stub
		return buyerDao.buyerCnt(buyerInfo);
	}

	@Override
	public BuyerInfo buyerFindInfo(BuyerInfo buyerInfo) {
		// TODO Auto-generated method stub
		return buyerDao.buyerFindInfo(buyerInfo);
	}

	@Override
	public int buyerFindCnt(BuyerInfo buyerInfo) {
		// TODO Auto-generated method stub
		return buyerDao.buyerFindCnt(buyerInfo);
	}

	
	//비밀번호 변경
	@Override
	public void pwUpdate(BuyerInfo buyerInfo) {
		buyerDao.pwUpdate(buyerInfo);
		
	}

	@Override
	public int eamilSerch(String email) {
		
		return buyerDao.eamilSerch(email);
	}

}
