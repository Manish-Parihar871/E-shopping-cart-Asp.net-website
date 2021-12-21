<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_product.aspx.cs" Inherits="admin_add_product" %>
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
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet"/>
  <!-- CSS Files -->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
 </head>

<body class="">
    <form runat ="server" >
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
          <li >
            <a href="Dashboard.aspx">
              <i class="nc-icon nc-bank"></i>
              <p>Dashbord</p>
            </a>
          </li> 
            <li class="active ">
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
            <a href="Review.aspx">
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
            <a class="navbar-brand" href="#pablo">ADD PRODUCT</a>
          </div>
          </div>
      </nav>
      <!-- End Navbar -->
      <!-- <div class="panel-header panel-header-lg">

  <canvas id="bigDashboardChart"></canvas>


</div> -->
      <div class="content">
          <div class ="row">
              
       <div class="col-md-8">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title"></h5>
              </div>
              <div class="card-body">
                    <div class="row">
                     <div class="col-md-3 px-1">
                      <div class="form-group">
                        <label>Brand ID</label>
                       <asp:Label runat="server"   id = "brandid" name="Brands"  class="form-control" />
                          <asp:DropDownList runat="server" ID="branddrop"> </asp:DropDownList>
                       <asp:Button ID="Button2" runat="server" Text="Select" onClick="Button2_Click"/>
                 </div>
                    </div>
                         <div class="col-md-4 pr-1">
                     
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Category ID</label>
                           <asp:Label runat ="server"   id = "categoryid"  name="category"  class="form-control" visible="false"  />
                          <asp:DropDownList runat="server" ID="categoriesDrop" OnSelectedIndexChanged="categoriesDrop_SelectedIndexChanged" AutoPostBack="true" > </asp:DropDownList>
                        
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Product Name</label>
                        <asp:TextBox runat ="server" ID ="product_name" class="form-control" ></asp:TextBox> 
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label>Product Price</label>
                       <asp:TextBox runat ="server" ID ="product_price" class="form-control" TextMode="Number" MIN="0" oninput="validity.valid||(value='');"></asp:TextBox> 
                    </div>
                    </div>
                  </div>
                 
                  <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label>Product Image</label>
                          </div >
                              <asp:FileUpload ID="FileUpload1" runat="server" />
                             </div>
                          
                    </div>
                    <div class="col-md-4 px-1">
                      
                    </div>
                    <div class="col-md-4 pl-1">
                     
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Product Description</label>
                        <asp:TextBox runat ="server" ID ="product_desc" class="form-control textarea" TextMode="MultiLine" ></asp:TextBox> 
                      </div>
                    </div>
                  </div>
                     <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Product Link</label>
                        <asp:TextBox runat ="server" ID ="product_link" class="form-control" ></asp:TextBox> 
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                  <asp:LinkButton ID="LinkButton1" runat="server" OnClick ="addproduct_Click" class="btn btn-primary btn-round">Add Product</asp:LinkButton> 
                    </div>
                  </div>
               
              </div>
            </div>
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