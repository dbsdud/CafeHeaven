package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.CafeAttachDTO;
import poly.dto.CafeInfoDTO;
import poly.dto.DongDTO;
import poly.dto.GugunDTO;
import poly.dto.SidoDTO;

@Mapper("BigDataMapper")
public interface BigDataMapper {
	
	public int insertSido(SidoDTO sidoDTO) throws Exception;
	public List<SidoDTO> getSidoList() throws Exception;
	public int insertGugun(GugunDTO gugunDTO) throws Exception;
	public List<GugunDTO> getGugunList() throws Exception;
	public int insertDong(DongDTO dongDTO) throws Exception;
}
