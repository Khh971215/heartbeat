package kr.heartbeat.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.heartbeat.vo.UserVO;

@Repository
public class userPersistenceImpl implements userPersistence {
	
	@Inject // root-context.xml에서 스프링에 등록한 SqlSession 빈을 주입한다.
	private SqlSession sql;
	// xxxMapper.xml(SQL문을 저장하는 파일) 파일과 'Mapping 작업'을 한다.
	private static String namespace = "org.member.mappers.member";
	
	@Override
	public UserVO login(UserVO uservo) {
		System.out.println("===========다오 : " +uservo.getEmail());
		return sql.selectOne(namespace+".login", uservo);
	}
}
