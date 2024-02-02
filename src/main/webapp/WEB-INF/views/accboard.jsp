<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#sixlayout {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	/* width: 90vw;
	height: 90vh; */
	width:1000px;
	height:600px;
	/* border: 1px solid black; */
	padding-left: 100px;
	margin-bottom: 20px;
	object-fit: cover;
}
h1{
margin-left : 20px;
display:flex;
justify-content:center;
align-items:center;
}
.gridOne{
width:350px;
height:300px;
}
#boardOne {
	//width: 300px;
	//height: 270px;
	display: flex;
	flex-direction: column;
	margin: 1vw;
	object-fit: cover;
}

#boardImg {
	/* height: 60vh; */
	height:190px;
	border: 1px solid black;
	object-fit: cover;
}

#description {
	display: flex;
	flex-direction: column;
	object-fit: cover;
}

.desc-detail {
	margin: 0.5vh;
	display: flex;
	flex-direction: row;
	object-fit: cover;
}
.desc-detail> div:first-child {
	displat:flex;
	width : 60px;
	margin : 0 10px 0 0;
}
.desc-detail> div:last-child {
	display:flex;
	width : auto;

}

#pagenation {
	display: flex;
	border: 1px solid black;
	justify-content: center;
	object-fit: cover;
	padding-top:10px;
	padding-bottom:10px;
}

.downImage {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#topDiv {
	display: flex;
	flex-direction: column;
	overflow: auto;
}
#wbtn-div{
display:flex;
margin-left:50px;

}
#writebtn{
display:flex;
text-decoration-line : none;

}

</style>

<body>
<%@ include file="./include/top.jsp" %>
	<div id="topDiv">
	<h1>숙소 게시판</h1>
		<div id="sixlayout" >
			<%-- <c:forEach items="${files }" var="fname"> <!-- files 는 스트링 배열. --> --%>
			<c:forEach items="${acclist }" var="accvo">
				<!-- var는 jap 내에서만 사용하는 지역변수 -->
				<a href="detail?acvno=${accvo.accNum }" class="gridOne">
					<div id="boardOne">
						<div id="boardImg">
							
						<%-- ${accvo.files[0] } --%>
							<%-- <c:if test="${accvo.files[0]}!=null"> --%>
								<img class="downImage" src="download?filename=${accvo.files[0]}"
									alt='1.png'>
							<%-- </c:if> --%>
							<!-- <img src="1.png" /> -->
							<!-- 나중에 이 부분 파일업로더로 올린 파일 DB 에서 가져와서 바꿔야함. -->
						</div>
						<div id="description">
							<div class="desc-detail">
								<div>제목</div>
								<div>${accvo.accTitle }</div>
							</div>
							<div class="desc-detail">
								<div>작성자</div>
								<div>${user_id }</div>
							</div>
							<div class="desc-detail">
								<div>게시날짜</div>
								<div>${accvo.accDate }</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>

		<div id="pagenation">
			<c:if test="${rpagevo.prev}">
				<a class="btl" href="acb?page=${rpagevo.startPage -1 }">[이전페이지그룹]</a>
			</c:if>
			<c:forEach begin="${rpagevo.startPage }" end="${rpagevo.endPage }"
				var="idx">
				<c:if test="${idx == rpagevo.page }">[</c:if>
				<a class="btl" href="acb?page=${idx}">${idx }</a>
				<c:if test="${idx == rpagevo.page }">]</c:if>
			</c:forEach>
			<c:if test="${ rpagevo.next}">

				<a class="btl" href="acb?page=${rpagevo.endPage +1 }">[다음 페이지 그룹]</a> 
				
			</c:if>
			<div id="wbtn-div">
			<a href="accwr" id="writebtn"><button>글쓰기</button></a>
			</div>
		</div>
		
	</div>
	<!-- <div id="pagenation">[1][2][3][4](페이징 코드 따로 작성해야됨)</div> -->
</body>

<script>
	
</script>
</html>