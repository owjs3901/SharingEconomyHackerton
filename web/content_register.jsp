<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<style>
.button {
	width: 70px;
	background-color: #0489B1;
	border: none;
	color: #fff;
	padding: 10px 0;
	align: right;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px;
	cursor: pointer;
	border-radius: 10px;
}

#login {
	width: 100%;
	height: 150px;
	margin-top: 150px;
	margin-bottom: 10px;
	text-align: center;
	border: 1;
	bordercolor: black;
	bgcolor: black;
}

table td {
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>
<meta charset="UTF-8">
<title>Lost It</title>
<link href="mystyle.css" rel="stylesheet" type="text/css">
<script src="https://www.gstatic.com/firebasejs/5.8.2/firebase.js"></script>
<script>
	// Initialize Firebase
	var config = {
		apiKey : "AIzaSyBKPy9P1VxKfQ1zFrVo0tS2bgCg425oihE",
		authDomain : "hackatone-5486f.firebaseapp.com",
		databaseURL : "https://hackatone-5486f.firebaseio.com",
		projectId : "hackatone-5486f",
		storageBucket : "hackatone-5486f.appspot.com",
		messagingSenderId : "804280661254"
	};
	firebase.initializeApp(config);

	var provider = new firebase.auth.GoogleAuthProvider();
	var db = firebase.database();
	var ac = db.ref('post/');

	var index = 1;
	ac.on('child_added', function(dd) {
		index += 1;
	});

	function re() {
		var ti = document.getElementById("ti").value;
		var po = document.getElementById("po").value;
		var tm = document.getElementById("tm").value;
		var con = document.getElementById("con").value;
		var getCookie = function(name) {
			var value = document.cookie.match('(^|;) ?' + name
					+ '=([^;]*)(;|$)');
			return value ? value[2] : null;
		};
		ac.push().set({
			"content" : con,
			'userID' : getCookie('login'),
			'title' : ti,
			'point' : parseInt(po),
			'index' : index,
			'time' : tm
		});
		location.href = 'Market.jsp'
	}
	var getCookie = function(name) {
		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value ? value[2] : null;
	};
	function act() {
		if (getCookie('login') != null) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = "login = " + "; expires="
					+ expireDate.toGMTString() + "; path=/";

			console.log("tesewqewqt" + getCookie('login'))
			location.href = 'Main.jsp';
		} else {
			location.href = 'login.html';
		}
	}
</script>
</head>

<body>
	<div id=wrap>
		<div id=header>
			<a href="Main.jsp" target="_self"><img src="LOGO.png"
				; width=250px; height=75px; align="center";></a> <input
				type="button" ; class="button" value="login" id="lc" onclick="act()">
		</div>

		<div id=menu>
			<ul>
				<li><a href="Main.jsp" target="_self">Main</a></li>
				<li><a href="Market.jsp" target="_self">Market</a></li>
				<li><a href="MyContent.jsp" target="_self">MyContent</a></li>

			</ul>
		</div>

		<div id=main>

			<div id=left>&nbsp;</div>

			<div id=center>
				<form method="post" action="writeActionLost.jsp">
					<table class="table table-srtiped" align="center"
						style="text-align: center; border: 1px sold #dddddd">
						<tbody>
							<tr>
								<td><strong>제목</strong></td>
								<td><input type="text" id="ti" class=""
									style="height: 30px; width: 507px"></td>
							<tr>
								<td><strong>유효기간</strong></td>
								<td><input type="text" id="tm" class=""
									style="height: 30px; width: 507px"></td>
							<tr>
								<td><strong>포인트</strong></td>
								<td><input type="number" id="po" class=""
									style="height: 30px; width: 507px"></td>
							<tr>
								<td><strong>기타 내용</strong></td>
								<td><textarea class="form-control" id='con'
										placeholder="글 내용" name="" maxlength="2048"
										style="height: 230px; width: 507px"></textarea></td>
							</tr>
							<tr>
								<td><strong>파일 업로드</strong></td>
								<td><input type="file" id="file" class=""
									style="height: 30px; width: 507px"></td>
						</tbody>
					</table>
					<input type="button" class="button btn btn-primary pull right"
						value="등록하기" class="button" onclick="re()" style="height: 40px; width: 100;">
					<br />
				</form>
			</div>
			<div id=right></div>
		</div>
	</div>
	<script type="text/javascript">
		var getCookie = function(name) {
			var value = document.cookie.match('(^|;) ?' + name
					+ '=([^;]*)(;|$)');
			return value ? value[2] : null;
		};

		var a = document.getElementById("lc");
		console.log("test4" + getCookie('login'))
		if (getCookie('login') != null) {
			a.value = 'logOut';
		} else {
			a.value = 'login';
			a.href = "login.html";
		}
	</script>
</body>
</html>