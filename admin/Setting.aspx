<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="admin_Setting" %>
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
    <form id="Form1" runat ="server" >
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
            <li class="active ">
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
            <a class="navbar-brand" href="#pablo">SETTING</a>
          </div>
          </div>
      </nav>
      <!-- End Navbar -->
      <!-- <div class="panel-header panel-header-lg">

  <canvas id="bigDashboardChart"></canvas>


</div> -->
        <div class="content">
           <div class ="row" >
       <div class="col-md-4">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">Add Product Category 
                </h5>
              </div>
              <div class="card-body">
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Category Name</label>
                        <asp:Textbox runat="server" ID ="categoryname" class="form-control" placeholder="Category name" ></asp:Textbox> 
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <asp:LinkButton runat="server" id="add" class="btn btn-primary btn-round" OnClick="add_Click">Add New Category</asp:LinkButton>
                      </div>
                    </div>
                  </div>
              </div>
            </div>

          </div>
              <div class="col-md-4">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">Update Product Category 
                </h5>
              </div>
              <div class="card-body">
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Category Name</label>
                        <asp:Textbox runat="server" ID ="Textbox3" class="form-control" placeholder="Category name" ></asp:Textbox> 
                          <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="category_name" DataValueField="category_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>              
                           <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                           </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-3 px-1">
                      <div class="form-group">
                     <asp:LinkButton runat ="server" ID ="delete"  class="btn btn-primary btn-round" OnClick="delete_Click">Delete Category</asp:LinkButton>
                     </div>
                    </div>
                  </div>
              </div>
            </div>

          </div>
                <div class="col-md-2">
            <div class="card card-user" style ="overflow-x :scroll  ; overflow-y :scroll ;height:300px;width :130px; ">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [category_name] FROM [Category]"></asp:SqlDataSource>
            </div>
          </div>
                <div class="col-md-4">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">Add Product  Brand
                </h5>
              </div>
              <div class="card-body">
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Brand Name</label>
                        <asp:Textbox runat="server" ID ="brand_name" class="form-control" placeholder="brand name" ></asp:Textbox> 
                      </div>
                    </div>
                      <div class="col-md-3 pr-1">
                      <div class="form-group">
                        <label>Category Id</label>
                        <asp:Textbox runat="server" ID ="categoryid" class="form-control" placeholder="Category ID" Visible ="false"  ></asp:Textbox> 
                          <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="category_name" DataValueField="category_id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>      
                      </div>
                    </div> <asp:LinkButton runat="server" id="LinkButton1" class="btn btn-primary btn-round"  OnClick="LinkButton1_Click">Add New Brand</asp:LinkButton>

                  </div>
                     </div>
            </div>
          </div>
                <div class="col-md-4">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">Update Product  Brand
                </h5>
              </div>
              <div class="card-body">
                  <div class="row">
                    <div class="col-md-8 pr-1">
                      <div class="form-group">
                        <label>Brand Name</label>
                        <asp:Textbox runat="server" ID ="Textbox1" class="form-control" placeholder="brand name" ></asp:Textbox> 
                      <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="brand_name" DataValueField="Id" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [brand_name] FROM [brands]" ></asp:SqlDataSource>
                      </div>
                    </div>
                      <div class="raw">
                       <div class="col-md-3 pr-1">
                      <div class="form-group">
                           <asp:LinkButton runat ="server" ID ="LinkButton4"  class="btn btn-primary btn-round" OnClick="LinkButton2_Click">Delete Brand</asp:LinkButton>
                      </div>
                           </div>
                    </div>
                  </div>
                       </div>
            </div>
          </div>
                      <div class="col-md-2">
            <div class="card card-user" style ="overflow-x :scroll  ; overflow-y :scroll; height:300px;width :130px; ">
           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <Columns>
                   
                   <asp:BoundField DataField="brand_name" HeaderText="brand_name" SortExpression="brand_name" />
                   
               </Columns>
               <EditRowStyle BackColor="#999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#E9E7E2" />
               <SortedAscendingHeaderStyle BackColor="#506C8C" />
               <SortedDescendingCellStyle BackColor="#FFFDF8" />
               <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [brands]"></asp:SqlDataSource>
            </div>
          </div>
                 <div class="col-md-8">
            <div class="card card-user">
              <div class="card-header">
                <h5 class="card-title">Admin Setting
                </h5>
                  <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataSourceID="SqlDataSource3">
                      <Columns>
                          <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                          <asp:BoundField DataField="email_id" HeaderText="email_id" SortExpression="email_id" />
                          <asp:BoundField DataField="mobile_no" HeaderText="mobile_no" SortExpression="mobile_no" />
                          <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                          <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                      </Columns>
                  </asp:GridView>
                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [user_name], [email_id], [mobile_no], [password], [address] FROM [user_data] WHERE ([admin] = 'yes')" UpdateCommand="update [user_data] set [user_name]=@user_name, [email_id]=@email_id, [mobile_no]=@mobile_no, [password]=@password, [address]=@address WHERE ([admin] = 'yes') ">
                      <SelectParameters>
                          <asp:Parameter DefaultValue="admin" Name="admin" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  <br />
                  <br />
              </div>
             
            </div>
          </div>
        </div>
      

   </div>
  </div> 
     < 
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