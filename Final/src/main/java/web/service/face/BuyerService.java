package web.service.face;

import web.dto.BuyerInfo;

public interface BuyerService {
	public boolean haveId(BuyerInfo bi);

	public void buyerJoin(BuyerInfo buyerInfo);

	public boolean buyerLogin(BuyerInfo buyerInfo);

	public void mailSender(String email, String subject, String body);

	public BuyerInfo buyerFindId(BuyerInfo buyerInfo); //정보 2개로 조회 id찾기

	public int buyerCnt(BuyerInfo buyerInfo);//정보 2개로 조회 id찾기 있는지 없는지 COUNT(*)

	public BuyerInfo buyerFindInfo(BuyerInfo buyerInfo); //정보 3개로 조회 비밀번호 찾기

	public int buyerFindCnt(BuyerInfo buyerInfo);//정보 3개로 조회 비밀번호 찾기 있는지 없는지 COUNT(*)

	public void pwUpdate(BuyerInfo buyerInfo);

	public int eamilSerch(String email);
}
