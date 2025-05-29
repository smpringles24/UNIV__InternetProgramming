<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="myBean.Article, myBean.ArticleDAO"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/components/navbar.css" />
<title>인터넷 프로그래밍</title>
</head>
<body>
	<%
	String articleIdParam = request.getParameter("id");
	int articleId = Integer.parseInt(articleIdParam);
	Article article = null;

	if (articleIdParam != null) {
		ArticleDAO dao = new ArticleDAO();
		article = dao.readArticleById(articleId);
	}
	%>

	<%

	%>

	<div class="main-frame">
		<nav>
			<h2>Memo Master</h2>
			<div id="nav__content">
				<table id="nav__list-view">
					<tr class="nav__list-tile">
						<td>💾</td>
						<td>메모보드_01</td>
						<td>(3)</td>
					</tr>
					<tr class="nav__list-tile">
						<td>💾</td>
						<td>메모보드_02</td>
						<td>(12)</td>
					</tr>
					<tr class="nav__list-tile">
						<td>💾</td>
						<td>메모보드_03</td>
						<td>(5)</td>
					</tr>
				</table>
				<div id="nav__login-section">
					<form id="nav__login-form">
						<div id="nav__login-form__user-data">
							<div>
								<label id="for="id">ID</label> <input
									class="nav__login-form__input" type="text" id="id" />
							</div>
							<div>
								<label for="password">PW</label> <input
									class="nav__login-form__input" type="password" id="password" />
							</div>
						</div>
						<div style="width: 10px"></div>
						<input type="submit" value="로그인" id="nav__login-form__submit" />
					</form>
					<div style="height: 20px"></div>
					<div style="height: 20px"></div>
					<span>made by smpringles24@gmail.com</span>
				</div>
			</div>
		</nav>
		<main>
			<h1>메모 보기</h1>
			<a href="main.jsp">메인화면</a>
			<form action="deleteArticle" method="post">
				<input type="hidden" name="articleId" value="<%=articleId%>">
				<button>삭제</button>
			</form>
			<%
			if (article == null) {
			%>
			<p>no article data</p>

			<%
			} else {
			%>
			<form id="new-memo-form">
				<p>
					제목: <br>
					<%=article.getTitle()%>
				</p>
				<p>
					메모 보드: <br>
					<%=article.getArticleboardId()%>
				</p>
				<p>
					중요글:
					<%=article.isImportant()%>
				</p>
				<p>
					비밀글:
					<%=article.isSecret()%>
				</p>
				<p>내용:</p>
				<div
					style="white-space: pre-wrap; border: 1px solid #ccc; padding: 10px; max-width: 600px; height: 300px; text-align: left;">
					<%=article.getContent()%>
				</div>

			</form>
			<%
			}
			%>
		</main>
	</div>
</body>
</html>
