package thanhld.appcode.dao;

import thanhld.appcode.model.TicketDetail;

public interface TicketDetailDAO {
	public TicketDetail getTicketDetailByTicketId(String ticketId, int provinceId);
}
