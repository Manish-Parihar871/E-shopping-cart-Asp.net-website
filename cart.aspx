<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>
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
								<li><a href="cart.aspx" class="active"><i class="fa fa-shopping-cart"></i> Cart</a></li>
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
								<li class="dropdown"><a href="#" >Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><asp:Repeater ID="Repeater3" runat="server"><ItemTemplate >
                                            <a href ="#"><asp:Button ID="Button10" runat="server" Text='<%#Eval("category_name") %>' OnClick ="Button10_Click" Width ="150px" BackColor ="#666666" BorderStyle ="None" style="color :white;text-align :left;font-size :18px;" /> </a><br />
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
						
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
                     
                  	<tbody>
                           <asp:Repeater ID="Repeater1" runat="server"><ItemTemplate >
						<tr>
							<td class="cart_product">
								<asp:Image ID="Label1" runat="server" ImageUrl='<%#Eval("product_image") %>' style="width :100px; height :50px;"/> 
							</td>
							<td class="cart_description">
								<h4><asp:Label ID="Label2" runat="server" Text='<%#Eval("product_name") %>'/></h4>
								<h5><asp:Label ID="Label6" runat="server" Text='<%#Eval("Id") %>'></asp:Label></h5>
							</td>
							<td class="cart_price">
								Rs<p><asp:Label ID="Label4" runat="server" Text='<%#Eval("product_price") %>'/></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">

								 	<asp:Label runat ="server" ID="cartqty" class="cart_quantity_input" Text ='<%#Eval("product_qty") %>' min="1" max="100" oninput="validity.valid||(value='');" TextMode="Number" Width ="60"></asp:Label> 
											</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">
                           Rs <asp:Label ID="Label5" runat="server" Text='<%#Eval("total") %>'></asp:Label></p>
							</td>
							<td class="cart_delete">
                                <asp:LinkButton ID="delete" runat="server" OnClick ="delete_Click"><i class="fa fa-times"></i></asp:LinkButton>
                               
							</td>
                            
						</tr>
</ItemTemplate></asp:Repeater>
						
					</tbody>
                    
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Update Your Adress Details</h3>   
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="chose_area">
						<ul class="user_option">
							<li>
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="   Buyer Name" Width ="300" BackColor ="#f1f1f1" BorderStyle ="None" Height ="30" ></asp:TextBox>
							</li>
                            <li><br /></li>
							<li>
                                <asp:TextBox ID="TextBox2" runat="server" placeholder="  Shiping Address" Width ="300px" TextMode ="MultiLine" Height="70px"  ></asp:TextBox>
							</li>
							
						</ul>
						
						 <a> <asp:LinkButton ID="addressupdate" class="btn btn-default update" runat="server" OnClick="addressupdate_Click">Update</asp:LinkButton></a>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span>
                                RS<asp:Label ID="Label3" runat="server" Text="0"></asp:Label></span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span>
                               Rs <asp:Label ID="Label7" runat="server" Text="0"></asp:Label></span></li>
						</ul>
							 <a> <asp:LinkButton ID="cheaKout" class="btn btn-default update" runat="server" OnClick="cheaKout_Click" >Cheakout</asp:LinkButton></a>
                      		</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->

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
						<%--<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Order Status</a></li>
							</ul>
						</div>--%>
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
