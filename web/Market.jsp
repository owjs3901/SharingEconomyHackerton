<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
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
</style>
<meta charset="UTF-8">
<title>Lost It</title>
<link href="mystyle.css" rel="stylesheet" type="text/css">
<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

td{

	padding: 6px;
}
tr, th{
		border-bottom: 1px solid #444444;
		padding: 6px;
}
#ab{
	border-bottom: 10px solid #FFFFFF;
	padding: 8px;
	text-decoration: none;
}

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
.button1 {
   width: 110px;
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
</style>
<script type="text/javascript">
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
	<div id=header>
		<a href="Main.jsp" target="_self"><img src="LOGO.png"
			; width=250px; height=75px; align="center";></a>
			<input
			type="button"; class="button" value="login"
			id="lc" onclick="act()">
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

			<br />
			<table width=100% style="text-align: center;">
				<colgroup>
					<col width="" />

					<col width="80px" />
				</colgroup>
				<thead id='con'>
					<tr>
						<th style="background-color: #eeeeee;">작성글</th>
						<th style="background-color: #eeeeee;">작성자</th>
					</tr>
				</thead>
			</table>
			<br> <input type="button" class="button1" value="물픔 등록하기" onclick="login()">
			<br>
		</div>

		<div id=right></div>
	</div>
	<script src="https://www.gstatic.com/firebasejs/5.8.2/firebase.js"></script>
	<script>
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
		ac.on('child_added', function(dd) {
			var arr = [ '', '', '',''];
			db.ref('post/' + dd.key).on('child_added', function(dc) {
				console.log(dc.key + 'atatat' + dc.val())
				if (dc.key == 'title')
					arr[0] = dc.val();
				if (dc.key == 'userID')
					arr[1] = dc.val();
				if (dc.key == 'content')
					arr[2] = dc.val();
				if (dc.key == 'index')
					arr[3] = dc.val();
			});

			var list1 = document.createElement("tr");
			var aa = document.createElement("a");
			aa.id = 'ab';
			var list2 = document.createElement("td");
			var list3 = document.createElement("td");
			list2.appendChild(document.createTextNode(arr[0]));
			aa.href='View.jsp?index='+arr[3];
			
			aa.appendChild(list2);
			
			
			list1.appendChild(aa);
			list1.appendChild(list3);
			document.getElementById('con').append(list1);
			list3.appendChild(document.createTextNode(arr[1]));
		});

		function login() {

			var cookieData = document.cookie;
			var getCookie = function(name) {
				var value = document.cookie.match('(^|;) ?' + name
						+ '=([^;]*)(;|$)');
				return value ? value[2] : null;
			};
			if (getCookie('login') != null)
				location.href = 'content_register.jsp';
			else
				alert("로그인을 해주세요!");
		}
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