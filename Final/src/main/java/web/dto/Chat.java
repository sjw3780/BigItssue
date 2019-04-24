package web.dto;

public class Chat { // 채팅내역
	
	private int chatRoomNo; // 채팅방 번호
	private String bigdomId; // 빅돔 아이디
	private String buyerId; // 구매자 아이디
	private String sellerId; // 판매자 아이디
	
	public int getChatRoomNo() {
		return chatRoomNo;
	}
	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	public String getBigdomId() {
		return bigdomId;
	}
	public void setBigdomId(String bigdomId) {
		this.bigdomId = bigdomId;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	
	@Override
	public String toString() {
		return "Chat [chatRoomNo=" + chatRoomNo + ", bigdomId=" + bigdomId + ", buyerId=" + buyerId + ", sellerId="
				+ sellerId + "]";
	}
	
}
