package poly.dto;

public class DongDTO {
	//////////////시도 구군 동 조회 

	private String signguCd;//시군구 코드
	private String signguNm; //시군구명
	private String adongCd;//행정동 코드
	private String adongNm;// 행정동명
	private String totalCount;// 개수
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
	public String getAdongCd() {
		return adongCd;
	}
	public void setAdongCd(String adongCd) {
		this.adongCd = adongCd;
	}
	public String getAdongNm() {
		return adongNm;
	}
	public void setAdongNm(String adongNm) {
		this.adongNm = adongNm;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	
}
