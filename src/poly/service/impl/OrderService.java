package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.MenuDTO;
import poly.dto.OrderDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.OrderMapper;
import poly.service.IOrderService;

@Service("OrderService")
public class OrderService implements IOrderService{
	@Resource(name="OrderMapper")
	private OrderMapper orderMapper;
	// 주문등록
	@Override
	public int insertOrder(OrderDTO oDTO) throws Exception {
		return orderMapper.insertOrder(oDTO);
	}
	// 주문목록
	@Override
	public List<OrderDTO> getOrderList() throws Exception {
		return orderMapper.getOrderList();
	}
	// 주문 목록 메뉴 정보
	@Override
	public List<MenuDTO> getOrderListMenu(MenuDTO mDTO) throws Exception {
		return null;
	}
	// 주문 목록 사용자 정보
	@Override
	public List<UserDTO> getOrderListUser(UserDTO uDTO) throws Exception {
		return null;
	}
	//orderDirect 메뉴 정보
	@Override
	public MenuDTO getOrderDirectMenu(MenuDTO mDTO) throws Exception {
		return orderMapper.getOrderDirectMenu(mDTO);
	}
	// orderDirect 사용자 정보
	@Override
	public UserDTO getOrderDirectUser(UserDTO uDTO) throws Exception {
		return orderMapper.getOrderDirectUser(uDTO);
	}
	
	
}
