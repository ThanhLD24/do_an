package thanhld.appcode.dao;

import java.util.List;

import thanhld.appcode.model.OrderTicket;

public interface OrderTicketDAO {
	public List<OrderTicket> getListOrderTicketDESC();
	public OrderTicket getOrderTicketByCondition(String orderTicketId, String info);
}
