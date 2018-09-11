package poly.service;

import java.util.List;

import poly.dto.BigCgDTO;
import poly.dto.DongDTO;
import poly.dto.GugunDTO;
import poly.dto.MidCgDTO;
import poly.dto.SidoDTO;
import poly.dto.SmallCgDTO;

public interface IBigDataService {
		//시 도 구군 동읍면 등록
		public int insertSido(SidoDTO sidoDTO) throws Exception;
		public int insertGugun(GugunDTO gugunDTO) throws Exception;
		public int insertDong(DongDTO dongDTO) throws Exception;
		public List<SidoDTO> getSidoList() throws Exception;
		public List<GugunDTO> getGugunList() throws Exception;
		public List<DongDTO> getDongList() throws Exception;
		//시도에 맞는 구군 쿼리
		public List<GugunDTO> getGugunSidoList(String sido) throws Exception;
		//구군에 맞는 동 쿼리
		public List<DongDTO> getDongGugunList(String gugun) throws Exception;
		//대분류 중분류 소분류  디비저장
		public int insertBigCg(BigCgDTO bigCgDTO) throws Exception;
		public int insertMidCg(MidCgDTO midCgDTO) throws Exception;
		public int insertSmallCg(SmallCgDTO smallCgDTO) throws Exception;
		
		//대분류 중분류 코드
		public List<BigCgDTO> getBigCgList() throws Exception;
		public List<MidCgDTO> getMidCgList() throws Exception;
		
		//대분류에 맞는 중분류 
		public List<MidCgDTO> getMidCgBigCgList(String bigCode) throws Exception;
		public List<SmallCgDTO> getSmallCgMidCgList(String midCode) throws Exception;
		//토탈 카운트 저장 시도
		public int updateTotalCount(SidoDTO sDTO) throws Exception;
		//토탈 카운트 저장 구군
		public int updateTotalGugunCount(GugunDTO gDTO) throws Exception;
		//토탈 카운트 저장 동읍면
		public int updateTotalDongCount(DongDTO dDTO) throws Exception;

	
	
}
