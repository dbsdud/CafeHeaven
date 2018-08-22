package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.DongDTO;
import poly.dto.GugunDTO;
import poly.dto.SidoDTO;
import poly.persistance.mapper.BigDataMapper;
import poly.service.IBigDataService;

@Service("BigDataService")
public class BigDataService implements IBigDataService {
	
	@Resource(name = "BigDataMapper")
	private BigDataMapper bigDataMapper;

	@Override
	public int insertSido(SidoDTO sidoDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.insertSido(sidoDTO);
	}

	@Override
	public List<SidoDTO> getSidoList() throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getSidoList();
	}

	@Override
	public int insertGugun(GugunDTO gugunDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.insertGugun(gugunDTO);
	}

	@Override
	public List<GugunDTO> getGugunList() throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getGugunList();
	}

	@Override
	public int insertDong(DongDTO dongDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.insertDong(dongDTO);
	}

}

	
		

