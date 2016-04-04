package thanhld.appcode.dao;

import java.util.List;

import thanhld.appcode.model.RouteDetail;

public interface RouteDetailDAO  {
	public int getNumberOrderByCondition(int routeId, int provinceId);
	public List<RouteDetail> getListRouteDetailByRouteId(int routeId);
	public RouteDetail getRouteDetailWithNumberOrder(int routeId, int numberOrder);

}
