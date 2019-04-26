package web.service.face;

import web.dto.BigdomInfo;
import web.dto.User;

public interface BigdomService {
	// 빅돔 로그인
	public boolean login(BigdomInfo bigdomInfo);
	
	public User getBigdomInfoUser(BigdomInfo bigdomInfo);
}
