<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="myBean.DB.DbCon, java.util.*, myBean.article.*"%>

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
	href="${pageContext.request.contextPath}/css/components/searchbar.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pages/main.css" />
<title>인터넷 프로그래밍</title>
</head>
<body>

	<%
	Article[] articles = null;
	try {
		ArticleDAO dao = new ArticleDAO();
		articles = dao.readAllArticles();
	} catch (Exception e) {
		out.println("Article Load Err: " + e.getMessage());
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
				<a href="./memoboard.jsp">메모보드 관리</a>
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
				<h1>메모보드_01</h1>
				<form id="search-bar">
					<input type="text" id="search-bar__keyword" /> <input
						type="button" value="검색" id="search-bar__submit" />
				</form>
			</div>

			<table class="article-list-view">
				<tr>
					<th>ID</th>
					<th>제목</th>
					<th>중요</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>

				<%
				if (articles == null || articles.length == 0) {
				%>
				<tr>
					<td colspan="5" style="text-align: center;">게시물이 없습니다.</td>
				</tr>
				<%
				} else {
				for (Article a : articles) {
					boolean isSecret = a.isSecret();
					String title = isSecret ? "비밀글" : a.getTitle();
					String link = isSecret ? title : "<a href='memo_preview.jsp?id=" + a.getId() + "'>" + title + "</a>";
					String importantMark = a.isImportant() ? "⭐" : "";
					String viewCount = String.valueOf(a.getViewCount());
					String createdAt = String.valueOf(a.getCreatedAt());
					String bgColor = a.getBgColor();
				%>
				<tr class="list-tile" style="background-color: <%=bgColor%>">
					<td><%=a.getId()%></td>
					<td onclick="viewCountUp(<%=a.getId()%>)"><%=link%></td>
					<td><%=importantMark%></td>
					<td><%=viewCount%></td>
					<td><%=createdAt%></td>
				</tr>
				<%
				}
				}
				%>
			</table>
			<a href="./new_memo.jsp">새 글 작성하기</a>
		</main>
	</div>
	<script src="../js/view_count_up.js"></script>
</body>
</html>
