<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	background-image: linear-gradient(to left top, #404040, #606060, #808080, #606060, #404040
		);
	height: 100vh;
}

#login .container #login-row #login-column .login-box {
	margin-top: 120px;
	max-width: 600px;
	height: 320px;
	border: 1px solid #9C9C9C;
	background-image: linear-gradient(to bottom, #CBC6C6, #F3F0F0, #D9D7D0, #cfd5d5, #D9D7D0);
}

#login .container #login-row #login-column .login-box #login-form {
	padding: 20px;
}

#login .container #login-row #login-column .login-box #login-form #register-link
	{
	margin-top: -85px;
}
</style>
<body>
	<div id="login">
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div class="login-box col-md-12">
						<form id="login-form" class="form" action="loginProssion"
							method="POST">
							<h3 class="text-center text-info text-white">Login</h3>
							<div class="form-group">
								<label for="username" class="text-info">UserID:</label><br>
								<input type="text" name="id" id="username" class="form-control">
							</div>
							<div class="form-group">
								<label for="password" class="text-info">Password:</label><br>
								<input type="Password" name="pwd" id="password"
									class="form-control">
							</div>
							<div class="form-group" align="right">
								<!-- 	<label for="remember-me" class="text-info"><span>Remember -->
								<!-- me</span> <span><input id="remember-me" name="remember-me" -->
								<!-- type="checkbox"></span></label><br>  -->
								<input type="submit" name="submit" class="btn btn-info btn-md"
									value="로그인"> <a href="joinUser"> <input
									type="button" class="btn btn-info btn-md" value="회원가입">
								</a>
							</div>
							<!-- 							<div id="register-link" class="text-right"> -->
							<!-- 								<a href="#" class="text-info">Register here</a> -->
							<!-- 							</div> -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>