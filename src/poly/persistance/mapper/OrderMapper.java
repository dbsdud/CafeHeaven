package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.MenuDTO;
import poly.dto.OrderDTO;
import poly.dto.UserDTO;

@Mapper("OrderMapper")
public interface OrderMapper {
	// 주문 등록
	public int insertOrder(OrderDTO oDTO) throws Exception;
	// orderDirect 메뉴 정보 조회
	public MenuDTO getOrderDirectMenu(MenuDTO mDTO) throws Exception;
	// orderDirect 사용자 정보 조회
	public UserDTO getOrderDirectUser(UserDTO uDTO) throws Exception;
	// 주문목록
	public List<OrderDTO> getOrderList() throws Exception;
	// 주문 목록 메뉴 정보
	public List<MenuDTO> getOrderListMenu() throws Exception;
	// 주문 목록 사용자 정보
	public List<UserDTO> getOrderListUser() throws Exception;
}
