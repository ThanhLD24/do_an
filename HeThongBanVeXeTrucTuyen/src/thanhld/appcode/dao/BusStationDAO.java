package thanhld.appcode.dao;

import java.util.List;

import thanhld.appcode.model.BusStation;

public interface BusStationDAO {
	public List<BusStation> getListStationByProvince(int province);
}
