package poly.service;

import java.util.List;

import poly.dto.MenuDTO;
import poly.dto.OrderInfoDTO;
import poly.dto.UserDTO;

public interface IOrderService {
	// 주문 등록
	public int insertOrder(OrderInfoDTO oDTO) throws Exception;
	// orderDirect 메뉴 정보
	public MenuDTO getOrderDirectMenu(MenuDTO mDTO) throws Exception;
	// orderDirect 사용자 정보
	public UserDTO getOrderDirectUser(UserDTO uDTO) throws Exception;
	// 주문 목록 조회
	public List<OrderInfoDTO> getOrderList() throws Exception;
	// 주문 목록 메뉴 정보
	public List<MenuDTO> getOrderListMenu(MenuDTO mDTO) throws Exception;
	// 주문 목록 사용자 정보
	public List<UserDTO> getOrderListUser(UserDTO uDTO) throws Exception;
	
}
