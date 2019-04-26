package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.dto.SellerLoc;

public interface AdminDao {

	public int getTotalCount(HashMap doubleString);

	public List<SellerLoc> getPagingList(HashMap map);

	public void adminSellerListDelete(SellerLoc sellerLoc);

	public SellerLoc getSellerInfo(SellerLoc sellerloc);
	
	public List<SellerLoc> viewLoc(String zone);

	public List<SellerLoc> viewDetail(String station);
}
