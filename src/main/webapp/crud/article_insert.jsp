<%@page import="myBean.article.*"%>
<%
request.setCharacterEncoding("UTF-8");

String submit = request.getParameter("new-memo-submit");
if (submit != null) {
	String title = request.getParameter("name");
	String content = request.getParameter("content");
	String importantStr = request.getParameter("important");
	String secretStr = request.getParameter("secret");
	String bgColor = request.getParameter("bgColor");

	Article newArticle = new Article();
	newArticle.setTitle(title);
	newArticle.setContent(content);
	newArticle.setImportant(importantStr != null);
	newArticle.setSecret(secretStr != null);
	newArticle.setArticleboardId(1);
	newArticle.setBgColor(bgColor);

	ArticleDAO dao = new ArticleDAO();
	int result = dao.insertArticle(newArticle);

	if (result > 0) {
		response.sendRedirect("../pages/main.jsp");
	} else {
		out.println("❌ 글 저장 실패");
	}
}
%>