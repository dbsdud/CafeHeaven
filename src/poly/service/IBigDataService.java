package poly.service;

import java.util.List;

import poly.dto.DongDTO;
import poly.dto.GugunDTO;
import poly.dto.SidoDTO;

public interface IBigDataService {
		//시 도 등록
		public int insertSido(SidoDTO sidoDTO) throws Exception;
		public List<SidoDTO> getSidoList() throws Exception;
		public int insertGugun(GugunDTO gugunDTO) throws Exception;
		public List<GugunDTO> getGugunList() throws Exception;
		public int insertDong(DongDTO dongDTO) throws Exception;
	
}
