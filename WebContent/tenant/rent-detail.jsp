<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.homecloud.db.Conn"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Job Detail | HomeCloud</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Loading Bootstrap -->
    <link href="../dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="../dist/css/flat-ui.css" rel="stylesheet">

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
Conn con=new Conn();
String strEmail=(String)session.getAttribute("email");
String rentID=request.getParameter("rentID");
ResultSet rs=con.getRs("SELECT * FROM rent where rentID='"+rentID+"'");
  while(rs.next()){
    
%>
  <!-- Navigation -->
  <nav class="navbar navbar-default navbar-fixed-top drop-shadow" role="navigation">
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
          
          <li class=" active">
            <a href="../tenant/rent-listing.html">
              <i class="fa fa-home"></i>&nbsp;&nbsp;Search
            </a>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <em class="fa fa-user"></em>
  &nbsp; Account <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li>
                <a href="../tenant/account.jsp">
                  Profile
                </a>
              </li>
              <li>
                <a href="tenant-login.html">
                  Log Out
                </a>
              </li>
            </ul>
          </li>
        </ul>
        
      </div>
      <!-- /.navbar-collapse -->
    </div>
  </nav>
  <!-- Page Content -->
  
  <section class="content">
    <div class="container">
    
          <div class="panel">
            <div class="panel-body">
            <div class="row">
              <div class="col-md-3 col-sm-3 text-center">
              <h3><img src="https://placem.at/places?w=500&h=500" alt="House Image" class="rent-listing-image"></h3>
              </div>
                <div class="col-sm-9 left-to-center">
                  <h1 class="text-uppercase">
                  <i class="fa fa-dollar"></i>
                  3,000</h1>
                  <h5><i class="fa fa-map-marker"></i>&nbsp;&nbsp;<%=rs.getString("address")%></h5>
                  <h6><i class="fa fa-building-o"></i>&nbsp;&nbsp;House Type: <%=rs.getString("type")%></h6>

                  <h6 class="text-muted"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Posted on <%=rs.getString("date")%></h6>
                  <a class="btn btn-primary" href="mailto:" target="_blank">
                      Contact
                    </a>
                 
                </div>
              </div>
              
              </div>
              </div>
              <div class="panel">
              <div class="panel-body">
              <div class="row">
                <div class="col-md-9 col-sm-12">
                <div>
                  <h4>Description</h4>
                  <p><%=rs.getString("description")%></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12">
                  <div class="text-capitalize">
                    <h4>Bedrooms</h4>
                    <p><%=rs.getInt("bedrooms")%></p>
                  </div>
                  <div class="text-capitalize">
                    <h4>Bathrooms</h4>
                    <p><%=rs.getInt("bathrooms")%></p>
                  </div>
                </div>
              </div>
              </div>
            </div>
          <br>
      <script>window.prettyPrint && prettyPrint();</script>
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
  }
%> 
</body>
</html>