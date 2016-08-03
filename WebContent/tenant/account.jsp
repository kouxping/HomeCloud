<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.homecloud.db.Conn"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>My Account Setting | HomeCloud</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../js/default.js"></script>

<!-- Loading Bootstrap -->
<link href="../dist/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Loading Flat UI -->
<link href="../dist/css/flat-ui.css" rel="stylesheet">
<!-- Favicon -->

<link rel="shortcut icon" href="../dist/img/favicon.png">

<!-- Custom CSS -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet prefetch">
<link href="../dist/css/style.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>


<body>
	<%
		Conn con = new Conn();
		String strEmail = (String) session.getAttribute("email");
		ResultSet rs = con.getRs("SELECT * FROM tenant WHERE email='"
				+ strEmail + "'");
		if (rs.next()) {
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top drop-shadow"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
				</button>
				<span class="navbar-brand">HomeCloud</span>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav navbar-right">

					<li><a href="../tenant/rent-listing.jsp"> <i
							class="fa fa-home"></i>&nbsp;&nbsp;Search
					</a></li>
					<li class="dropdown active"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <em
							class="fa fa-user"></em> &nbsp; Account <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li class=" active"><a href="../tenant/account.jsp">
									Profile </a></li>
							<li><a href="../tenant/account.html"> Log Out </a></li>
						</ul></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
	<!-- Page Content -->

	<section class="content">
		<div class="container">

			<div class="row">

				<div class="col-md-8 col-md-offset-2 col-sm-12">
					<form class="form-horizontal" role="form"
						action="profile-update.jsp">
						<div class="panel text-center">
							<div class="panel-body">


								<div class="form-group">
									<label for="" class="col-sm-3 control-label">First Name</label>
									<div class="col-sm-9 ">
										<input type="text" class="form-control" id="firstName" name="firstName"
											placeholder="First Name" value="<%=rs.getString("firstName")%>">
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-3 control-label">Last Name</label>
									<div class="col-sm-9 ">
										<input type="text" class="form-control" id="lastName" name="lastName"
											placeholder="Last Name" value="<%=rs.getString("lastName")%>">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail1" class="col-sm-3 control-label">Email</label>
									<div class="col-sm-9 ">
										<input type="email" class="form-control" id="email" name="email"
											placeholder="Email" value="<%=rs.getString("email")%>"
											disabled>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-primary btn-block">Save</button>
									</div>
								</div>

							</div>
						</div>
					</form>
					<form class="form-horizontal" role="form"
						action="account-update.jsp">
						<div class="panel text-center">
							<div class="panel-body">




								<div class="form-group">
									<label for="inputEmail1" class="col-sm-3 control-label">Old
										Password</label>
									<div class="col-sm-9 ">
										<input type="password" class="form-control" id="oldPassword" name="oldPassword"
											placeholder="Old Password">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail1" class="col-sm-3 control-label">New
										Password</label>
									<div class="col-sm-9 ">
										<input type="password" class="form-control" id="newPassword" name="newPassword"
											placeholder="New Password" name="newPassword">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail1" class="col-sm-3 control-label">Confirm
										Password</label>
									<div class="col-sm-9 ">
										<input type="password" class="form-control" id="repeatPassword" name="repeatPassword"
											placeholder="Repeat New Password">
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-12">
								<button type="submit" class="btn btn-primary btn-block">Save</button>
							</div>
						</div>

					</form>
				</div>

			</div>
			<script>
				window.prettyPrint && prettyPrint();
			</script>
		</div>
	</section>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript-->

	<script src="../js/jquery.min.js"></script>
	<script src="../js/vendor/jquery.min.js"></script>
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="../js/vendor/video.js"></script>
	<script src="../js/flat-ui.min.js"></script>
	<script src="../docs/assets/js/prettify.js"></script>
	<script src="../docs/assets/js/application.js"></script>
	<script>
		videojs.options.flash.swf = "../js/vendors/video-js.swf"
	</script>
	<%
		} else {
			out.print("<script>alert('Failed to Connect to Database.');document.location='profile-view.jsp';</script>");
		}
	%>

</body>
</html>