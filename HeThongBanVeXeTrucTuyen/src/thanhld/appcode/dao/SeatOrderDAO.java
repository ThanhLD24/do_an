package thanhld.appcode.dao;

import java.util.List;

import thanhld.appcode.model.SeatOrder;

public interface SeatOrderDAO {
	public List<SeatOrder> getSeatOrderByCondition(String ticketId, int numberOriginPlace, int numberDestinationPlace);
}
