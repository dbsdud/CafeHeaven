package poly.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.MenuDTO;
import poly.dto.OrderInfoDTO;
import poly.dto.OrderItemDTO;
import poly.dto.TotalOrderDTO;
import poly.dto.TotalOrderInfoDTO;
import poly.dto.TotalOrderItemDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.OrderMapper;
import poly.service.IOrderService;

@Service("OrderService")
public class OrderService implements IOrderService{
	@Resource(name="OrderMapper")
	private OrderMapper orderMapper;
	// 주문등록
	@Override
	public int insertOrder(OrderInfoDTO oDTO) throws Exception {
		return orderMapper.insertOrder(oDTO);
	}
	// 주문목록
	@Override
	public List<TotalOrderDTO> getTotalOrderDTO() throws Exception {
		List<TotalOrderInfoDTO> oInfoList = orderMapper.getTotalOrderInfoList();
		List<TotalOrderDTO> totalList = new ArrayList<TotalOrderDTO>();
		for(TotalOrderInfoDTO oDTO : oInfoList) {
			TotalOrderDTO tDTO = new TotalOrderDTO();
			List<TotalOrderItemDTO> tItemList = orderMapper.getTotalOrderItemList(oDTO.getOrdInfoNo());
			String menuName="";
			String ordAmnt = "";
			int price = 0;
			for(int i = 0; i < tItemList.size(); i++) {
				menuName += tItemList.get(i).getMenuName() + "</br>";
				ordAmnt += tItemList.get(i).getOrdAmnt() + "</br>";
				price += Integer.parseInt(tItemList.get(i).getMenuPrice()) * Integer.parseInt(tItemList.get(i).getOrdAmnt());
			}
			tDTO.setOrdInfoNo(oDTO.getOrdInfoNo());
			tDTO.setTotalOrdPrice(oDTO.getOrdTotPrice());
			tDTO.setOrdPayment(oDTO.getOrdPayment());;
			tDTO.setOrdDtDate(oDTO.getOrdDtDate());
			tDTO.setOrdStat(oDTO.getOrdStat());
			tDTO.setUsrRcvTime(oDTO.getUsrRcvTime());
			tDTO.setRcvTime(oDTO.getRcvTime());
			tDTO.setRcvYn(oDTO.getRcvYn());
			tDTO.setOrdCancelYn(oDTO.getOrdCancelYn());
			tDTO.setOrdCancelTime(oDTO.getOrdCancelTime());
			tDTO.setUserName(oDTO.getUserName());
			tDTO.setMenuName(menuName);
			tDTO.setMenuPrice(price + "");
			tDTO.setOrdAmnt(ordAmnt);
			tDTO.setOrdTid(oDTO.getOrdTid());
			// 남은 시간 세팅
			tDTO.setOrdRemainTime(getRemainTime(tDTO.getUsrRcvTime()));
			totalList.add(tDTO);
		}
		return totalList;
	}
	
	public String getRemainTime(String usrRcvTime) throws Exception{
		Calendar c = Calendar.getInstance();
		String tmp = "";
		tmp += String.valueOf(c.get(Calendar.YEAR));
		tmp += "-" + String.valueOf(c.get(Calendar.MONDAY) + 1);
		tmp += "-" + String.valueOf(c.get(Calendar.DATE));
		tmp += " " + usrRcvTime + ":00";
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss", Locale.KOREA);
		String now = sf.format(new Date());
		Date order = sf.parse(tmp);
		Date nowTime = sf.parse(now);
		long duration = order.getTime() - nowTime.getTime();
		long min = duration/60000;
		long hour = min/60;
		min = min-(hour*60);
		return hour + ":" + min;
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
	// 테스트
	@Override
	public int orderProcTest() throws Exception {
		return orderMapper.orderProcTest();
	}
	@Override
	public OrderInfoDTO getOrderNo(String userNo) throws Exception {
		return orderMapper.getOrderNo(userNo);
	}
	@Override
	public List<OrderItemDTO> getOrdItem(OrderItemDTO otDTO) throws Exception {
		return orderMapper.getOrdItem(otDTO);
	}
	
	
	
}
