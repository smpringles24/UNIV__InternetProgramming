<%@page import="myBean.article.*"%>
<%
request.setCharacterEncoding("UTF-8");

String submit = request.getParameter("new-memo-submit");
try {
	String articleIdParam = request.getParameter("articleId");
	int articleId = Integer.parseInt(articleIdParam);

	ArticleDAO dao = new ArticleDAO();
	int result = dao.deleteArticle(articleId);

	if (result > 0) {
		response.sendRedirect("../pages/main.jsp");
	} else {
		out.println("❌ 글 삭제 실패");
	}
} catch (Exception e) {
	out.println("에러 발생: " + e.getMessage());
}
%>