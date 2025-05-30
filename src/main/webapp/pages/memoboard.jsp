<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="myBean.articleboard.ArticleBoard"%>
<%@page import="myBean.articleboard.ArticleBoardDAO"%>
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
	href="${pageContext.request.contextPath}/css/pages/memoboard.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/components/popup.css" />
<title>인터넷 프로그래밍</title>
</head>
<body>
	<%
	ArticleBoard[] articleBoards = null;
	try {
		ArticleBoardDAO articleBoardDao = new ArticleBoardDAO();
		articleBoards = articleBoardDao.readAllArticleBoards();
	} catch (Exception e) {
		out.println("ArticleBoard Load Err: " + e.getMessage());
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
				<h1>메모보드 관리</h1>
				<a href="main.jsp">메인화면</a>
			</div>

			<table class="memoboard-list-view">
				<tr class="memoboard-list-tile">
					<th>ID</th>
					<th>메모보드 이름</th>
					<th>전체 글</th>
					<th>생성일</th>
					<th></th>
					<th></th>
				</tr>

				<%
				if (articleBoards == null || articleBoards.length == 0) {
				%>
				<tr>
					<td colspan="5" style="text-align: center;">메모보드가 없습니다.</td>
				</tr>
				<%
				} else {
				for (ArticleBoard a : articleBoards) {
					String name = a.getName();
					int id = a.getId();
					Timestamp createdAt = a.getCreatedAt();
				%>
				<tr class="memoboard-list-tile" style="background-color: #eeeeee">
					<td><%=id%></td>
					<td><%=name%></td>
					<td>?</td>
					<td><%=createdAt%></td>
					<td class="memoboard-cell__edit" onclick="openPopup('update', <%=id %>)">수정</td>
					<td class="memoboard-cell__delete" onclick="openPopup('delete', <%=id %>)">삭제</td>
				</tr>
				<%
				}
				}
				%>
				<tr class="memoboard-list-tile">
					<td colspan="6" onclick="openPopup('create')" style="text-align: center;">+</td>
				</tr>
				
			</table>
		</main>
		<jsp:include page="./memoboard_popup.jsp" />
	</div>
	<script src="../js/memoboard_popup.js"></script>
</body>
</html>
