<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product_details.aspx.cs" Inherits="product_details" %>

<!<% if (Session["user_id"] != null)
      {
          Logout.Visible = true;
          Login.Visible = false;
          Signup.Visible = false;
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
								<li><a href="index.aspx" >Home</a></li>
								<li class="dropdown"><a href="#" class="active">Shop<i class="fa fa-angle-down"></i></a>
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
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-1">
					
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                <asp:Image ID="Image1" runat="server" />
								<%--<h3>ZOOM</h3>--%>
							</div>
							</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="images/product-details/new.jpg" class="newarrival" alt="" />
								<h2>
                                  <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h2>
								<p></p>
								Rs
								<span>
									<span><asp:Label ID="Label3" runat="server" Text="Label" style="font-size :20px;"></asp:Label></span>
									<label>Quantity:</label>
                                    <asp:TextBox ID="TextBox2" runat="server" Text="1" TextMode="Number" min="1" oninput="validity.valid||(value='');" Max="100"></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-fefault cart" OnClick="LinkButton1_Click"><i class="fa fa-shopping-cart"></i>
										Add to cart</asp:LinkButton>
								</span>
								<p><b>Availability:</b> In Stock</p>
                                <p><b>Purchase Product From:</b> 
                                <asp:Label ID="Label5" runat="server" Text="Label" Visible ="false" ></asp:Label>
								 <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-fefault cart" OnClick="LinkButton2_Click">Amazon/Flipkart</asp:LinkButton>
								</p><p><br /></p>
                                 <asp:LinkButton ID="LinkButton3" runat="server" class="btn btn-fefault cart" OnClick="LinkButton3_Click">Compare With</asp:LinkButton>
								
										</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li><a href="#details" data-toggle="tab">Details</a></li>
								<li class="active"><a href="#reviews" data-toggle="tab">Reviews </a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade" id="details" >
								<div class="col-sm-3">
									
								</div>
                                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
								</div>
								<div class="tab-pane fade active in" id="reviews" >
								<div class="col-sm-12">
									<p><b>Write Your Review and Question</b></p>
                                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
										<%--<b>Rating: </b> <img src="images/product-details/rating.png" alt="" />--%>
										<p><asp:Button runat="server" ID ="reviewsubmit" Text ="Submit" class="btn btn-default pull-right" BackColor ="#ff9900" OnClick="reviewsubmit_Click"  >
											</asp:Button></p>
                                    <br /><hr />
        <p><asp:Repeater ID="Repeater1" runat="server" >
         <ItemTemplate>
         <hr />
        <ul>
       <li><a ><i class="fa fa-user"> <%#Eval("name") %></i></a></li>
       <li><a ><i class="fa fa-clock-o"> <%#Eval("time") %></i></a></li>
       </ul>
       <asp:Label ID="Label3" runat="server" Text='<%#Eval("text") %>'></asp:Label>
        <br />  <hr />
        </ItemTemplate>
       </asp:Repeater>
		</p>					
	  </div>
		 </div>
			</div>
				</div><!--/category-tab-->
					
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
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
        </form>
</body>
</html>
 <% }    
       else 
       {
           Response.Redirect("Login.aspx");
           }
       %>