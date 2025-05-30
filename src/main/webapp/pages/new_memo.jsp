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
	href="${pageContext.request.contextPath}/css/pages/new_memo.css" />
<title>인터넷 프로그래밍</title>
</head>
<body>
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
				<h1>메모 작성</h1>
				<a href="main.jsp">메인화면</a>
			</div>
			<form id="new-memo__form" action="../crud/article_insert.jsp" method="post">
				<div class="new-memo__form__col-container">
					<label for="name">제목 *</label> 
					<input type="text" id="name" name="name" />
				</div>
				<div class="new-memo__form__col-container">
					<label for="board">메모 보드 선택 *</label> <select id="board"
						name="board">
						<option value="1">메모보드_01</option>
						<option value="2">메모보드_02</option>
					</select>
				</div>
				<div class="row-container">
					<label for="bgColor">배경색</label> <input type="color" id="bgColor"
						name="bgColor" value="#ffffff" />
				</div>
				<div class="row-container">
					<label for="important">중요글</label> <input type="checkbox"
						id="important" name="important" class="toggle-switch" />
				</div>
				<div class="row-container">
					<label for="secret">비밀글</label> <input type="checkbox" id="secret"
						name="secret" class="toggle-switch" />
				</div>
				<div class="row-container">
					<label for="files">첨부파일</label> <input type="file" id="files"
						name="file" />
				</div>
				<label for="content">내용 *</label>
				<textarea name="content" rows="15"></textarea>
				<input type="submit" id="new-memo-submit" name="new-memo-submit"
					value="메모 작성" />
			</form>
		</main>
	</div>
</body>
</html>
