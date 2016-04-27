package thanhld.appcode.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import thanhld.appcode.dao.AccountDAO;
import thanhld.appcode.dao.AccountDAOImpl;
import thanhld.appcode.model.Account;
import thanhld.appcode.model.CancelOrderTicket;
import thanhld.appcode.model.EmployeeWorking;
import thanhld.appcode.model.OrderTicket;
import thanhld.appcode.model.Province;
import thanhld.appcode.model.Ticket;
import thanhld.appcode.model.TicketDetail;
import thanhld.appcode.utility.ObjectManager;
import thanhld.appcode.utility.Utility;
import thanhld.appcode.utility.Variables;

/**
 * Servlet implementation class AdminBusController
 */
@WebServlet("/AdminBusController")
public class AdminBusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminBusController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		RequestDispatcher dispatcher = null;
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Account account = (Account) session.getAttribute("account");
		int type = Integer.parseInt(request.getParameter("type"));
		switch (type) {
		case Variables.LOGOUT:
			session.invalidate();
			dispatcher = request.getRequestDispatcher("/admin/login");
			dispatcher.forward(request, response);
			break;

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		int type = Integer.parseInt(request.getParameter("type"));
		HttpSession session = request.getSession(true);
		RequestDispatcher dispatcher = null;
		String oId = null;
		OrderTicket orderTicket = null;
		CancelOrderTicket cancelOrderTicket = null;
		List<Province> listProvince = new ArrayList<Province>();
		String ticketIdBySession = null;
		String listDriver = null;
		String listExtraDriver = null;
		String check = null;
		Account ac = new Account();
		switch (type) {
		case Variables.ADD_SCHEDULE:
			ac = (Account) session.getAttribute("account");
			ticketIdBySession = session.getId().substring(0, 6);
			listProvince = (List<Province>) session.getAttribute("listProvince");
			StringBuilder stringPrice = new StringBuilder();
			int busId = Integer.parseInt(request.getParameter("bus"));
			int routeId = Integer.parseInt(request.getParameter("route"));
			String sale = request.getParameter("txtSale");
			String tax = request.getParameter("txtTax");
			listDriver = request.getParameter("listDriver");
			listExtraDriver = request.getParameter("listExtraDriver");
			session.setAttribute("listDriver", listDriver);
			session.setAttribute("listExtraDriver", listExtraDriver);
			for (int i = 0; i < listProvince.size() - 1; i++) {
				stringPrice.append(request.getParameter("price_" + i) + "-");
			}
			Ticket ticket = new Ticket();
			ticket.setTicketId(ticketIdBySession);
			ticket.setEmployeeId(ac.getEmployeeId());
			ticket.setRouteId(routeId);
			ticket.setBusId(busId);
			ticket.setTicketPrice(stringPrice.toString());
			ticket.setTicketSale(sale);
			ticket.setTicketTax(tax);
			ticket.setTicketCurrency(Variables.VIET_NAM_DONG); // demo
			ticket.setTicketStartSellDate(Utility.parse12HoursTo24HoursTimeAndDate(request.getParameter("txtNgayMoBan").toString())); 
			ticket.setTicketEndSellDate(Utility.parse12HoursTo24HoursTimeAndDate(request.getParameter("txtNgayDongBan").toString())); 

			/* EmployeeWorking emplWork = new EmployeeWorking(); */
			// can add employee working HERE

			try {
				ObjectManager.addObject(ticket);
				System.out.println("TICKET ID ADDED: "+ticketIdBySession);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(stringPrice.toString());
			dispatcher = request.getRequestDispatcher("/admin/add-detail-schedule");
			dispatcher.forward(request, response);
			break;
		case Variables.ADD_DETAIL_SCHEDULE:
			ticketIdBySession = session.getId().substring(0, 6);
			listProvince = (List<Province>) session.getAttribute("listProvince");
			listDriver = session.getAttribute("listDriver").toString();
			listExtraDriver = session.getAttribute("listExtraDriver").toString();
			StringBuilder concatDriver = new StringBuilder();
			concatDriver.append(listExtraDriver);
			concatDriver.append(listDriver);
			List<Integer> listIdDriver = new ArrayList<Integer>();
			listIdDriver = Utility.splitIdDriver(concatDriver.toString());
			int maxPosition = listProvince.size() - 1;
			for (Integer id : listIdDriver) {
				EmployeeWorking emplW = new EmployeeWorking();
				emplW.setTicketId(ticketIdBySession);
				emplW.setEmployeeId(id);
				emplW.setStartRunDate(request.getParameter("date_0"));
				emplW.setEndRunDate(request.getParameter("date_" + maxPosition));
				try {
					ObjectManager.addObject(emplW);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			for (int i = 0; i < listProvince.size(); i++) {
				TicketDetail ticketDetail = new TicketDetail();
				String date = request.getParameter("date_" + i);
				String time = request.getParameter("time_" + i);
				int busStationId = Integer.parseInt(request.getParameter("bus_station_" + i));
				ticketDetail.setTicketId(ticketIdBySession);
				ticketDetail.setProvinceId(listProvince.get(i).getProvinceId());
				ticketDetail.setBusStationId(busStationId);
				ticketDetail.setDetailDate(date);
				ticketDetail.setDetailTime(Utility.parse12HoursTo24HoursTime(time));
				try {
					ObjectManager.addObject(ticketDetail);
					ac = new Account();
					ac = (Account) session.getAttribute("account");
					// session.invalidate();
					request.changeSessionId();
					session = request.getSession();
					session.setAttribute("account", ac);
					session.setAttribute("permit", ac.getAccountPermit());
					request.setAttribute("add-detail-schedule-success", 1);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					request.setAttribute("add-detail-schedule-success", 0);
					e.printStackTrace();
				}
			}

			dispatcher = request.getRequestDispatcher("/admin/schedule");
			dispatcher.forward(request, response);
			break;

		case Variables.LOGIN:
			String name = request.getParameter("account");
			String password = request.getParameter("password");
			String passwordMD5 = Utility.encryptMD5(password);
			AccountDAO accountDAO = new AccountDAOImpl();
			Account account = accountDAO.checkLogin(name, passwordMD5);
			if (account != null) {
				session.setAttribute("account", account);
				session.setAttribute("permit", account.getAccountPermit());
				dispatcher = request.getRequestDispatcher("/admin/home");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("error_message", 1);
				dispatcher = request.getRequestDispatcher("/admin/login");
				dispatcher.forward(request, response);
			}
			break;
		case Variables.EDIT_BOOK:
			check = "fail";
			oId = request.getParameter("txtOrderTicketId");
			String passengerName = request.getParameter("txtPassengerName");
			String passengerEmail = request.getParameter("txtPassengerEmail");
			String passengerPhone = request.getParameter("txtPassengerPhone");
			System.out.println(oId + " ========= " + passengerEmail + "============" + passengerPhone + "============"
					+ passengerName + "============");
			orderTicket = (OrderTicket) ObjectManager.getObjectById(oId, OrderTicket.class);
			orderTicket.setPassengerName(passengerName);
			orderTicket.setPassengerEmail(passengerEmail);
			orderTicket.setPassengerPhone(passengerPhone);
			try {
				ObjectManager.update(orderTicket);
				check = "success";
			} catch (Exception e) {
				e.getMessage();
				check = "fail";

			}
			request.setAttribute("check", check);
			request.setAttribute("mess", "Cập nhật");
			dispatcher = request.getRequestDispatcher("/admin/book");
			dispatcher.forward(request, response);
			/*
			 * String jsonString = new Gson().toJson(check);
			 * 
			 * 
			 * List<Route> listRoute = ObjectManager.listObject(Route.class);
			 * jsonString = new Gson().toJson(listRoute);
			 * 
			 * response.setContentType("application/json");
			 * response.getWriter().write(jsonString);
			 */
			break;
		case Variables.PAY_BOOK:
			check = "fail";
			oId = request.getParameter("txtOrderTicketId");
			orderTicket = (OrderTicket) ObjectManager.getObjectById(oId, OrderTicket.class);
			Account accountLogon = (Account) session.getAttribute("account");
			orderTicket.setOrderTicketPaidDate(Utility.getDateTimeNow());
			orderTicket.setOrderTicketOther(String.valueOf(accountLogon.getEmployeeId()));
			try {
				ObjectManager.update(orderTicket);
				check = "success";
			} catch (Exception e) {
				e.getMessage();
				check = "fail";
			}
			request.setAttribute("check", check);
			request.setAttribute("mess", "Thanh toán");
			dispatcher = request.getRequestDispatcher("/admin/book");
			dispatcher.forward(request, response);
			break;
		case Variables.EDIT_ACCOUNT:
			check = "fail";
			account = (Account) ObjectManager.getObjectById(Integer.parseInt(request.getParameter("txtAccountId")),
					Account.class);
			account.setAccountName(request.getParameter("txtAccountName"));
			account.setAccountPassword(request.getParameter("txtAccountPassword"));
			account.setAccountPermit(Integer.parseInt(request.getParameter("txtAccountPermit")));
			try {
				ObjectManager.update(account);
				check = "success";
			} catch (Exception e) {
				e.getMessage();
				check = "fail";

			}
			request.setAttribute("check", check);
			request.setAttribute("mess", "Cập nhật");
			dispatcher = request.getRequestDispatcher("/admin/account");
			dispatcher.forward(request, response);
			break;
		case Variables.DELETE_ACCOUNT:
			check = "fail";
			try {
				ObjectManager.deleteObject(Integer.parseInt(request.getParameter("txtAccountId").toString()),
						Account.class);
				check = "success";
			} catch (Exception e) {
				e.getMessage();
				check = "fail";
			}
			request.setAttribute("check", check);
			request.setAttribute("mess", "Xóa");
			dispatcher = request.getRequestDispatcher("/admin/account");
			dispatcher.forward(request, response);
			break;
		case Variables.ADD_ACCOUNT:
			account = new Account();
			account.setAccountName(request.getParameter("txtAccountName"));
			account.setAccountPassword(Utility.encryptMD5(request.getParameter("txtAccountPassword")));
			account.setEmployeeId(Integer.parseInt(request.getParameter("txtEmployeeId")));
			account.setAccountPermit(Integer.parseInt(request.getParameter("txtAccountPermit")));
			check = "fail";
			try {
				ObjectManager.addObject(account);
				check = "success";
			} catch (Exception e) {
				e.getMessage();
				check = "fail";
			}
			request.setAttribute("check", check);
			request.setAttribute("mess", "Thêm mới");
			dispatcher = request.getRequestDispatcher("/admin/account");
			dispatcher.forward(request, response);
			break;
		case Variables.REFUND_TICKET:
			check = "fail";
			oId = request.getParameter("txtOrderTicketId");
			// dua trang thai ve dat sang false
			orderTicket = (OrderTicket) ObjectManager.getObjectById(oId, OrderTicket.class);
			orderTicket.setOrderTicketStatus(false);
			// them ve dat da duoc tra vao muc ve tra
			cancelOrderTicket = new CancelOrderTicket();
			cancelOrderTicket.setOrderTicketId(orderTicket.getOrderTicketId());
			cancelOrderTicket.setCancelOrderTicketCancelTime(Utility.getDateTimeNow());
			
			/* dang set cung tien hoan tra lai la 80% tong so tien mua ve*/
			int moneyRefund = Integer.parseInt(orderTicket.getOrderTicketTotalPrice().toString()) * 80 / 100;
			cancelOrderTicket.setCancelOrderTicketRefund(String.valueOf(moneyRefund));
			/* tien lai = tong tien - tien hoan tra*/
			cancelOrderTicket.setCancelOrderTickerInterest(String.valueOf(Integer.parseInt(orderTicket.getOrderTicketTotalPrice().toString())-moneyRefund));
			cancelOrderTicket.setCancelOrderTickerStatus(true);
			cancelOrderTicket.setCancelOrderTickerNotes(request.getParameter("txtNote"));
			try {
				ObjectManager.update(orderTicket);
				ObjectManager.addObject(cancelOrderTicket);
				check = "success";
			} catch (Exception e) {
				e.getMessage();
				check = "fail";
			}
			request.setAttribute("check", check);
			request.setAttribute("mess", "Trả vé");
			dispatcher = request.getRequestDispatcher("/admin/book");
			dispatcher.forward(request, response);
			break;
		}

	}

}
