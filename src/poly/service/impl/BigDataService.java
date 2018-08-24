package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BigCgDTO;
import poly.dto.DongDTO;
import poly.dto.GugunDTO;
import poly.dto.MidCgDTO;
import poly.dto.SidoDTO;
import poly.dto.SmallCgDTO;
import poly.persistance.mapper.BigDataMapper;
import poly.service.IBigDataService;

@Service("BigDataService")
public class BigDataService implements IBigDataService {

	//insert 는 공공api를 디비에 저장 
	//get select 는 화면에 뿌려줌
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

	//시도에 맞는 구군 찾는 메소드
	@Override
	public List<GugunDTO> getGugunSidoList(String sido) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getGugunSidoList(sido);
	}

	@Override
	public List<DongDTO> getDongGugunList(String gugun) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getDongGugunList(gugun);
	}

	@Override
	public int insertBigCg(BigCgDTO bigCgDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.insertBigCg(bigCgDTO);
	}

	@Override
	public int insertMidCg(MidCgDTO midCgDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.insertMidCg(midCgDTO);
	}

	@Override
	public int insertSmallCg(SmallCgDTO smallCgDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.insertSmallCg(smallCgDTO);
	}
//대분류코드
	@Override
	public List<BigCgDTO> getBigCgList() throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getBigCgList();
	}

	@Override
	public List<MidCgDTO> getMidCgList() throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getMidCgList();
	}

	@Override
	public List<MidCgDTO> getMidCgBigCgList(String bigCode) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getMidCgBigCgList(bigCode);
	}

	@Override
	public List<SmallCgDTO> getSmallCgMidCgList(String midCode) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getSmallCgMidCgList(midCode);
	}
//토탈카운트 시도카페개수 저장 db
	@Override
	public int updateTotalCount(SidoDTO sDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.updateTotalCount(sDTO);
	}
	//토탈카운트 구군카페개수 저장 db
	@Override
	public int updateTotalGugunCount(GugunDTO gDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.updateTotalGugunCount(gDTO);
	}

	@Override
	public int updateTotalDongCount(DongDTO dDTO) throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.updateTotalDongCount(dDTO);
	}

	@Override
	public List<DongDTO> getDongList() throws Exception {
		// TODO Auto-generated method stub
		return bigDataMapper.getDongList();
	}



}

	
		

