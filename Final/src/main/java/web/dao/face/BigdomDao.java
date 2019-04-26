package web.dao.face;

import web.dto.BigdomInfo;
import web.dto.User;

public interface BigdomDao {

	// 로그인 정보 조회
	public int selectCntLogin(BigdomInfo bigdomInfo);
	
	public User selectBigdomInfoUser(BigdomInfo bigdomInfo);
}
