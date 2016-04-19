package thanhld.appcode.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.naming.directory.SearchResult;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.mysql.jdbc.Util;

import thanhld.appcode.dao.BusStationDAO;
import thanhld.appcode.dao.BusStationDAOImpl;
import thanhld.appcode.dao.OrderTicketDAO;
import thanhld.appcode.dao.OrderTicketDAOImpl;
import thanhld.appcode.dao.RouteDetailDAO;
import thanhld.appcode.dao.RouteDetailDAOImpl;
import thanhld.appcode.dao.SeatOrderDAO;
import thanhld.appcode.dao.SeatOrderDAOImpl;
import thanhld.appcode.dao.TicketDAO;
import thanhld.appcode.dao.TicketDAOImpl;
import thanhld.appcode.dao.TicketDetailDAO;
import thanhld.appcode.dao.TicketDetailDAOImpl;
import thanhld.appcode.model.Bus;
import thanhld.appcode.model.BusStation;
import thanhld.appcode.model.Carrier;
import thanhld.appcode.model.Feedback;
import thanhld.appcode.model.OrderTicket;
import thanhld.appcode.model.Province;
import thanhld.appcode.model.Route;
import thanhld.appcode.model.RouteDetail;
import thanhld.appcode.model.SeatOrder;
import thanhld.appcode.model.Ticket;
import thanhld.appcode.model.TicketDetail;
import thanhld.appcode.utility.ObjectManager;
import thanhld.appcode.utility.Utility;
import thanhld.appcode.utility.Variables;
import thanhld.appcode.valueobject.TicketVO;

/**
 * Servlet implementation class BusController
 */
