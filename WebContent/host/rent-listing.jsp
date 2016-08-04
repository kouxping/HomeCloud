<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.homecloud.db.Conn"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Manage Jobs | HomeCloud</title>
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
  <!-- Navigation -->
  <nav class="navbar navbar-inverse navbar-fixed-top drop-shadow" role="navigation">
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
            <a href="rent-listing.jsp">
              <i class="fa fa-building-o"></i>&nbsp;&nbsp;My Listing
            </a>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <em class="fa fa-user"></em>
  &nbsp; Account <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li>
                <a href="account.jsp">
                  Profile
                </a>
              </li>
              <li>
                <a href="host-login.html">
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
      <div class="row">
        <div class="col-md-3 col-xs-12"><div>
          <a href="rent-add.jsp" class="btn btn-primary btn-block btn-lg text-capitalize" target="_blank">
          <i class="fa fa-plus"></i>&nbsp;&nbsp;add listing</a>
        </div><br></div>
        <div class="col-md-9 col-xs-12">
        
          <div class="panel panel-default" id="basics">
            <div class="panel-body">
            		<%
						Conn con = new Conn();
						String strEmail = (String) session.getAttribute("email");
						ResultSet rs = con.getRs("SELECT * FROM rent WHERE ownerEmail = '" + strEmail + "'");
						while (rs.next()) {
					%>
			<form action="rent-edit.jsp">
              <div class="row left-to-center">
              <div class="col-sm-3 text-center">
              <h3><img src="<%=rs.getString("image")%>" alt="House Image" class="rent-listing-image"></h3>
              </div>
                <div class="col-sm-9">
                  <h1 class="text-uppercase">
                  <i class="fa fa-dollar"></i>
                  <%=rs.getString("price")%></h1>
                  <h5><i class="fa fa-map-marker"></i>&nbsp;&nbsp;<%=rs.getString("street1")%>
                  &nbsp;<%=rs.getString("street2")%>&nbsp;<%=rs.getString("city")%>&nbsp;<%=rs.getString("state")%>&nbsp;<%=rs.getString("zipcode")%></h5>
                  <h6><i class="fa fa-building-o"></i>&nbsp;&nbsp;<%=rs.getString("type")%></h6>

                  <h6 class="text-muted"><%=rs.getString("date")%></h6>
                  <input type="hidden" name="rentID" value="<%=rs.getInt(1)%>">
                  <button class="btn btn-primary" type="submit">
                      Edit
                    </button>
                 
                </div>
                
              </div>
              </form>
               <hr>
              			<%
						}
					%>
             
            
            </div>
          </div>
          <!--Pagination-->
          
          <div class="text-right">
            <ul class="pagination">
              <li class="previous disabled">
                <a href="#fakelink" class="fui-arrow-left">
                </a>
              </li>
              <li class="active">
                <a href="#fakelink">
                  1
                </a>
              </li>
              <li>
                <a href="#fakelink">
                  2
                </a>
              </li>
              <li>
                <a href="#fakelink">
                  3
                </a>
              </li>
              <li>
                <a href="#fakelink">
                  4
                </a>
              </li>
              <li>
                <a href="#fakelink">
                  5
                </a>
              </li>
              <li class="next">
                <a href="#fakelink" class="fui-arrow-right">
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
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
</body>
</html>