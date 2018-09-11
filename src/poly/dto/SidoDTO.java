package poly.dto;

public class SidoDTO {
	//////////////시도 구군 동 조회 
	private String ctprvnCd;//시도명 코드번호
	private String ctprvnNm;//시도명 
	private String totalCount;// 개수
	public String getCtprvnCd() {
		return ctprvnCd;
	}
	public void setCtprvnCd(String ctprvnCd) {
		this.ctprvnCd = ctprvnCd;
	}
	public String getCtprvnNm() {
		return ctprvnNm;
	}
	public void setCtprvnNm(String ctprvnNm) {
		this.ctprvnNm = ctprvnNm;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

}
