package web.dao.face;

import java.util.List;

import web.dto.BookListInfo;
import web.dto.SellerInfo;
import web.dto.SellerLoc;

public interface SellerDao {

	// 로그인 정보 조회
	public int selectCntLogin(SellerInfo sellerInfo);

	// 판매자 정보 조회
	public SellerInfo selectSellerInfo(String sellerId);

	// 판매자(sellerId) 판매정보 조회
	public SellerLoc selectSellerLoc(String sellerId);

	// sellerId의 판매부수 조회
	public List<BookListInfo> selectBookList(String sellerId);

	// 판매 호수, 판매 부수 업데이트 쿼리
	public void updateBookList(BookListInfo bookListInfo);

	// 판매 호수, 판매 부수 삭제 쿼리
	public void deleteMegazine(int magazineNo);

	// 판매할 빅이슈 추가 쿼리
	public void insertMegazine(BookListInfo bookListInfo);

	// 오픈 마감시간 업데이트 쿼리
	public void updateSellerTime(SellerLoc sellerLoc);

}
