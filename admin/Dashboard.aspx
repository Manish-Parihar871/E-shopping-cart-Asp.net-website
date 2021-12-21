<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashbord" %>
 <% if (Session["auser_id"] != null)
      {
         
        
         %>
  
 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    E-shoper admin panel
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
 </head>

<body class="">
    <form runat ="server" id="form1">
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="assets/img/logo-small.png">
          </div>
        </a>
        <a href="#" class="simple-text logo-normal">
          ADMIN PANEL
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="Dashboard.aspx">
              <i class="nc-icon nc-bank"></i>
              <p>Dashboard</p>
            </a>
          </li> 
            <li>
            <a href="add_product.aspx">
              <i class="nc-icon nc-tile-56"></i>
              <p>Add Product</p>
            </a>
          </li>
            <li >
            <a href="View_product.aspx">
              <i class="nc-icon nc-tv-2"></i>
              <p>View Product</p>
            </a>
          </li>
          <li>
            <a href="REview.aspx">
              <i class="nc-icon nc-chat-33"></i>
              <p>Review</p>
            </a>
          </li>
          <li>
            <a href="user.aspx">
              <i class="nc-icon nc-single-02"></i>
              <p>User</p>
            </a>
          </li>
            <li>
            <a href="Sell_product.aspx">
              <i class="nc-icon nc-money-coins"></i>
              <p>Sell Product</p>
            </a>
          </li>
            <li>
            <a href="Setting.aspx">
              <i class="nc-icon nc-settings-gear-65"></i>
              <p>Setting</p>
            </a>
          </li>
            <li>
            <a href="#">
              <i class="nc-icon nc-button-power"></i>
              <p><asp:LinkButton ID="Logout" runat="server" OnClick="Logout_Click" >Logout</asp:LinkButton></p>
            </a>
          </li>

        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">DASHBOARD</a>
          </div>
          </div>
      </nav>
      <!-- End Navbar -->
      <!-- <div class="panel-header panel-header-lg">

  <canvas id="bigDashboardChart"></canvas>


</div> -->
      <div class="content">
        <div class="row">
           <%-- <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="card card-stats">
                    <div class="card-body ">
                        <div class="row">
                            <div class="col-5 col-md-4">
                                <div class="icon-big text-center icon-warning">
                                    <i class="nc-icon nc-align-left-2 text-warning"></i>
                                </div>
                            </div>
                            <div class="col-7 col-md-8">
                                <div class="numbers">
                                    <p class="card-category">Total Product</p>
                                    <p class="card-title">
                                        150GB
                        <p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>--%>  
      </div>
         <div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead style="background-color :orange ">
                        <tr class="cart_menu">
                            <th style ="background-color :green ">Orders</th>
                            </tr>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description">name</td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td class="total">Status</td>
                            <td class="total">Userid</td>
                            <td class="total">USername</td>
                            <td class="total">Adress</td>
						</tr>
					</thead>
                     
                  	<tbody style="background-color :white">
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
								<p><asp:Label ID="Label4" runat="server" Text='<%#Eval("product_price") %>'/></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">

								 	<asp:label runat ="server" ID="cartqty" class="cart_quantity_input" Text ='<%#Eval("product_qty") %>' min="1" max="100" Style="text-align :center" oninput="validity.valid||(value='');" TextMode="Number" Width ="60"></asp:label> 
											</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("total") %>'></asp:Label></p>
							</td>
							<td class="cart_delete">
                                <asp:Label ID="delet" runat="server" Text='<%#Eval("status") %>' ></asp:Label><br />
                                 <asp:Label ID="time" runat="server" Text= '<%#Eval("datetime") %>'></asp:Label>
                                <asp:Button ID="delete" runat="server" OnClick ="delivered_Click" Text ="delivered" />
                                <asp:Button ID="Button1" runat="server" Text="cancel" OnClick ="cancel_Click"/>
                             </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("user_id") %>'></asp:Label></td>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text='<%#Eval("user_name") %>'></asp:Label></td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text='<%#Eval("address") %>'></asp:Label></td>
                           	</tr>
</ItemTemplate></asp:Repeater>
						
					</tbody>
                    
				</table>
			</div>
    </div>
  </div>
      </div> 
  <!--   Core JS Files   -->
  <script src="assets/js/core/jquery.min.js"></script>
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
</form>
</body>

</html>
<% }  
   
       else 
       {
           Response.Redirect("login.aspx");
           }
       %>