<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

   <% if (Session["user_id"] != null)
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
     <form id="Form1" runat ="server" >
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
								<li><a href="cart.aspx"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								<li><asp:LinkButton ID="Login" runat="server"><a href="login.aspx"> <i class="fa fa-lock"></i> Login</a></asp:LinkButton></li>
                                <li><asp:LinkButton ID="Signup" runat="server"><a href="signup.aspx"><img src="images/home/signup.png"  width ="15" height ="15"/>Signup</a></asp:LinkButton></li>
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
								<li><a href="index.aspx" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><asp:Repeater ID="Repeater2" runat="server"><ItemTemplate >
                                            <asp:Button ID="Button1" runat="server" Text='<%#Eval("category_name") %>' OnClick ="Button1_Click" Width ="150px" BackColor ="#666666" BorderStyle ="None" style="color :white;text-align :left;font-size :18px;" /><br />
                                                                                        </ItemTemplate></asp:Repeater></li>
                                     <li>  <asp:Label ID="Label6" runat="server" Text="Label" Visible ="false" ></asp:Label></li> 
                                        <%--<% while(dr.Read()){ %>
                                        <li><a href="<%=dr["category_name"]%>.aspx"><%=dr["category_name"]%></a></li>
                                        <%} %>
                                       
                                   --%>
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
						<div class="search_box pull-right">
                            <asp:TextBox ID="Serch" runat="server" placeholder="Search"></asp:TextBox>
                            <asp:LinkButton ID="Serchbutton" runat="server" OnClick ="Serchbutton_Click" BackColor="#ffcc00" style="padding :8.5px; border-bottom-right-radius :3px;border-top-right-radius :3px; ">Serch</asp:LinkButton>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>E</span>-SHOPPER</h1>
									<h2> E-Commerce </h2>
								<a href ="#" class="btn btn-default get">Get it now</a>
								</div>
								<div class="col-sm-6">
									<img src="admin/image/asus-rog-strix-g-g531gv-2.jpg" class="girl img-responsive" alt="" width ="600" height ="900"/>
								<%--	<img src="images/home/pricing.png"  class="pricing" alt="" />
							--%>	</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>E</span>-SHOPPER</h1>
									<h2></h2>
											<a href ="#" class="btn btn-default get">Get it now</a>
								</div>
								<div class="col-sm-6">
									<img src="admin/image/realme-5.jpg" class="girl img-responsive" alt="" width ="600" height ="900"/>
									<%--<img src="images/home/pricing.png"  class="pricing" alt="" />--%>
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>E</span>-SHOPPER</h1>
											<a href ="#" class="btn btn-default get">Get it now</a>
								</div>
								<div class="col-sm-6">
									<img src="admin/image/samsung%20speaker.jpg"  class="girl img-responsive" alt="" width ="600" height ="900"/>
									<%--<img src="images/home/pricing.png" class="pricing" alt="" />--%>
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				
				
				<div class="col-sm-12 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Items</h2>
                       
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate >
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<asp:Image ID="Label1" runat="server" ImageUrl='<%#Eval("product_image") %>' style="width :350px; height :200px;"/> 
											<h4> <asp:Label ID="Label2" runat="server" Text='<%#Eval("product_name") %>'/></h4>
                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("product_id") %>' Visible="False" />
                                            <asp:Label ID="Label5" runat="server" Text="qty" Visible="False" />
                                            <h2>Rs <asp:Label ID="Label4" runat="server" Text='<%#Eval("product_price") %>'/></h2><br />
                                            <asp:Button ID ="buy" runat ="server" class="btn btn-default add-to-cart" OnClick ="buy_Click" Text="Buy"  BackColor ="#ff9900"  Width ="100"/>
										</div>
								</div>
							</div>
						</div>
                                </ItemTemplate>
                            </asp:Repeater>
					
					</div><!--features_items-->
					
					<!--/category-tab-->
				</div>
			</div>
		</div>
	</section>
	
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
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
         </form>
</body>
    
    </html>
    
