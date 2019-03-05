<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>


<!DOCTYPE html>
<html>
<head>

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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="mystyle.css" rel="stylesheet" type="text/css">

<%
   String ac=request.getParameter("index");
%>

<script src="https://www.gstatic.com/firebasejs/5.8.2/firebase.js"></script>
<script type="text/javascript">
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
   var bol=false;
   var ac = db.ref('post/');
   ac.on('child_added', function(dd) {
      var arr = [ '', '', '','' ,'',''];
      if(bol)return;      
      
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
         if (dc.key == 'point')
            arr[4] = dc.val();
         if (dc.key == 'time')
            arr[5] = dc.val();
      });
      if(arr[3]==<%=ac%>){
         bol=true;
      var ti = document.getElementById("ti");
      var con = document.getElementById("cont");
      var ow = document.getElementById("use");
      var po = document.getElementById("po");
      var tm = document.getElementById("tm");
      tm.appendChild(document.createTextNode(arr[5]));
      cont.appendChild(document.createTextNode(arr[2]));
      ti.appendChild(document.createTextNode(arr[0]));
      ow.appendChild(document.createTextNode(arr[1]));
      po.appendChild(document.createTextNode(arr[4]));
      }
   });

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
<style>
table {
   width: 60%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
}

th, td {
   border-bottom: 1px solid #444444;
   padding: 6px;
}
</style>
</head>
<body>
   <div id=wrap>
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

         <div id=left>&nbsp;</div>

         <div id=center>

            <br>
            <table class="table table-srtiped" align="center"
               ; style="text-align: center; border: 1px sold #dddddd">
               <thead>
                  <tr>
                     <th colspan="3"
                        style="background-color: #eeeeee; text-align: center;">글보기
                     </th>

                  </tr>
               </thead>

               <tbody>
                  <tr>
                     <td style="width: 20%">글 제목</td>
                     <td colspan="2" id=ti></td>
                  </tr>
                  <tr>
                     <td>작성자</td>
                     <td colspan="2" id=use></td>
                  </tr>
                  <tr>
                     <td>포인트</td>
                     <td colspan="2" id=po></td>
                  </tr>
                  <tr>
                     <td>유효기간</td>
                     <td colspan="2" id=tm></td>
                  </tr>
                  <tr>
                     <td>내용</td>
                     <td colspan="2" style="min-height: 200px; text-align: left;"
                        height="300" id=cont></td>
                  </tr>

               </tbody>

            </table>
            <br> <input type="button" value="목록"
               onclick="history.back(-1);"> <br> <br>

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