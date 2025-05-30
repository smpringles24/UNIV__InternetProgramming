<%@page import="myBean.articleboard.*"%>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
int id = Integer.parseInt(request.getParameter("id"));

if (name != null) {
	ArticleBoardDAO dao = new ArticleBoardDAO();
	int result = dao.updateArticleBoardName(id, name);

	if (result > 0) {
		response.setStatus(200);
		response.sendRedirect("../pages/memoboard.jsp");
	} else {
		response.setStatus(500);
	}
}
%>