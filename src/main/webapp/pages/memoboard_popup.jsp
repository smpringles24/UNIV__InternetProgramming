<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="article-board-popup" class="popup" style="display:none">
	<div class="article-board-popup__contents">
		<h2 id="article-board-popup__title">새 메모보드 생성</h2>
		<input type="text" id="article-board-popup__input" placeholder="메모보드 이름 입력" />
		<div>
			<button class="article-board-popup__btn" id="article-board-popup__confirm-button" onclick="handlePopupAction()">생성</button>
			<button class="article-board-popup__btn" id="article-board-popup__cancle-button" onclick="closePopup()">취소</button>
		</div>
	</div>
</div>