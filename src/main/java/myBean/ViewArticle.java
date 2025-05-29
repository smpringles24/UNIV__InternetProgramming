package myBean;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewArticle")
public class ViewArticle extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int articleId = Integer.parseInt(request.getParameter("id"));

		ArticleDAO dao = new ArticleDAO();

		try {
			dao.viewCountUp(articleId);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "Viewcount Increment Err: " + e.getMessage());
		}

		Article article = dao.readArticleById(articleId);
		request.setAttribute("article", article);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/memo_preview.jsp");
		dispatcher.forward(request, response);
	}
}