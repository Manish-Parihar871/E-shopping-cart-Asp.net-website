<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>
<!<% if (Session["user_id"] != null)
      {
          Logout.Visible = true;
          Login.Visible = false;
          Signup.Visible = false;
         %>
   
 <% }  
   
       else 
       {
           
           }
       %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
   
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
     <form runat ="server" >
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
                                <li><a >Customer Care:</a></li>
								<li><a ><i class="fa fa-phone"></i> +91 95 01 288 821</a></li>
								<li><a ><i class="fa fa-envelope"></i>Easydeal@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.aspx"><img src="images/home/EasyDeallogo.png" /></a>
						</div>
						
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="cart.aspx" ><i class="fa fa-shopping-cart"></i> Cart</a></li>
								<li><asp:LinkButton ID="Login" runat="server"><a href="login.aspx"> <i class="fa fa-lock"></i> Login</a></asp:LinkButton></li>
                                <li><asp:LinkButton ID="Signup" runat="server" ><a href="signup.aspx" class="active"><img src="images/home/signup.png"  width ="15" height ="15"/>Signup</a></asp:LinkButton></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.aspx" >Home</a></li>
								<li class="dropdown"><a href="#" >Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><asp:Repeater ID="Repeater3" runat="server"><ItemTemplate >
                                            <a href ="#"><asp:Button ID="Button10" runat="server" Text='<%#Eval("category_name") %>' OnClick ="Button10_Click" Width ="150px" BackColor ="#666666" BorderStyle ="None" style="color :white;text-align :left;font-size :18px;" /> </a><br />
                                                                                        </ItemTemplate></asp:Repeater></li>
                                     <li>  <asp:Label ID="Label6" runat="server" Text="Label" Visible ="false" ></asp:Label></li> 
                                    </ul>
                                </li> 
                                <li><a href="contact.aspx">Contact</a></li>
								<li class="dropdown"><a href="#"><i class="fa fa-user"></i> Account<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="Myaccount.aspx" >My Account</a></li>
                                        <li><a href="Orderhistory.aspx">Order History</a></li>
										<li><a >
                                            <asp:LinkButton ID="Logout" runat="server" OnClick="Logout_Click" Visible="False">Logout</asp:LinkButton></a></li>
                                    </ul>
                                </li> 
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->

	
	<section id="form" style ="margin-top :100px;"><!--form-->
		<div class="container">
			<div class="row">
               	<div class="col-sm-2 col-sm-offset-1" ></div>
              	<div class="col-sm-4 col-sm-offset-1" >
					<div class="login-form"><!--login form-->
						<ul>
                            <li><h2>Create new account</h2></li>
                          <li>   <asp:TextBox ID="signupname" runat ="server"  placeholder="User Name" BorderStyle ="None" BackColor ="#cccccc" Width ="300" Height ="40"/></li>
                            <li><br /></li>
                           <li> 	<asp:TextBox ID="signupemail" runat ="server"   placeholder="Email Address" TextMode="Email" onfocus="this.type='email'"  BorderStyle ="None" BackColor ="#cccccc" Width ="300" Height ="40" />
                           </li>
                              <li><br /></li>
                           <li>   <asp:TextBox ID="signupmobileno" runat ="server" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" MaxLength="10"    placeholder="Mobile no" BackColor ="#cccccc" Width ="300" Height ="40"  />
                                          </li>
                              <li><br /></li>
                           <li>  <asp:TextBox ID="signuppassword" runat ="server"   placeholder="Password" TextMode="Password" BorderStyle ="None" BackColor ="#cccccc" Width ="300" Height ="40" /></li>
                              <li><br /></li>
                             <li>  <asp:TextBox ID="address" runat ="server"   placeholder="Address" TextMode="MultiLine"  BorderStyle ="None" BackColor ="#cccccc" Width ="300" Height ="40" /></li>
                              <li><br /></li>
                            <li><asp:Label ID="l1" ForeColor="Red" runat="server" Text=""></asp:Label></li>
                           <li>  <asp:Button  runat="server" Id="Button" class="btn btn-default" Text ="signup" style="background: #FE980F;" OnClick="Button_Click"></asp:Button></li>
						</ul>
					</div><!--/login form-->
                      	<div class="col-sm-2 col-sm-offset-1" >
                    </div>
		  </div><%--oninput="validity.valid||(value='');"--%>
		</div>
	</section><!--/form-->
	
	
	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
					</div>
                     <div class="col-sm-3">
						<div class="companyinfo">
							<h2><span>Easy</span>Deal</h2>
							<p>Best Product For You</p>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="single-widget">
							<h2>Quick Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="cart.aspx">Cart</a></li>
                                <li><a href="contact.aspx">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="policies.aspx">Terms of Use</a></li>
								<li><a href="policies.aspx">Refund Policy</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p style="text-align :center ;">Copyright © 2019 EasyDeal All rights reserved.</p>
					</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
         </form>
</body>
</html>
