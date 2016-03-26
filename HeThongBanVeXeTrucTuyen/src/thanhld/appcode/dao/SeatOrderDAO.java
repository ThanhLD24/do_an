package thanhld.appcode.dao;

import java.util.List;

import thanhld.appcode.model.SeatOrder;

public interface SeatOrderDAO {
	public List<SeatOrder> getSeatOrderByCondition(int ticketId, int numberOriginPlace, int numberDestinationPlace);
}
