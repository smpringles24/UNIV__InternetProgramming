<%@page import="myBean.articleboard.*"%>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
if (name != null) {

	ArticleBoard newArticleBoard = new ArticleBoard();
	newArticleBoard.setName(name);
	
	ArticleBoardDAO dao = new ArticleBoardDAO();
	int result = dao.insertArticleBoard(newArticleBoard);

	if (result > 0) {
		response.setStatus(200);
		response.sendRedirect("../pages/memoboard.jsp");
	} else {
		response.setStatus(500);
		out.println("❌ 글 저장 실패");
	}
}
%>