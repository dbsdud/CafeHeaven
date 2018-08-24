package poly.dto;

public class GugunDTO {
	//////////////시도 구군 동 조회 
	private String ctprvnCd;//시도명 코드번호
	private String ctprvnNm;//시도명 코드번호
	private String signguCd;//시군구 코드
	private String signguNm; //시군구명
	private String totalCount;// 개수
	public String getCtprvnNm() {
		return ctprvnNm;
	}
	public void setCtprvnNm(String ctprvnNm) {
		this.ctprvnNm = ctprvnNm;
	}
	public String getSignguCd() {
		return signguCd;
	}
	public void setSignguCd(String signguCd) {
		this.signguCd = signguCd;
	}
	public String getSignguNm() {
		return signguNm;
	}
	public void setSignguNm(String signguNm) {
		this.signguNm = signguNm;
	}
	public String getCtprvnCd() {
		return ctprvnCd;
	}
	public void setCtprvnCd(String ctprvnCd) {
		this.ctprvnCd = ctprvnCd;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	

}
