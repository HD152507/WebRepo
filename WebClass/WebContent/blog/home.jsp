<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="\WebClass\css\blogcss.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Myblog</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.4/jquery.fullpage.min.css">
    <link rel="stylesheet" href="WebClass/css/myblog.css">
    <link href="https://fonts.googleapis.com/css?family=Comfortaa%7CLibre+Barcode+39+Text%7CLobster%7CRajdhani" rel="stylesheet">
</head>
<body>
	
	<style>
		@charset "UTF-8";
#section1 {
  padding-top: 50px; padding-left: 30px; padding-right: 30px; height:900px; color: #fff; background-image: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
}
#section2 {
  padding-top: 50px; padding-left: 30px; padding-right: 30px; height:900px; color: #fff; background-image: linear-gradient(120deg, #66a6ff 0%, #89f7fe 100%);
}
#section3 {
  padding-top: 50px; padding-left: 30px; padding-right: 30px; height:900px; color: #fff; background-image: linear-gradient(to top, #9795f0 0%, #fbc8d4 100%);
}
#section4 {
  padding-top: 50px; padding-left: 30px; padding-right: 30px; height:900px; color: black; background-image: linear-gradient(to top, #dfe9f3 0%, white 100%);
}

#Register {
  padding-top: 50px; padding-left: 30px; padding-right: 30px; height: 900px; color: #fff; background-image: linear-gradient(to top, #09203f 0%, #537895 100%);
}

.container {
  padding-top: 50px; height: 900px;
}

div.container {
    padding-top: 30px;
}

h1 {
  text-align: center;
  font-family: 'Libre Barcode 39 Text', cursive;
  font-size: 100px;
}

h2 {
  font-family: 'Lobster', cursive;
  font-size: 50px;
}
h5 {
  text-align: center;
  font-family: 'Rajdhani', sans-serif
}

h4 {
  color: black;
}
h3 {
  font-family: 'Comfortaa', cursive;
}

p {
  color : black;
}


	</style>

<!-- navbar 부분 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="blog2.html">
  	MyBlog
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this)">
                <a class="nav-link" href="#profile">My Profile <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this)">
                <a class="nav-link" href="#skill">Educational Travel</a>
            </li>
            <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this)">
                <a class="nav-link" href="#activity">My Photos</a>
            </li>
            <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this)">
              <a class="nav-link" href="#membership">Register</a>
            </li>
        </ul>
    <%-- 세션에  사용자 정보가 없는 경우 --%>
    <%
    	UserVO user = (UserVO)session.getAttribute("user");
    	if(user == null){
    %>
    <form>

    </form>
    <form class="form-inline my-2 my-lg-0" id = "LoginForm" action="/WebClass/bloglogin" method="post">
      <input name="id" class="form-control mr-sm-2" type="text" placeholder="ID" aria-label="id" id="id" value = "<%= (request.getAttribute("msg") == null) ? "" : request.getParameter("id") %>" required>
      <input name="pwd" class="form-control mr-sm-2" type="password" placeholder="PASSWORD" aria-label="pwd" id="pwd" required>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
    </form>
    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#signupModal">Sign up</button>
    <%}else{ %>
    <%-- 세션에 사용자 정보가 있는 경우 --%>
	    <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
	    <li class="nav-item dropdown">
	      <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    	<%= user.getName()%>님
	      </a>
	      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
	      	<form action = "/WebClass/bloglogout" method = "post">
	      	<button type="submit" class="dropdown-item">Sign out</button>
	      	</form>
	       	<div class="dropdown-divider"></div>
	        <button type="button" class="dropdown-item">Action1</button>
	        <button type="button" class="dropdown-item">Action2</button>
	      </div>
	    </li>
	    </ul>
	<%} %>
  </div>
</nav>


<div id ="fullpage">
  <div data-anchor="intro" class="section active" id="section1">
  <h1>Hello My Name is Junha Kim</h1>

  <hr>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <h5>Scroll down</h5>
  </div>

  <div data-anchor="profile" class="section" id="section2">
  <h2>I Am...</h2>
  <hr>
  <div>
    <h3>| Junha Kim</h3>
    <br>
    <h3>| iOS Fullstack Developer</h3>
    <br>
    <h3>| Chungchungnam-do, Cheonan-si</h3>
    <br>
    <h3>| LKsoft. Art Director</h3>
  </div>
  </div>

  <div data-anchor="skill" class="section" id="section3">
  <h2>Educational Travel</h2>
  <hr>
  <div class="card-deck">
  <div class="card">
    <img class="card-img-top" src="../image/DSC7.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Fukuoka, Dazaifu</h4>
      <p class="card-text">SONY ILCE-6000<br>Sony E 18-200mm F3.5-6.3</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">2017/6/8</small>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="../image/DSC10.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Fukuoka, Suemachi</h4>
      <p class="card-text">SONY ILCE-6000<br>Sony E 18-200mm F3.5-6.3</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">2017/6/7</small>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="../image/DSC9.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Kitakusu</h4>
      <p class="card-text">SONY ILCE-6000<br>Sony E 18-200mm F3.5-6.3</p>
    </div>
    <div class="card-footer">
      <small class="text-muted">2017/6/8</small>
    </div>
  </div>
