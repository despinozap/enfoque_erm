<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>Reptal Web | Ingreso</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="Dilutes.cl">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/fasdlot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="Theme/css/cloud-admin.css" >
	
	<link href="Theme/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="theme/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="theme/js/uniform/css/uniform.default.min.css" />
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="Theme/css/animatecss/animate.min.css" />
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
</head>
<body class="login">	
	<!-- PAGE -->
	<section id="page">
			<!-- HEADER -->
			<header>
				<!-- NAV-BAR -->
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div id="logo hidden">
								<a href="http://www.reptal.cl"><img src="Resources/logo.png" height="60" alt="logo name" class="hidden" /></a>
							</div>
						</div>
					</div>
				</div>
				<!--/NAV-BAR -->
			</header>
			<!--/HEADER -->
			<!-- LOGIN -->
			<section id="login_bg" class="visible">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box">
								<h2 class="bigintro">Ingreso</h2>
								<div class="divide-40"></div>
								<form role="form" runat="server">
								  <div class="form-group">
									<label for="exampleInputEmail1">Usuario</label>
									<i class="fa fa-user"></i>
                                    <asp:TextBox ID="txtUsuarioIn" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
									<input type="email" class="form-control hidden" id="exampleInputEmail1" >
								  </div>
								  <div class="form-group"> 
									<label for="exampleInputPassword1">Clave</label>
									<i class="fa fa-lock"></i>
                                      <asp:TextBox ID="txtClaveIn" CssClass="form-control" runat="server" TextMode="Password" ></asp:TextBox>
									<input type="password" class="form-control hidden" id="exampleInputPassword1" >
								  </div>
								  <div>
									<label class="checkbox"> <input type="checkbox" class="uniform" value=""> Recuerdame</label>
									<asp:LinkButton runat="server" CssClass="btn btn-danger col-md-12" Text="Enviar" ID="btnEntrar" OnClick="btnEntrar_Click"></asp:LinkButton>
								  </div>
								</form>
								<div class="login-helpers hidden">
									<a href="#" onclick="swapScreen('forgot_bg');return false;">Olvido su Clave?</a> <br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--/LOGIN -->
			<!-- REGISTER -->
			<section id="register_bg" class="font-400">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box">
								<h2 class="bigintro">Register</h2>
								<div class="divide-40"></div>
								<form role="form">
								  <div class="form-group">
									<label for="exampleInputName">Full Name</label>
									<i class="fa fa-font"></i>
									<input type="text" class="form-control" id="exampleInputName" >
								  </div>
								  <div class="form-group">
									<label for="exampleInputUsername">Username</label>
									<i class="fa fa-user"></i>
									<input type="text" class="form-control" id="exampleInputUsername" >
								  </div>
								  <div class="form-group">
									<label for="exampleInputEmail1">Email address</label>
									<i class="fa fa-envelope"></i>
									<input type="email" class="form-control" id="exampleInputEmail1" >
								  </div>
								  <div class="form-group"> 
									<label for="exampleInputPassword1">Password</label>
									<i class="fa fa-lock"></i>
									<input type="password" class="form-control" id="exampleInputPassword1" >
								  </div>
								  <div class="form-group"> 
									<label for="exampleInputPassword2">Repeat Password</label>
									<i class="fa fa-check-square-o"></i>
									<input type="password" class="form-control" id="exampleInputPassword2" >
								  </div>
								  <div>
									<label class="checkbox"> <input type="checkbox" class="uniform" value=""> I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
									<button type="submit" class="btn btn-success">Sign Up</button>
								  </div>
								</form>
								<!-- SOCIAL REGISTER -->
								<div class="divide-20"></div>
								<div class="center">
									<strong>Or register using your social account</strong>
								</div>
								<div class="divide-20"></div>
								<div class="social-login center">
									<a class="btn btn-primary btn-lg">
										<i class="fa fa-facebook"></i>
									</a>
									<a class="btn btn-info btn-lg">
										<i class="fa fa-twitter"></i>
									</a>
									<a class="btn btn-danger btn-lg">
										<i class="fa fa-google-plus"></i>
									</a>
								</div>
								<!-- /SOCIAL REGISTER -->
								<div class="login-helpers">
									<a href="#" onclick="swapScreen('login_bg');return false;"> Back to Login</a> <br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--/REGISTER -->
			<!-- FORGOT PASSWORD -->
			<section id="forgot_bg">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box">
								<h2 class="bigintro">Borrar Clave</h2>
								<div class="divide-40"></div>
								<form role="form">
								  <div class="form-group">
									<label for="exampleInputEmail1">Ingrese Correo Electronico</label>
									<i class="fa fa-envelope"></i>
									<input type="email" class="form-control" id="exampleInputEmail1" >
								  </div>
								  <div>
									<button type="submit" class="btn btn-info">Enviar Clave</button>
								  </div>
								</form>
								<div class="login-helpers">
									<a href="#" onclick="swapScreen('login_bg');return false;">Volver</a> <br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- FORGOT PASSWORD -->
	</section>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="Theme/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="Theme/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="Theme/bootstrap-dist/js/bootstrap.min.js"></script>	
	<!-- UNIFORM -->
	<script type="text/javascript" src="Theme/js/uniform/jquery.uniform.min.js"></script>
	<!-- BACKSTRETCH -->
	<script type="text/javascript" src="Theme/js/backstretch/jquery.backstretch.min.js"></script>
	<!-- CUSTOM SCRIPT -->
    <script type="text/javascript" src="Resources/login/JSlogin.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {		
			login.init(); //Initialise plugins and elements
		});
	</script>
	<script type="text/javascript">
		function swapScreen(id) {
			jQuery('.visible').removeClass('visible animated fadeInUp');
			jQuery('#'+id).addClass('visible animated fadeInUp');
		}
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>

