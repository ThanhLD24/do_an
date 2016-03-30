package thanhld.appcode.controller;

import java.io.IOException;
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
import thanhld.appcode.dao.TicketDAO;
import thanhld.appcode.dao.TicketDAOImpl;
import thanhld.appcode.model.Bus;
import thanhld.appcode.model.BusStation;
import thanhld.appcode.model.Carrier;
import thanhld.appcode.model.OrderTicket;
import thanhld.appcode.model.Route;
import thanhld.appcode.model.SeatOrder;
import thanhld.appcode.model.Ticket;
import thanhld.appcode.utility.ObjectManager;
import thanhld.appcode.utility.Utility;
import thanhld.appcode.utility.Variables;

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
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		String id = request.getParameter("id");
		BusStationDAO busStationDAO = new BusStationDAOImpl();
		List<BusStation> listBusStation = new ArrayList<BusStation>();
		listBusStation = busStationDAO.getListStationByProvince(id);
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(listBusStation, new TypeToken<List<BusStation>>() {}.getType());
		JsonArray jsonArray = element.getAsJsonArray();
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);
		
		/*int specialityId = Integer.parseInt(request.getParameter("SpecialityId"));
		
		ArrayList<Doctor> list = new ArrayList<>();		
		Doctor d1= new Doctor("1", "A");
		Doctor d2= new Doctor("2", "B");
		list.add(d1);
		list.add(d2);	

		String doctors = null;

		doctors = new Gson().toJson(list);
		response.setContentType("application/json");
		response.getWriter().write(doctors);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/* doGet(request, response); */
		HttpSession session = request.getSession(true);
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		int type = Integer.parseInt(request.getParameter("type"));
		RequestDispatcher dispatcher = null;
		Ticket ticket = new Ticket();
		Bus bus = new Bus();
		Route route = new Route();
		Carrier carrier = new Carrier();
		TicketDAO ticketDAO = new TicketDAOImpl();

		List<Ticket> listTicket = new ArrayList<Ticket>();

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
		int busId = 0;
		int priceTotal = 0;
		int numberOriginPlace = 0;
		int numberDestinationPlace = 0;
		int totalSeat = 0;
		switch (type) {
		case Variables.SEARCH_TICKET:
			orginPlace = request.getParameter("txtOrgin");
			destinationPlace = request.getParameter("txtDestination");
			startDate = request.getParameter("start_date");
			listTicket = ticketDAO.getTicketByCondition(orginPlace, destinationPlace, startDate);
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
			bus = (Bus) ObjectManager.getObjectById(busId, Bus.class);
			route = (Route) ObjectManager.getObjectById(ticket.getRouteId(), Route.class);
			carrier = (Carrier) ObjectManager.getObjectById(bus.getCarrierId(), Carrier.class);
			session.setAttribute("ticketId", ticketId);
			session.setAttribute("busId", busId);
			session.setAttribute("numberOriginPlace", numberOriginPlace);
			session.setAttribute("numberDestinationPlace", numberDestinationPlace);
			session.setAttribute("priceTotal", priceTotal);
			session.setAttribute("ticket", ticket);
			session.setAttribute("bus", bus);
			session.setAttribute("route", route);
			session.setAttribute("carrier", carrier);
			dispatcher = request.getRequestDispatcher("/selectseat");
			dispatcher.forward(request, response);
			break;
		case Variables.SELECT_SEAT:
			listSeat = request.getParameter("txtListSeat");
			totalMoney = request.getParameter("txtTotalMoney");
			seatCount = request.getParameter("txtSeatCount");

			session.setAttribute("listSeat", listSeat);
			session.setAttribute("totalMoney", totalMoney);
			session.setAttribute("seatCount", seatCount);

			dispatcher = request.getRequestDispatcher("/info");
			dispatcher.forward(request, response);
			break;
		case Variables.INFO:
			fullName = request.getParameter("txtHoTen");
			phoneNumber = request.getParameter("txtSdt");
			notes = request.getParameter("txtGhiChu");
			ticketId = session.getAttribute("ticketId").toString();
			numberOriginPlace = Integer.parseInt(session.getAttribute("numberOriginPlace").toString());
			numberDestinationPlace = Integer.parseInt(session.getAttribute("numberDestinationPlace").toString());
			int seatCountInt = Integer.parseInt(session.getAttribute("seatCount").toString());

			sessionShortId = session.getId().substring(0, 6);
			OrderTicket orderTicket = new OrderTicket();
			orderTicket.setOrderTicketId(sessionShortId);
			orderTicket.setTicketId(ticketId);
			orderTicket.setPassengerNameTitle("");
			orderTicket.setPassengerName(fullName);
			orderTicket.setPassengerEmail("");
			orderTicket.setPassengerAddress("");
			orderTicket.setPassengerGender("");
			orderTicket.setPassengerPhone(phoneNumber);
			orderTicket.setOrderTicketSeat(session.getAttribute("listSeat").toString());
			orderTicket.setOrderTicketTotalSeat(Integer.parseInt(session.getAttribute("seatCount").toString()));
			orderTicket.setOrderTicketTotalPrice(session.getAttribute("totalMoney").toString());
			orderTicket.setOrderTicketTime(Utility.getDateTimeNow());
			orderTicket.setOrderTicketExpiredTime("");
			orderTicket.setOrderTicketPaidDate("");
			orderTicket.setOrderTicketStatus(true);
			orderTicket.setOrderTicketOther(notes);

			try {
				ObjectManager.addObject((Object) orderTicket);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			SeatOrder seatOrder = new SeatOrder();
			seatOrder.setTicketId(ticketId);
			seatOrder.setOrderTicketId(sessionShortId);
			seatOrder.setSeat(session.getAttribute("listSeat").toString());
			seatOrder.setRoutes(Utility.phanChangDuong(numberOriginPlace, numberDestinationPlace));
			ticket = (Ticket) session.getAttribute("ticket");
			ticket.setTicketCount(ticket.getTicketCount() - seatCountInt);
			try {
				ObjectManager.addObject(seatOrder);
				ObjectManager.update(ticket);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			session.invalidate();

			break;
		}

	}

}
