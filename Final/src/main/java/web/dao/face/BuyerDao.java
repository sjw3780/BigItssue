package web.dao.face;

import web.dto.BuyerInfo;

public interface BuyerDao {

	public int usingid(BuyerInfo bi);

	public void buyerJoin(BuyerInfo buyerInfo);

	public int buyerLogin(BuyerInfo buyerInfo);

	public BuyerInfo buyerFindId(BuyerInfo buyerInfo);

	public int buyerCnt(BuyerInfo buyerInfo);

	public BuyerInfo buyerFindInfo(BuyerInfo buyerInfo);

	public int buyerFindCnt(BuyerInfo buyerInfo);

	public void pwUpdate(BuyerInfo buyerInfo);

	public int eamilSerch(String email);
}
