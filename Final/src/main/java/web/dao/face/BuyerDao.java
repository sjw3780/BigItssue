package web.dao.face;

import java.util.List;

import web.dto.BookListInfo;
import web.dto.BuyerInfo;
import web.dto.SellerLoc;
import web.dto.User;
import web.util.SellerLocPaging;

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
	
	//buyerId로 Buyer정보 검색(반환User)
	public User selectBuyerInfoByBuyerId(BuyerInfo buyerInfo);
	
	//-----SellerLoc-----
	//판매처 총 게시글 수 반환
	public int selectCntOfSellerLoc();
	
	//판매처 페이징 리스트 얻기
	public List selectPaginglistOfSellerLoc(SellerLocPaging paging);
	
	public SellerLoc selectSellerLoc(int sellerLoc);
	
	public BookListInfo selectBookListInfo(int magazineNo);
	
}
