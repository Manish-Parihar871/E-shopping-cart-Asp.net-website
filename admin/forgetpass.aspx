<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgetpass.aspx.cs" Inherits="admin_forgetpass" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/prettyPhoto.css" rel="stylesheet">
    <link href="../css/price-range.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
	<link href="../css/main.css" rel="stylesheet">
	<link href="../css/responsive.css" rel="stylesheet">
   
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
     <form id="Form2" runat ="server" >
	<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
                                <li><a >Customer Care:</a></li>
								<li><a ><i class="fa fa-phone"></i> +91 95 01 288 821</a></li>
								<li><a ><i class="fa fa-envelope"></i>Eshopper@gmail.com</a></li>
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
							<a href="index.aspx"><img src="../images/home/logo.png" alt="" /></a>
						</div>
						
					</div>
					<div class="col-sm-8">
						
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
                            <li><h2>Forget password</h2></li>
						<li><asp:TextBox ID="loginemail" runat ="server"   placeholder="Email Address" TextMode="Email" BorderStyle ="None" BackColor ="#cccccc" Width ="300" Height ="40" ></asp:TextBox></li>
                           <li>
                               <asp:Label ID="Label1" runat="server" Text="Label" ForeColor ="Red" Visible="False"></asp:Label></li>
                             <li><br /></li>
                     	<li><asp:Button type="submit" runat="server" Id="Button" class="btn btn-default" Text ="Submit" style="background: #FE980F;" OnClick="Button_Click"></asp:Button></li>
						    <li><br /></li>
                            	<li><asp:Button type="submit" runat="server" Id="Button1" class="btn btn-default" Text ="go to login page" style="background: #FE980F;" OnClick="Button1_Click" ></asp:Button></li>
					
                             </ul>
					</div><!--/login form-->
                    </div>
				
                	<div class="col-sm-2 col-sm-offset-1" ></div>
		  </div>
		</div>
	</section><!--/form-->
	
	
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
         </form>
</body>
</html>
