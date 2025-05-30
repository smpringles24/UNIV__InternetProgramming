function viewCountUp(id) {
	fetch("../crud/article_viewcount_up.jsp", {
		method: "POST",
		headers: {
			"Content-Type": "application/x-www-form-urlencoded"
		},
		body: "id=" + encodeURIComponent(id)
	})
		.then(res => {
			if (res.status === 200) {
				location.href = "../pages/memo_preview.jsp?id="+id;
			} else {
				alert("popup Err");
			}
		})
		.catch(err => {
			alert("에러 발생: " + err);
		});
}