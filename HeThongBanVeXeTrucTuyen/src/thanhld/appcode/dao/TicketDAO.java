package thanhld.appcode.dao;

import java.util.List;

import thanhld.appcode.model.Ticket;

public interface TicketDAO {
	public List<Ticket> getTicketByCondition(String startPlace, String endPlace, String timeStart) ;
	public List<Ticket> getTicketByConditionOnePath(String startPlace, String endPlace, String timeStart) ;
	public List<Ticket> getListTicket();
}