</div>

</div>
  <div data-anchor="activity" class="section" id="section4">
  <h2>My Photos</h2>
  <hr>
  <div class="card-group">
    <div class="card">
    <img class="card-img-top" src="../image/DSC1.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Tokyo, Asakusa, Minato City</h4>
      <p class="card-text">SONY ILCE-6000<br>Sony E 18-200mm F3.5-6.3</p>
      <p class="card-text"><small class="text-muted">at 2016/02/11</small></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="../image/DSC2.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Tokyo, Asakusa, Sensounji</h4>
      <p class="card-text">SONY ILCE-6000<br>Sony E 18-200mm F3.5-6.3</p>
      <p class="card-text"><small class="text-muted">at 2017/2/14</small></p>
    </div>
  </div>
  <div class="card">
    <img class="card-img-top" src="../image/DSC3.jpg" alt="Card image cap">
    <div class="card-body">
      <h4 class="card-title">Tokyo, Asakusa, Kaminarimon</h4>
      <p class="card-text">SONY ILCE-6000<br>Sony E 18-200mm F3.5-6.3</p>
      <p class="card-text"><small class="text-muted">at 2017/2/15</small></p>
    </div>
  </div>
</div>
  </div>

  <div data-anchor="membership" class="section" id="Register">
    <h2>Register</h2>
    <hr>
    <form id="registerform" name="register_form">
      <div class="row">
        <div class="col col-6 col-sm-6 form-group">
          <label>아이디</label>
          <input id="registerid" name="register_id" type="text" class="form-control" placeholder="아이디" required>
        </div>
        <div class="col col-6 col-sm-6 form-group">
          <label>비밀번호</label>
          <input id="registerpw" name="register_pw" type="password" class="form-control" placeholder="비밀번호" required>
        </div>
        <div class="col col-6 col-sm-6 form-group">
          <label>번호</label>
          <input id="register-num" name="register_num" type="text" class="form-control" placeholder="번호" required>
        </div>
        <div class="col col-6 col-sm-6 form-group">
          <label>이름</label>
          <input id="register-name" name="register_name" type="text" class="form-control" placeholder="이름">
        </div>
        <div class="col col-12 col-md-6 form-group">
          <label>학년</label><br>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="radio" name="grade" id="one" value="o1" checked> 1 학년
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="radio" name="grade" id="two" value="o2"> 2 학년
            </label>
          </div>
          <div class="form-check form-check-inline">
            <label class="form-check-label">
              <input class="form-check-input" type="radio" name="grade" id="three" value="o3"> 3 학년
            </label>
          </div>
        </div>
          <div class="form-group col col-12 col-md-6 ">
            <label class="col-form-label">반</label>
            <select class="form-control" name="clazz" required>
              <option value="">선택해주세요</option>
              <option value="1">1반</option>
              <option value="2">2반</option>
              <option value="3">3반</option>
              <option value="4">4반</option>
              <option value="5">5반</option>
              <option value="6">6반</option>
            </select>
          </div>
        </div>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Register</button>
        </form>
  </div>
</div>

<!--  회원가입 성공 모달 -->
<div class="modal" id="signupsucmodal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Sign up Result</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<footer class="py-1 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">
			 Junha Kim's Blog
         </p>
         <br>
      </div>
      <!-- /.container -->
   </footer>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script type="text/javascript" src= "../js/blogscript.js"></script>
    <%@ include file="../jsp/modal.jsp" %>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<script>
	<%-- 로그인이 실패한 경우 처리 추가 --%>
	<%
		if("error".equals(request.getAttribute("msg"))){
	%>
		var myModal = $('#myModal');
		myModal.find('.modal-title').text('Login Error');
		myModal.find('.modal-body').text('Invalid username or password');
		myModal.modal();
	<% } %>
</script>
</body>
</html>

