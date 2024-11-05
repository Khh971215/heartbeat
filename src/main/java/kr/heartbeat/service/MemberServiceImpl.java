package kr.heartbeat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.heartbeat.persistence.userPersistenceImpl;
import kr.heartbeat.vo.UserVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired // 자동주입 
	private userPersistenceImpl memberDAO;
	
	@Override
	public UserVO login(UserVO uservo) {
		System.out.println("=============서비스 : "+uservo.getEmail());
		return memberDAO.login(uservo);
	}
}
