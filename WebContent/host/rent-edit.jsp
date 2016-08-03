<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.homecloud.db.Conn"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Add New Rent | HomeCloud</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Loading Bootstrap -->
<link href="../dist/css/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

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
session.setAttribute("rentID",rentID);
ResultSet rs=con.getRs("SELECT * FROM rent where rentID='"+rentID+"'");
  while(rs.next()){
    
%>
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
            <a href="../host/rent-listing.jsp">
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
                <a href="../host/account.jsp">
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
      <form action="../host/rent-edit-update.jsp">
<div class="row">
<div class="col-sm-8">

				<!--Basic Info-->
				<div class="panel">

					<div class="panel-body">

		

						<div class="row">
							<div class="col-sm-6 row-space-1">
								<label class="control-label" for="">Price</label>
								<div id="">
									<input type="text" class="form-control" id="" placeholder="Price"
										name="price" value="<%=rs.getInt("price")%>">
								</div>
							</div>
              <div class="col-sm-6 row-space-1">
								<label class="control-label" for="">Property Type</label>
								<div id="" class="form-group">
                <select id="type" name="type" type="singleselect"
										data-toggle="select"
										class="form-control select select-default">						
						<option value="<%=rs.getString("type")%>" selected="selected"><%=rs.getString("type")%></option>
						<option value="Apartments">Apartments</option>
						<option value="Condominium">Condominium</option>
						<option value="Mobile/Manufactured">Mobile/Manufactured</option>
						<option value="Multi-Family">Multi-Family</option>
						<option value="Residential">Residential</option>
						<option value="Resort">Resort</option>
						<option value="TownHouse">TownHouse</option>
						<option value="Waterfront">Waterfront</option>
					</select>
										
								</div>
							</div>
						</div>
<div class="row">
							<div class="col-sm-6 row-space-1">
								<label class="control-label" for=""># of Bedroom</label>
								<div id="" class="form-group">
									<select name="bedrooms" id="bedrooms" type="singleselect"
										data-toggle="select"
										class="form-control select select-default">
										<option value="<%=rs.getString("bedrooms")%>" selected="selected"><%=rs.getString("bedrooms")%></option>
										<option value="1">1</option>
										<option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="More">More</option>
									</select>
								</div>
							</div>
              <div class="col-sm-6 row-space-1">
								<label class="control-label" for=""># of Bathroom</label>
								<div id="" class="form-group">
									<select name="bathrooms" id="" type="singleselect"
										data-toggle="select"
										class="form-control select select-default">
										<option value="<%=rs.getString("bathrooms")%>" selected="selected"><%=rs.getString("bathrooms")%></option>
										<option value="1">1</option>
										<option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="More">More</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row row-space-2">
							<div class="col-sm-12">
								<label class="control-label" for="">Location</label>
								<div id="">
									<input type="text" class="form-control" id="" placeholder="Street Line"
										name="street1" value="<%=rs.getString("street1")%>">
								</div>
                </div>
                </div>
                <div class="row row-space-2">
                <div class="col-sm-12">
							<div id="">
									<input type="text" class="form-control" id="" placeholder="Street Line 2"
										name="street2" value="<%=rs.getString("street2")%>">
								</div>
							</div>

						</div>
            <div class="row">
                <div class="col-sm-6 row-space-2">
							<div id="">
									<input type="text" class="form-control" id="" placeholder="City"
										name="city" value="<%=rs.getString("city")%>">
								</div>
							</div>
<div class="col-sm-3 row-space-2">
							<div id="">
									<input type="text" class="form-control" id="" placeholder="State"
										name="state" value="<%=rs.getString("state")%>">
								</div>
							</div>
              <div class="col-sm-3 row-space-2">
							<div id="">
									<input type="text" class="form-control" id="" placeholder="Zipcode"
										name="zipcode" value="<%=rs.getString("zipcode")%>">
								</div>
							</div>
						</div>
						

              

						<div class="row">
							<div class="col-sm-12">
								<label for="" class="control-label">Description</label>
							</div>
							<div class="col-sm-12 ">
								<textarea class="form-control" name="description"
									placeholder="<%=rs.getString("description")%>" style="width: 100%; max-width: 100%;" rows="6"></textarea>
							</div>
						</div>

						



					</div>
				</div>
        </div>
        <div class="col-sm-4">
        <div class="panel">
							<div class="row-space-top-1 panel-body text-center">
              
              <img src="https://placem.at/places?w=500&h=500" alt="House Image" class="rent-listing-image">
              
              <div class="row-space-top-1">
								<input type="file" name="file" value="">
								<p class="help-block">
									Upload photo of your property.
								</p>
								<input class="btn btn-primary btn-block row-space-top-2 text-capitalize"
									type="submit" value="Upload" name="submit" />
                  </div>
							</div>
							</div>
              <div class="text-center row-space-2">
              <a href="rent-delete.jsp">Delete from My Listing</a>
              </div>
              </div>
						</div>
      <div class="row ">
					<div class="col-sm-4 col-xs-6">
					<input type="hidden" name="rentID" value="<%=rs.getInt(1)%>">
						<button class="btn btn-primary btn-block btn-wide text-capitalize"
							type="submit">Create</button>
					</div>
					<div class="col-sm-4 col-xs-6">
						<a ng-click="cancelForm()"
							class="btn btn-block btn-default text-capitalize"> Cancel </a>
					</div>
				</div><br>
      </form>
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