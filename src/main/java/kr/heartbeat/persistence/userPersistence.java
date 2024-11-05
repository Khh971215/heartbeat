package kr.heartbeat.persistence;

import kr.heartbeat.vo.UserVO;

public interface userPersistence {
	
	public UserVO login(UserVO uservo);
}
