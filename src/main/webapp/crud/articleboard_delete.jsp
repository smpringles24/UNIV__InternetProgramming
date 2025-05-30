<%@page import="myBean.articleboard.*"%>
<%
request.setCharacterEncoding("UTF-8");

int id = Integer.parseInt(request.getParameter("id"));
ArticleBoardDAO dao = new ArticleBoardDAO();
int result = dao.deleteArticleBoard(id);

if (result > 0) {
	response.setStatus(200);
	response.sendRedirect("../pages/memoboard.jsp");
} else {
	response.setStatus(500);
}
%>