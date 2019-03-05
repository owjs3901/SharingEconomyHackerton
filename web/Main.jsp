<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
</style>
<script>
	
</script>
<meta charset="UTF-8">
<title>또인트</title>
<link href="mystyle.css" rel="stylesheet" type="text/css">
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
			; width=250px; height=75px; align="center";></a> <input
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
		<div id=center></div>
		<img src="main3.png"; width=90%; height="580";>
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