package web.service.face;

import java.util.List;

import web.dto.BookListInfo;
import web.dto.SellerInfo;
import web.dto.SellerLoc;

public interface SellerService {

	// 판매자 로그인
	public boolean login(SellerInfo sellerInfo);

	// 판매자 정보 가져오기
	public SellerInfo getSellerInfo(String sellerId);

	// 판매자(sellerId) 판매정보 가져오기
	public SellerLoc getSellerLoc(String sellerId);

	// sellerId의 판매부수 가져오기
	public List<BookListInfo> getBookList(String sellerId);

	// bookListInfo의 magazineNo로 판매 호수, 판매 부수 수정
	public void setMegazine(BookListInfo bookListInfo);

	// bookListInfo의 magazineNo로 판매 호수, 판매 부수 삭제
	public void deleteMegazine(int magazineNo);

	// 판매할 빅이슈 추가
	public void putMegazine(BookListInfo bookListInfo);

	// 오픈, 마감시간 변경
	public void setSellerTime(SellerLoc sellerLoc);

}
