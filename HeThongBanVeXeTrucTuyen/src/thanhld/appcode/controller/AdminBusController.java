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

import thanhld.appcode.dao.AccountDAO;
import thanhld.appcode.dao.AccountDAOImpl;
import thanhld.appcode.model.Account;
import thanhld.appcode.model.EmployeeWorking;
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

		List<Province> listProvince = new ArrayList<Province>();
		String ticketIdBySession = null;
		String listDriver = null;
		String listExtraDriver = null;
		switch (type) {
		case Variables.ADD_SCHEDULE:
			ticketIdBySession = session.getId().substring(0, 6);
			listProvince = (List<Province>) session.getAttribute("listProvince");
			StringBuilder stringPrice = new StringBuilder();
			int busId = Integer.parseInt(request.getParameter("bus"));
			int routeId = Integer.parseInt(request.getParameter("route"));
			listDriver = request.getParameter("listDriver");
			listExtraDriver = request.getParameter("listExtraDriver");
			session.setAttribute("listDriver", listDriver);
			session.setAttribute("listExtraDriver", listExtraDriver);
			for (int i = 0; i < listProvince.size() - 1; i++) {
				stringPrice.append(request.getParameter("price_" + i) + "-");
			}
			Ticket ticket = new Ticket();
			ticket.setTicketId(ticketIdBySession);
			ticket.setEmployeeId(1); // demo
			ticket.setRouteId(routeId);
			ticket.setBusId(busId);
			ticket.setTicketPrice(stringPrice.toString());
			ticket.setTicketCurrency(Variables.VIET_NAM_DONG);
			ticket.setTicketStartSellDate("2016-02-20 06:00:00"); // demo
			ticket.setTicketEndSellDate("2016-09-09 06:00:00"); // demo

			/* EmployeeWorking emplWork = new EmployeeWorking(); */

			// can add employee working HERE
			try {
				ObjectManager.addObject(ticket);
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
					Account ac = new Account();
					ac = (Account) session.getAttribute("account");
					session.invalidate();
					session = request.getSession();
					session.setAttribute("account", ac);
					session.setAttribute("add-detail-schedule-success", 1);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					session.setAttribute("add-detail-schedule-success", 0);
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
		}
	}

}
