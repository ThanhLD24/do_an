package thanhld.appcode.dao;

import java.util.List;

import thanhld.appcode.model.OrderTicket;
import thanhld.appcode.valueobject.JsonObjectVO;

public interface OrderTicketDAO {
	public List<OrderTicket> getListOrderTicketDESC();
	public OrderTicket getOrderTicketByCondition(String orderTicketId, String info);
	public int getTotalOrderTicketInMonthOfYear(int month, int year);
	public int getTotalOrderTicketPaidedInMonthOfYear(int month, int year);
	public int getTotalOrderTicketReturnInMonthOfYear(int month, int year);
	public int getTotalOrderTicketUnPaidInMonthOfYear(int month, int year);
	public List<Object> countRouteOrder(String year);
	public List<Object> getTotalMoneyByYear(String year);
	public List<Object> getTotalMoneyByYearTicketRefund(String year);
}
