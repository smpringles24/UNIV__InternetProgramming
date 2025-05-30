<%@ page import="myBean.article.*"%>
<%
request.setCharacterEncoding("UTF-8");

String idParam = request.getParameter("id");
if (idParam != null) {
	int articleId = Integer.parseInt(idParam);

	ArticleDAO dao = new ArticleDAO();
	int result = dao.viewCountUp(articleId);

	if (result > 0) {
		response.setStatus(200);
	} else {
		response.setStatus(500);
	}
}
%>