@WebServlet("/BusController")
public class BusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BusController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: "
		 * ).append(request.getContextPath());
		 */
		int type = Integer.parseInt(request.getParameter("type"));
		/* System.out.println(type); */
		String jsonString = null;
		HttpSession session = request.getSession(true);
		BusStationDAO busStationDAO = new BusStationDAOImpl();
		RouteDetailDAO routeDetailDAO = new RouteDetailDAOImpl();
		List<List<BusStation>> listOfListBusStation = new ArrayList<>();
		if (type == 0) {
			int id = Integer.parseInt(request.getParameter("id").toString());
			List<BusStation> listBusStation = new ArrayList<BusStation>();
			listBusStation = busStationDAO.getListStationByProvince(id);
			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(listBusStation, new TypeToken<List<BusStation>>() {
			}.getType());
			JsonArray jsonArray = element.getAsJsonArray();
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		if (type == 1) {

			int routeId = Integer.parseInt(request.getParameter("id"));
			List<RouteDetail> listRouteDetail = routeDetailDAO.getListRouteDetailByRouteId(routeId);
			List<String> listString = new ArrayList<String>();
			session.setAttribute("listRouteDetail", listRouteDetail);
			int a = listRouteDetail.size();
			System.out.println(a);
			listString.add(String.valueOf(a));
			jsonString = new Gson().toJson(a);

			/*
			 * List<Route> listRoute = ObjectManager.listObject(Route.class);
			 * jsonString = new Gson().toJson(listRoute);
			 */
			response.setContentType("application/json");
			response.getWriter().write(jsonString);

		}

		if (type == 2) {
			int routeId = Integer.parseInt(request.getParameter("id"));
			List<RouteDetail> listRouteDetail = routeDetailDAO.getListRouteDetailByRouteId(routeId);
			List<Province> listProvince = new ArrayList<Province>();
			for (RouteDetail rd : listRouteDetail) {
				Province p = (Province) ObjectManager.getObjectById(rd.getProvinceId(), Province.class);
				listProvince.add(p);
			}

			/* begin */
			for (RouteDetail rd : listRouteDetail) {
				listOfListBusStation.add(busStationDAO.getListStationByProvince(rd.getProvinceId()));
			}
			session.setAttribute("listOfListBusStation", listOfListBusStation);
			session.setAttribute("listProvince", listProvince);
			/* end */

			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(listProvince, new TypeToken<List<Province>>() {
			}.getType());
			JsonArray jsonArray = element.getAsJsonArray();
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}

		if (type == 3) {
			System.out.println("cb vao day");
			String orginPlace = session.getAttribute("orginPlace").toString();
			String destinationPlace = session.getAttribute("destinationPlace").toString();
			String startDate = session.getAttribute("startDate").toString();

			TicketDAO ticketDAO = new TicketDAOImpl();
			List<Ticket> listTicket = ticketDAO.getTicketByCondition(orginPlace, destinationPlace, startDate);
			List<TicketVO> listTicketVO = new ArrayList<TicketVO>();
			System.out.println("LIST SIZEEEEE" + listTicket.size());
			Bus bus = new Bus();
			TicketDetailDAO ticketDetailDAO = new TicketDetailDAOImpl();
			SeatOrderDAO seatOrderDAO = new SeatOrderDAOImpl();
			for (Ticket ticket : listTicket) {

				bus = (Bus) ObjectManager.getObjectById(ticket.getBusId(), Bus.class);
				Carrier carrier = (Carrier) ObjectManager.getObjectById(bus.getCarrierId(), Carrier.class);
				int numberOriginPlace = routeDetailDAO.getNumberOrderByCondition(ticket.getRouteId(),
						Integer.parseInt(orginPlace));
				int numberDestinationPlace = routeDetailDAO.getNumberOrderByCondition(ticket.getRouteId(),
						Integer.parseInt(destinationPlace));
				// out.print(numberOriginPlace+"----"+numberDestinationPlace);
				ArrayList<Integer> listPrice = Utility.splitPrice(ticket.getTicketPrice());
				int priceTotal = Utility.getPrice(numberOriginPlace, numberDestinationPlace, listPrice);
				String chuoiGheBiDat = Utility.layGheDaDuocDat(seatOrderDAO
						.getSeatOrderByCondition(ticket.getTicketId(), numberOriginPlace, numberDestinationPlace));
				int tongGheDaDat = Utility.layTongSoGheDuocDat(chuoiGheBiDat);
				TicketDetail ticketDetailStart = ticketDetailDAO.getTicketDetailByTicketId(ticket.getTicketId(),
						Integer.parseInt(orginPlace));
				TicketDetail ticketDetailEnd = ticketDetailDAO.getTicketDetailByTicketId(ticket.getTicketId(),
						Integer.parseInt(destinationPlace));
				BusStation busStationOrigin = (BusStation) ObjectManager
						.getObjectById(ticketDetailStart.getBusStationId(), BusStation.class);
				BusStation busStationDestination = (BusStation) ObjectManager
						.getObjectById(ticketDetailEnd.getBusStationId(), BusStation.class);
				String startTimeSs = ticketDetailStart.getDetailTime();
				String startDateSs = ticketDetailStart.getDetailDate();
				String busStationOriginSs = busStationOrigin.getBusStationName();

				TicketVO ticketVO = new TicketVO();
				ticketVO.setTicketId(ticket.getTicketId());
				ticketVO.setBusId(bus.getBusId());
				ticketVO.setBusType(bus.getBusType());
				ticketVO.setCarrierName(carrier.getCarrierName());
				ticketVO.setBusFeature(bus.getBusFeature());
				ticketVO.setStartTime(startTimeSs);
				ticketVO.setStartDate(startDateSs);
				ticketVO.setStartBusStation(busStationOriginSs);
				ticketVO.setEndTime(ticketDetailEnd.getDetailTime());
				ticketVO.setEndDate(ticketDetailEnd.getDetailDate());
				ticketVO.setEndBusStation(busStationDestination.getBusStationName());
				ticketVO.setCountSeat((bus.getBusCapacity() - tongGheDaDat) + "/" + bus.getBusCapacity());
				ticketVO.setPriceTotal(priceTotal);
				ticketVO.setNumberOriginPlace(numberOriginPlace);
				ticketVO.setNumberDestinationPlace(numberDestinationPlace);
				System.out.println(ticketVO.toString());
				listTicketVO.add(ticketVO);

			}
			/* end */

			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(listTicketVO, new TypeToken<List<TicketVO>>() {
			}.getType());
			JsonArray jsonArray = element.getAsJsonArray();
			response.setContentType("application/json");
			response.getWriter().print(jsonArray);
		}
		/*
		 * int specialityId =
		 * Integer.parseInt(request.getParameter("SpecialityId"));
		 * 
		 * ArrayList<Doctor> list = new ArrayList<>(); Doctor d1= new
		 * Doctor("1", "A"); Doctor d2= new Doctor("2", "B"); list.add(d1);
		 * list.add(d2);
		 * 
		 * String doctors = null;
		 * 
		 * doctors = new Gson().toJson(list);
		 * response.setContentType("application/json");
		 * response.getWriter().write(doctors);
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/* doGet(request, response); */

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);

		int type = Integer.parseInt(request.getParameter("type"));
		RequestDispatcher dispatcher = null;
		Ticket ticket = new Ticket();
		Bus bus = new Bus();
		Route route = new Route();
		Carrier carrier = new Carrier();
		TicketDAO ticketDAO = new TicketDAOImpl();
		TicketDetailDAO ticketDetailDAO = new TicketDetailDAOImpl();
		List<Ticket> listTicket = null;
		SeatOrderDAO seatOrderDAO = null;
		String orginPlace = "";
		String destinationPlace = "";
		String startDate = "";
		String listSeat = "";
		String seatCount = "";
		String fullName = "";
		String phoneNumber = "";
		String notes = "";
		String totalMoney = "";
		String sessionShortId = "";
		String ticketId = "";
		String email = "";
		int busId = 0;
		int priceTotal = 0;
		int numberOriginPlace = 0;
		int numberDestinationPlace = 0;
		int totalSeat = 0;
		String check = null;
		switch (type) {
		case Variables.SEARCH_TICKET:
			listTicket = new ArrayList<Ticket>();
			orginPlace = request.getParameter("txtOrgin");
			destinationPlace = request.getParameter("txtDestination");
			startDate = request.getParameter("start_date");

			/* bat dau tim thong minh */
			// neu list ticket tra ve 1 chang = 0 thi tim tat ca cac chang
			listTicket = ticketDAO.getTicketByConditionOnePath(orginPlace, destinationPlace, startDate);
			if (listTicket.size() == 0) {
				listTicket = ticketDAO.getTicketByCondition(orginPlace, destinationPlace, startDate);
			}
			/* request.setAttribute("listTicket", listTicket); */
			session.setAttribute("orginPlace", orginPlace);
			session.setAttribute("destinationPlace", destinationPlace);
			session.setAttribute("startDate", startDate);
			session.setAttribute("listTicket", listTicket);
			dispatcher = request.getRequestDispatcher("/searchresult");
			dispatcher.forward(request, response);
			break;
		/*
		 * response.sendRedirect(request.getContextPath() + "/searchresult");
		 */
		case Variables.SELECT_BUS:
			ticketId = request.getParameter("txtTicketId");
			busId = Integer.parseInt(request.getParameter("txtBusId"));
			priceTotal = Integer.parseInt(request.getParameter("txtPrice"));
			numberOriginPlace = Integer.parseInt(request.getParameter("txtNumberOriginPlace"));
			numberDestinationPlace = Integer.parseInt(request.getParameter("txtNumberDestinationPlace"));
			ticket = (Ticket) ObjectManager.getObjectById(ticketId, Ticket.class);
			String ticketTax = ticket.getTicketTax();
			String ticketSale = ticket.getTicketSale();
			bus = (Bus) ObjectManager.getObjectById(busId, Bus.class);
			route = (Route) ObjectManager.getObjectById(ticket.getRouteId(), Route.class);
			carrier = (Carrier) ObjectManager.getObjectById(bus.getCarrierId(), Carrier.class);
			session.setAttribute("ticketId", ticketId);
			session.setAttribute("busId", busId);
			session.setAttribute("numberOriginPlace", numberOriginPlace);
			session.setAttribute("numberDestinationPlace", numberDestinationPlace);
			session.setAttribute("priceTotal", priceTotal);
			session.setAttribute("ticket", ticket);
			session.setAttribute("ticketTax", ticketTax);
			session.setAttribute("ticketSale", ticketSale);
			session.setAttribute("bus", bus);
			session.setAttribute("route", route);
			session.setAttribute("carrier", carrier);

			session.setAttribute("startTimeSession", request.getParameter("startTimeSession"));
			session.setAttribute("startDateSession", request.getParameter("startDateSession"));
			session.setAttribute("busStationSession", request.getParameter("busStationSession"));
			dispatcher = request.getRequestDispatcher("/selectseat");
			dispatcher.forward(request, response);
			break;
		case Variables.SELECT_SEAT:
			listSeat = request.getParameter("txtListSeat");
			totalMoney = request.getParameter("txtTotalMoney");
			seatCount = request.getParameter("txtSeatCount");

			session.setAttribute("listSeat", listSeat);// co van de khi back tu
														// man hinh INFO ve MH
														// chon ghe -> listGhe
														// se tiep tuc append
														// them, ma k bi mat
			session.setAttribute("listSeatTachDeHienThi", Utility.replaceString2(listSeat));
			session.setAttribute("totalMoney", totalMoney);
			session.setAttribute("seatCount", seatCount);

			dispatcher = request.getRequestDispatcher("/info");
			dispatcher.forward(request, response);
			break;
		case Variables.INFO:
			String pageForward = "";
			fullName = request.getParameter("txtHoTen");
			phoneNumber = request.getParameter("txtSdt");
			email = request.getParameter("txtEmail"); // dung de gui email ve
														// hop thu khach
			notes = request.getParameter("txtGhiChu");
			ticketId = session.getAttribute("ticketId").toString();
			numberOriginPlace = Integer.parseInt(session.getAttribute("numberOriginPlace").toString());
			numberDestinationPlace = Integer.parseInt(session.getAttribute("numberDestinationPlace").toString());
			int seatCountInt = Integer.parseInt(session.getAttribute("seatCount").toString());

			/*
			 * check xem nguoi dat ghe co trung k | trong truong hop nhieu ng
			 * dat cung 1 luc
			 */
			boolean checkSeat = false;
			seatOrderDAO = new SeatOrderDAOImpl();
			String listSeatOrder = session.getAttribute("listSeat").toString();
			List<String> pListSeatOrder = Utility.phanChuoiGheThanhMang(listSeatOrder);
			List<String> pListSO = new ArrayList<String>();
			List<SeatOrder> listSO = seatOrderDAO.getSeatOrderByCondition(ticketId, numberOriginPlace,
					numberDestinationPlace);
			for (SeatOrder so : listSO) {
				for (String ghe : Utility.phanChuoiGheThanhMang(so.getSeat())) {
					pListSO.add(ghe);
				}
			}

			for (int i = 0; i < pListSeatOrder.size(); i++) {
				for (int j = 0; j < pListSO.size(); j++) {
					if ((pListSeatOrder.get(i)).equals(pListSO.get(j))) {
						checkSeat = true;
						break;
					}
				}
			}
			/* end ham check */

			if (!checkSeat) {
				TicketDetail ticketDetail = ticketDetailDAO.getTicketDetailByTicketId(ticketId);
				sessionShortId = session.getId().substring(0, 6);

				OrderTicket orderTicket = new OrderTicket();
				orderTicket.setOrderTicketId(sessionShortId);
				orderTicket.setTicketId(ticketId);
				orderTicket.setPassengerNameTitle("");
				orderTicket.setPassengerName(fullName);
				orderTicket.setPassengerEmail(email);
				orderTicket.setPassengerAddress("");
				orderTicket.setPassengerGender("");
				orderTicket.setPassengerPhone(phoneNumber);
				orderTicket.setOrderTicketSeat(session.getAttribute("listSeat").toString());
				orderTicket.setOrderTicketTotalSeat(Integer.parseInt(session.getAttribute("seatCount").toString()));
				orderTicket.setOrderTicketTotalPrice(session.getAttribute("totalMoney").toString());
				orderTicket.setOrderTicketTime(Utility.getDateTimeNow());
				orderTicket
						.setOrderTicketExpiredTime(ticketDetail.getDetailDate() + " " + ticketDetail.getDetailTime());
				orderTicket.setOrderTicketPaidDate(""); // hien tai dang set
														// cung
														// ngay thanh toan = ""
				orderTicket.setOrderTicketStatus(true);
				orderTicket.setOrderTicketOther(notes);

				try {
					ObjectManager.addObject((Object) orderTicket);
					session.setAttribute("orderTicket", orderTicket);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					pageForward = "/error_book";
					e.printStackTrace();
				}

				SeatOrder seatOrder = new SeatOrder();
				seatOrder.setTicketId(ticketId);
				seatOrder.setOrderTicketId(sessionShortId);
				seatOrder.setSeat(listSeatOrder);
				seatOrder.setRoutes(Utility.phanChangDuong(numberOriginPlace, numberDestinationPlace));
				/*
				 * ticket = (Ticket) session.getAttribute("ticket");
				 * ticket.setTicketCount(ticket.getTicketCount() -
				 * seatCountInt);
				 */ // tam thoi de ticket count = ""
				try {
					ObjectManager.addObject(seatOrder);
					request.changeSessionId();
					pageForward = "/confirm";
					/* ObjectManager.update(ticket); */
				} catch (Exception e) {
					pageForward = "/error_book";

					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("seat_message", Variables.SEAT_SUCCESS);
			} else {
				request.setAttribute("seat_message", Variables.SEAT_FAIL);
				pageForward = "/confirm";

			}

			dispatcher = request.getRequestDispatcher(pageForward);
			dispatcher.forward(request, response);
			break;
		case Variables.FEEBBACK:
			check = "fail";
			String title = request.getParameter("title");
			String name = request.getParameter("name");
			email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String comment = request.getParameter("comment");
			Feedback feedback = new Feedback(title, comment, name, email, phone);
			try {
				ObjectManager.addObject(feedback);
				check = "success";
				/* out.print("<h2>Thanh cong</h2>"); */
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				check = "fail";
			}
			request.setAttribute("check", check);
			dispatcher = request.getRequestDispatcher("/feedback");
			dispatcher.forward(request, response);
			break;
		case Variables.CHECK_ORDER:
			check = "fail";
			OrderTicket orderTicket = null;
			SeatOrder seatOrder = null;
			List<String> infoOrderTicket = new ArrayList<String>();
			OrderTicketDAO orderDAO = new OrderTicketDAOImpl();
			RouteDetailDAO routeDetailDAO = new RouteDetailDAOImpl();
			TicketDetailDAO ticketDetailDAO1 = new TicketDetailDAOImpl();
			seatOrderDAO = new SeatOrderDAOImpl();
			try {
				orderTicket = orderDAO.getOrderTicketByCondition(request.getParameter("txtOrderTicketId").toString(),
						request.getParameter("txtInfo").toString());
				seatOrder = seatOrderDAO.getSeatOrderByOrderTicket(request.getParameter("txtOrderTicketId").toString());
				

				List<Integer> listThuTu = Utility.layMinMaxThuTuDiemDung(seatOrder.getRoutes());
				for (Integer i : listThuTu) {
					System.out.print(i + "==");
				}
				ticket = (Ticket) (ObjectManager.getObjectById(orderTicket.getTicketId(), Ticket.class));
				RouteDetail routeDetailOrigin = routeDetailDAO.getRouteDetailWithNumberOrder(ticket.getRouteId(),
						listThuTu.get(0));
				RouteDetail routeDetailDestination = routeDetailDAO.getRouteDetailWithNumberOrder(ticket.getRouteId(),
						listThuTu.get(listThuTu.size() - 1));
				Province provinceOrign = (Province) ObjectManager.getObjectById(routeDetailOrigin.getProvinceId(),
						Province.class);
				Province provinceDestination = (Province) ObjectManager
						.getObjectById(routeDetailDestination.getProvinceId(), Province.class);
				TicketDetail ticketDetailOrigin = ticketDetailDAO1.getTicketDetailByTicketId(orderTicket.getTicketId(),
						provinceOrign.getProvinceId());
				TicketDetail ticketDetailDestination = ticketDetailDAO1
						.getTicketDetailByTicketId(orderTicket.getTicketId(), provinceDestination.getProvinceId());
				BusStation busStationOrigin = (BusStation) ObjectManager
						.getObjectById(ticketDetailOrigin.getBusStationId(), BusStation.class);
				BusStation busStationDestination = (BusStation) ObjectManager
						.getObjectById(ticketDetailDestination.getBusStationId(), BusStation.class);

				infoOrderTicket.add(provinceOrign.getProvinceName()); // 0 add
																		// diem
																		// di
				infoOrderTicket.add(provinceDestination.getProvinceName()); // 1
																			// add
																			// diem
																			// den
				infoOrderTicket.add(busStationOrigin.getBusStationName()); // 2
																			// ben
																			// xe
																			// di
				infoOrderTicket.add(busStationDestination.getBusStationName()); // 3
																				// ben
																				// xe
																				// den
				infoOrderTicket.add(Utility.replaceString2(seatOrder.getSeat())); // 4
																					// ghe
				infoOrderTicket.add(ticketDetailOrigin.getDetailDate() + " " + ticketDetailOrigin.getDetailTime());// 5
																													// ngay
																													// di
				infoOrderTicket
						.add(ticketDetailDestination.getDetailDate() + " " + ticketDetailDestination.getDetailTime());// 6
																														// ngay
																														// den
				infoOrderTicket.add(ticket.getTicketSale()); // 7
				infoOrderTicket.add(ticket.getTicketTax()); // 8
				infoOrderTicket.add(String.valueOf(Utility.getPrice(listThuTu.get(0),
						listThuTu.get(listThuTu.size() - 1), Utility.splitPrice(ticket.getTicketPrice())))); // 9
				
				check = "success";
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			request.setAttribute("info", infoOrderTicket);
			request.setAttribute("check", check);
			request.setAttribute("orderTicket", orderTicket);
			dispatcher = request.getRequestDispatcher("/check");
			dispatcher.forward(request, response);
			break;
		}

	}

}
