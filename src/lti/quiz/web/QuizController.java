package lti.quiz.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lti.quiz.bean.ForgetBean;
import lti.quiz.bean.ProfileBean;
import lti.quiz.bean.QuizBean;
import lti.quiz.service.QuizService;
import lti.quiz.service.QuizServiceImpl;
import lti.quiz.service.UserService;
import lti.quiz.service.UserServiceImpl;

/**
 * Servlet implementation class QuizController
 */
@WebServlet("/quiz.quiz")
public class QuizController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuizService service;
	private UserService serviceUser;
	private int idx = 0;

	@Override
	public void init() throws ServletException {
		service = new QuizServiceImpl();
		serviceUser = new UserServiceImpl();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		List<String> pattern = (List<String>) session.getAttribute("PATTERN");
		if (pattern == null)
			pattern = new ArrayList<>();

		String choice = request.getParameter("choice");
		if (choice != null) {
			pattern.add(choice);
			session.setAttribute("PATTERN", pattern);
		}

		List<QuizBean> questions = (List<QuizBean>) session.getAttribute("QUIZ");
		if (questions == null) {
			questions = service.loadQuiz();
			session.setAttribute("QUIZ", questions);
		}

		request.setAttribute("QUESTION", questions.get(idx));
		idx++;

		if (idx < 12)
			getServletContext().getRequestDispatcher("/quiz.jsp").forward(request, response);
		else {
			String hero = service.getResult(pattern);
			request.setAttribute("Hero", hero);
			ProfileBean profile = new ProfileBean();

			profile.setProfile((String) request.getAttribute("Hero"));
			profile.setEmail((String) request.getAttribute("EMAIL"));
			System.out.println(session.getAttribute("EMAIL"));
			System.out.println(request.getAttribute("EMAIL"));
			serviceUser.updateProfile(profile);
			getServletContext().getRequestDispatcher("/result.jsp").forward(request, response);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
