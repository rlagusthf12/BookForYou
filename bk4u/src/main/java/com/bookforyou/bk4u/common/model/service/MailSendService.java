package com.bookforyou.bk4u.common.model.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.MailUtils;

@Service("mss")
public class MailSendService {
	
	@Autowired
    private JavaMailSenderImpl mailSender;
	
	private int size;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
            .append("<a href='http://localhost:8888/bk4u/sign-up-confirm.me?email=")
            .append(email)
            .append("&authKey=")
            .append(authKey)
            .append("' target='_blenk'>이메일 인증 확인</a>")
            .toString());
            sendMail.setFrom("officialbookforyou@gmail.com", "BK4U");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

          return authKey;
    }
    
    // 이메일로 아이디 보내기
    public void sendIdFindMail(String id,String email) {

        //인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("BK4U 아이디 확인");
            sendMail.setText(new StringBuffer().append("<h1>[BK4U 아이디 확인 메일]</h1>")
            .append("<p>회원님의 아이디는 다음과 같습니다.</p>")
            .append("<p><b>")
            .append(id)
            .append("</b></p>")
            .append("<br>")
            .toString());
            sendMail.setFrom("officialbookforyou@gmail.com", "BK4U");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

    }
    
    //이메일로 임시 비밀번호 보내기
    public void sendNewPasswordMail(String tempPassword, String email) {
    	//인증메일 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("BK4U 임시비밀번호 발급");
            sendMail.setText(new StringBuffer().append("<h1>[BK4U 아이디 확인 메일]</h1>")
            .append("<p>회원님의 임시비밀번호는 다음과 같습니다.</p>")
            .append("<p><b>")
            .append(tempPassword)
            .append("</b></p>")
            .append("<br>")
            .toString());
            sendMail.setFrom("officialbookforyou@gmail.com", "BK4U");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
    
}
