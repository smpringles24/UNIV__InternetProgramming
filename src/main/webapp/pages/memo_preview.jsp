<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="myBean.article.*"%>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pages/memo_preview.css" />
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

	<div class="main-frame">
		<nav>
			<h2>Memo Master</h2>
			<div id="nav__content">
				<table id="nav__list-view">
					<tr class="nav__list-tile">
						<td>💾메모보드_01</td>
						<td>(3)</td>
					</tr>
					<tr class="nav__list-tile">
						<td>💾메모보드_02</td>
						<td>(12)</td>
					</tr>
					<tr class="nav__list-tile">
						<td>💾메모보드_03</td>
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
					<div style="height: 10px"></div>
					<span style="font-size: 12px">made by smpringles24@gmail.com</span>
					<div style="height: 5vh"></div>
				</div>
			</div>
		</nav>
		<main>
			<div class="header">
				<h1>메모 보기</h1>
				<a href="main.jsp">메인화면</a>
				<form action="../crud/article_delete.jsp" method="post" id="new-memo-submit" name="new-memo-submit">
					<input type="hidden" name="articleId" value="<%=articleId%>">
					<button>삭제</button>
				</form>
			</div>
			<%
			if (article == null) {
			%>
			<p>no article data</p>
			<%
			} else {
			%>
			<div id="new-memo__form" class="preview-form" style="background-color:<%= article.getBgColor()%>">
				<div class="new-memo__form__col-container">
					<%=article.getTitle()%>
				</div>

				<div class="new-memo__form__col-container">
					<div class="readonly-field">
						메모보드_<%=article.getArticleboardId()%></div>
				</div>

				<div class="row-container">
					<label>중요글</label> <span class="readonly-field"><%=article.isImportant() ? "✅" : "❌"%></span>
				</div>

				<div class="row-container">
					<label>비밀글</label> <span class="readonly-field"><%=article.isSecret() ? "✅" : "❌"%></span>
				</div>

				<div class="row-container">
					<label>첨부파일</label>
					<div class="readonly-field">ㅁㄴㅇ</div>
				</div>

				<div class="new-memo__form__col-container">
					<label>내용 *</label>
					<div class="readonly-field" style="white-space: pre-wrap;">
						<%=article.getContent()%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</main>
	</div>
</body>
</html>
