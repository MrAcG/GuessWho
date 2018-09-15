package lti.quiz.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lti.quiz.bean.ForgetBean;
import lti.quiz.bean.LoginBean;
import lti.quiz.bean.RegisterBean;
import lti.quiz.service.UserService;
import lti.quiz.service.UserServiceImpl;

@WebServlet("/user.quiz") // this is annotation and other type is xml
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service;

	@Override
	public void init() throws ServletException {
		service = new UserServiceImpl();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String referer = request.getHeader("referer");

		// creates a fresh new session in the server if no session id found in request
		// header
		// otherwise old session id identified by id in request header
		HttpSession session = request.getSession();

		if (request.getParameter("logout") != null) {
			// user to logout
			session.invalidate(); // destroy session
			response.sendRedirect("home.jsp?logout=yes");
		} else if (referer.contains("login")) {
			// request for login
			LoginBean login = new LoginBean();
			String ParamEmail = request.getParameter("email");
			String ParamPass = request.getParameter("password");

			login.setEmail(ParamEmail);
			login.setPassword(ParamPass);

			RegisterBean user = service.authenticate(login);
			if (user != null) {
				// Login successful
				session.setAttribute("USER", user);// USER is key user is object for creating session

				response.sendRedirect("dashboard.jsp");
			} else {
				response.sendRedirect("login.jsp?invalid=true");
			}

		} else if (referer.contains("register")) {
			// request for register
			RegisterBean register = new RegisterBean();

			String ParamEmail = request.getParameter("email");
			String ParamPass = request.getParameter("password");
			String ParamAns = request.getParameter("answer");

			register.setEmail(ParamEmail);
			register.setPassword(ParamPass);
			register.setAnswer(ParamAns);

			boolean b = service.register(register);
			if (b == true) {
				response.sendRedirect("login.jsp");
			} else {
				response.sendRedirect("register.jsp");
			}

		} else if (referer.contains("forgotpassword")) {
			// request for forgot
			ForgetBean forget = new ForgetBean();
			forget.setEmail(request.getParameter("email"));
			forget.setAnswer(request.getParameter("answer"));

			if (service.validate(forget)) {
				session.setAttribute("EMAIL", forget.getEmail()); // saves email for session
				response.sendRedirect("change.jsp");
			} else {
				response.sendRedirect("forgotpassword.jsp?invalid=yes");
			}

		} else if (referer.contains("change")) {
			// request for change
			LoginBean update = new LoginBean();
			update.setPassword(request.getParameter("newpassword"));
			update.setEmail((String) session.getAttribute("EMAIL")); // getting email from session ,since it returns an
																		// object convert it to String to get email

			if (service.update(update)) {
				response.sendRedirect("login.jsp");
				session.removeAttribute("EMAIL");// remove after updation of password
			} else {
				response.sendRedirect("change.jsp?invalid=yes");
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
