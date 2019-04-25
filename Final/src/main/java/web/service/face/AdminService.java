package web.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dto.SellerLoc;
import web.util.Paging;

public interface AdminService {


	public int getTotalCount(HashMap doubleString);

	public List<SellerLoc> getPagingList(HashMap map);

	public void adminSellerListDelete(SellerLoc sellerLoc);

	public SellerLoc getSellerInfo(SellerLoc sellerloc);

}
