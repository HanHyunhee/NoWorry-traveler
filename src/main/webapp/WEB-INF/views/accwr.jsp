<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#abwrForm {
	display: inline-block;
	margin-top: 20px;
	margin-left: 100px;
	width: 80vw;
	height: 100vh;
}

#aboard-head {
	/* border: 1px solid black; */
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 10px;
	height: 8vh;
}

#aboard-mid {
	display: flex;
	flex-direction: column;
	height: 70vh;
}

#aboard-cate {
	display: flex;
	height: 8vh;
	margin: 1vh;
}

.cate {
	margin : 10px 50px 10px 50px;
	width: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cate-content {
	border : solid 1px black;
	align-items: center;
	display: flex;
	width: 150px;
	//height: 99vh margin: 1vw;
}

#aboard-title {
	display: flex;
	height: 8vh;
}

#aboard-titleInput {
	margin-left : 10px;
	border : 1px solid black;
	display: flex;
	width: 1360px;
	height: 99vh margin: 1vw;
}

#aboard-content {
	display: flex;
	height: 70vh;
	margin: 1vw;
}

#aboard-bottom {
	display: flex;
	margin-top: 1vh;
	justify-content: center;
}

#aboard-bottom>button {
	border-radius: 15px;
	margin: 5px 20px 20px 20px;
	width: 80px;
	height: 40px;
}

#aboard-file {
	display: flex;
	flex-direction: column; //
	margin-top: 1vw; //
	border: 1px solid black;
	/* width : 79.8vw; */
	height: auto;
}

#aboard-file>input {
	flex-direction: culumn;
	width: 20vw;
	height: 5vh;
}

.form-control {
	margin-left: 12px;
	margin-top: 8px;
}

#addFileBtn {
	margin: 10px 0 0 10px;
}
</style>

<body>
	<%@ include file="./include/top.jsp"%>
	<form id="abwrForm" action="abwr" method="POST"
		encType="multipart/form-data">
		<div id="aboard-head">
			<h2>숙소 게시판 글쓰기 PAGE</h2>
		</div>
		<div id="aboard-mid">
			<div id="aboard-cate">
				<span class="cate">작성자</span> <span class="cate-content">${user_id }</span>
				<input type="hidden" name="accid" value="${user_id }"> <input
					type="hidden" name="accWriter" value="${user_id }">

			</div>
			<div id="aboard-title">
				<span class="cate">제목</span> <input type="text"
					id="aboard-titleInput" name="accTitle" placeholder="제목을 입력해 주세요">
			</div>
			<textarea id="aboard-content" name="accContents"></textarea>
		</div>
		<div id="aboard-file">
			<input class="form-control" type="file" id="formFile" name="file">
			<input class="form-control" type="file" id="formFile" name="file">
		</div>
		<button type="button" id="addFileBtn">addFile</button>
		<div id="aboard-bottom">

			<button type="submit">글쓰기</button>
			<button>취소</button>
		</div>
	</form>
</body>
<script>
	// 파일 추가 버튼관련한 코드를 작성하자 !!
	$(document).ready(function() {
		$("#addFileBtn").click(function() {
			let addFile = document.createElement('input');
			addFile.type = "file";
			addFile.id = "formFile";
			addFile.className = "form-control";
			addFile.name = "file";
			$("#aboard-file").append(addFile);
		});
	});
</script>
</html>