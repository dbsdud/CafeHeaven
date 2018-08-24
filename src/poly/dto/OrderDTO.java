package poly.dto;

public class OrderDTO {
	private String ordInfoNo;
	private String ordTotPrice;
	private String ordPayment;
	private String ordDtDate;
	private String ordStat;
	private String usrRcvTime;
	private String rcvTime;
	private String ordCancelYn;
	private String ordCancelTime;
	private String ordTid;
	private String ordReq;
	
	public String getOrdTotPrice() {
		return ordTotPrice;
	}
	public void setOrdTotPrice(String ordTotPrice) {
		this.ordTotPrice = ordTotPrice;
	}
	public String getRcvTime() {
		return rcvTime;
	}
	public void setRcvTime(String rcvTime) {
		this.rcvTime = rcvTime;
	}
	public String getOrderItemNo() {
		return orderItemNo;
	}
	public void setOrderItemNo(String orderItemNo) {
		this.orderItemNo = orderItemNo;
	}
	private String regDate;
	private String regNo;
	private String updDate;
	private String orderItemNo;
	
	public String getOrdInfoNo() {
		return ordInfoNo;
	}
	public void setOrdInfoNo(String ordInfoNo) {
		this.ordInfoNo = ordInfoNo;
	}
	public String getOrdPayment() {
		return ordPayment;
	}
	public void setOrdPayment(String ordPayment) {
		this.ordPayment = ordPayment;
	}
	public String getOrdDtDate() {
		return ordDtDate;
	}
	public void setOrdDtDate(String ordDtDate) {
		this.ordDtDate = ordDtDate;
	}
	public String getOrdStat() {
		return ordStat;
	}
	public void setOrdStat(String ordStat) {
		this.ordStat = ordStat;
	}
	public String getUsrRcvTime() {
		return usrRcvTime;
	}
	public void setUsrRcvTime(String usrRcvTime) {
		this.usrRcvTime = usrRcvTime;
	}
	public String getOrdCancelYn() {
		return ordCancelYn;
	}
	public void setOrdCancelYn(String ordCancelYn) {
		this.ordCancelYn = ordCancelYn;
	}
	public String getOrdCancelTime() {
		return ordCancelTime;
	}
	public void setOrdCancelTime(String ordCancelTime) {
		this.ordCancelTime = ordCancelTime;
	}
	public String getOrdTid() {
		return ordTid;
	}
	public void setOrdTid(String ordTid) {
		this.ordTid = ordTid;
	}
	public String getOrdReq() {
		return ordReq;
	}
	public void setOrdReq(String ordReq) {
		this.ordReq = ordReq;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getUpdNo() {
		return updNo;
	}
	public void setUpdNo(String updNo) {
		this.updNo = updNo;
	}
	private String updNo;
}
