let popupMode = "";
let targetId = null;

function openPopup(mode, id = null, existingName = "") {
	popupMode = mode;
	targetId = id;

	const popup = document.getElementById("article-board-popup");
	const title = document.getElementById("article-board-popup__title");
	const confirmBtn = document.getElementById("article-board-popup__confirm-button");
	const input = document.getElementById("article-board-popup__input");

	popup.style.display = "flex";

	if (mode === "create") {
		title.innerText = "메모보드 생성";
		confirmBtn.innerText = "생성";
		input.value = "";
	} else if (mode === "update") {
		title.innerText = "메모보드 이름 수정";
		confirmBtn.innerText = "수정";
		input.value = existingName;
	} else if (mode === "delete") {
		title.innerText = "메모보드 삭제 확인";
		confirmBtn.innerText = "삭제";
		input.value = existingName;
		input.disabled = true;
	}

	confirmBtn.onclick = handlePopupAction;
}

function closePopup() {
	document.getElementById("article-board-popup").style.display = "none";
	document.getElementById("article-board-popup__input").disabled = false;
}

function handlePopupAction() {
	const name = document.getElementById("article-board-popup__input").value.trim();
	console.log("ASDASDASDASDASDASD");
	console.log(name);
	if (popupMode === "create") {
		createArticleBoard(name)
	} else if (popupMode === "update") {
		if (name === "") return alert("수정할 이름을 입력하세요");
		updateArticleBoard(targetId, name);
	} else if (popupMode === "delete") {
		deleteArticleBoard(targetId);
	}

	closePopup();
}

function createArticleBoard(name) {
	if (!name) {
		alert("이름을 입력하세요");
		return;
	}

	fetch("../crud/articleboard_insert.jsp", {
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded",
		},
		body: "name=" + encodeURIComponent(name),
	})
		.then(res => {
			if (res.status === 200) {
				location.href = "../pages/memoboard.jsp";
			} else {
				alert("popup Err");
			}
		})
		.catch(err => {
			alert("에러 발생: " + err);
		});
}



function updateArticleBoard(id, name) {
	fetch("../crud/articleboard_update.jsp", {
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded",
		},
		body: "id=" + encodeURIComponent(id) + "&name=" + encodeURIComponent(name),
	})
		.then(res => {
			if (res.status === 200) {
				location.href = "../pages/memoboard.jsp";
			} else {
				alert("popup Err");
			}
		})
		.catch(err => {
			alert("에러 발생: " + err);
		});
}


function deleteArticleBoard(id) {
	fetch("../crud/articleboard_delete.jsp", {
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded",
		},
		body: "id=" + encodeURIComponent(id),
	})
		.then(res => {
			if (res.status === 200) {
				location.href = "../pages/memoboard.jsp";
			} else {
				alert("popup Err");
			}
		})
		.catch(err => {
			alert("에러 발생: " + err);
		});
}



